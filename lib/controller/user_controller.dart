import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/local_auth.dart';
import 'package:unify/views/postLogin/create_user.dart';
import 'package:unify/views/postLogin/home.dart';
import 'package:unify/views/postLogin/secure.dart';

class UserController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  LocalAuthentication localAuth = LocalAuthentication();

  final Rx<User?> firebaseUser = Rx<User?>(null);
  final isDeviceSupported = false.obs;
  final authorized = false.obs;
  final userIdFromFirebase = "".obs;

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

    await auth.signInWithCredential(credential).then((value) async {
      firebaseUser(value.user);
      await getUsername();
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
      bool _authorized = await localAuth.authenticate(
          localizedReason: 'Go to more secure shell',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);
      authorized(_authorized);
      if (_authorized) {
        Get.to(() => SecurePage());
      }
    } on PlatformException catch (e) {
      print(e);
      return;
    }
  }

  Future<void> getUsername() async {
    CollectionReference _users = FirebaseFirestore.instance.collection('users');
    bool _isExist = false;
    await _users.get().then((value) {
      for (var record in value.docs) {
        (record.data() as Map).forEach((key, value) {
          if (key == 'email' && value == firebaseUser()?.email) {
            userIdFromFirebase(record.id);
            _isExist = true;
          }
        });
      }
    });
    Get.back();
    if (_isExist) {
      Get.to(() => HomePage());
    } else {
      Get.to(() => CreateUserPage());
    }
  }

  void createUser(String name) {
    CollectionReference _users = FirebaseFirestore.instance.collection('users');
    _users.add({
      'email': firebaseUser.value?.email,
      'name': name,
      'uid': firebaseUser.value?.uid,
    }).then((value) {
      userIdFromFirebase(value.id);
      Get.to(() => HomePage());
    }).catchError((onError) {
      Get.snackbar(
        "Error while creating user ",
        onError.message,
      );
    });
  }
}
