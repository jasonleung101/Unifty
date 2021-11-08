import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Common {
  static void loadingDialog() {
    Get.dialog(
      WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: SizedBox(
          width: Get.size.width,
          height: Get.size.height,
          child: Center(
            child: Container(
              width: Get.size.width * 0.3,
              height: Get.size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    SizedBox(
                      height: 16.h,
                    ),
                    const Material(
                      color: Colors.transparent,
                      child: Text("Loading"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
