import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CrashlyticsLandingPage extends StatelessWidget {
  CrashlyticsLandingPage({Key? key}) : super(key: key);

  String _crashlyticsId = 'crashlytics';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('Test Crashlytics'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
              Text(_crashlyticsId),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: (2 / 3).sw,
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseCrashlytics.instance.crash();
                  },
                  child: Text(
                    'Tap here to Manually Crash',
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
                    throw Error();
                    // List<String> test = ['a', 'b', 'c'];
                    // final getString = test[4];
                  },
                  child: Text(
                    'Tap here to make error',
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
                    List<String> test = ['a', 'b', 'c'];
                    final getString = test[4];
                  },
                  child: Text(
                    'Tap here to make error',
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
