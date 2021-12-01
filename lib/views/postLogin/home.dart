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
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          title: Text('Unify'),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          elevation: 0,
          automaticallyImplyLeading: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Unify',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(60),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () {
                  Common.loadingDialog();
                  _userController.signOut();
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Record Id: ${_userController.userIdFromFirebase.value}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
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
      ),
    );
  }
}
