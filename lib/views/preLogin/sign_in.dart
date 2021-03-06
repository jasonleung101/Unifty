import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:unify/controller/user_controller.dart';
import 'package:unify/views/crashlytics/landing.dart';
import 'package:unify/widgets/common.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SafeArea(
        bottom: false,
        child: Container(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
              SizedBox(
                height: (1 / 3).sh,
              ),
              Text(
                'FlutterFire',
                style: TextStyle(
                  color: Colors.yellow[700],
                  fontSize: 36.sp,
                ),
              ),
              Text(
                'Demo',
                style: TextStyle(
                  color: Colors.orange[800],
                  fontSize: 36.sp,
                ),
              ),
              SizedBox(
                height: (1 / 3).sh,
              ),
              SizedBox(
                width: (2 / 3).sw,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => CrashlyticsLandingPage());
                  },
                  child: Text(
                    'Test Firebase Crashlytics',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const StadiumBorder(),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                        vertical: 12.h,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: (2 / 3).sw,
                child: ElevatedButton(
                  onPressed: () {
                    Common.loadingDialog();
                    _userController.signInWithGoogle().catchError((e) {
                      Get.back();
                    });
                  },
                  child: Text(
                    'Sign in with Google',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const StadiumBorder(),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                        vertical: 12.h,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
