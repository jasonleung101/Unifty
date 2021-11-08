import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/local_auth.dart';
import 'package:unify/views/postLogin/home.dart';
import 'package:unify/views/postLogin/secure.dart';

class UserController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  LocalAuthentication localAuth = LocalAuthentication();

  final Rx<User?> firebaseUser = Rx<User?>(null);
  final isDeviceSupported = false.obs;
  final authorized = false.obs;

  @override
  void onInit() {
    firebaseUser.bindStream(auth.authStateChanges());
    localAuth.isDeviceSupported().then((value) {
      isDeviceSupported(value);
    });
    super.onInit();
  }

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await auth.signInWithCredential(credential).then((value) {
      firebaseUser(value.user);
      Get.to(() => HomePage());
    }).catchError((onError) {
      Get.snackbar(
        "Error while sign in ",
        onError.message,
      );
    });
  }

  Future<void> signOut() async {
    await auth.signOut().then((value) {
      firebaseUser(null);
      Get.offAllNamed('/');
    }).catchError((onError) {});
  }

  Future<void> authenticateWithBiometrics() async {
    try {
      await localAuth.authenticate(
          localizedReason: 'Go to more secure shell',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);
      authorized(true);
      Get.to(() => SecurePage());
    } on PlatformException catch (e) {
      print(e);
      return;
    }
  }
}
