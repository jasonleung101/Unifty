import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unify/services/auth_services.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
                'Authentication',
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
                  onPressed: () async {
                    UserCredential signin =
                        await AuthServices.signInWithGoogle();
                    print(signin.user?.email ?? '');
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
