import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:unify/controller/user_controller.dart';
import 'package:unify/widgets/common.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'User ID: ${_userController.firebaseUser.value?.uid}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'User email: ${_userController.firebaseUser.value?.email}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                _userController.isDeviceSupported.value
                    ? 'Your device support Biometrics'
                    : 'Your device does not support Biometrics',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: (2 / 3).sw,
                child: ElevatedButton(
                  onPressed: () {
                    Common.loadingDialog();
                    _userController.signOut();
                  },
                  child: Text(
                    'Log out',
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
                height: 20.h,
              ),
              SizedBox(
                width: (2 / 3).sw,
                child: ElevatedButton(
                  onPressed: () {
                    _userController.authenticateWithBiometrics();
                  },
                  child: Text(
                    'Go to secure',
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
