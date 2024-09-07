import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hiberus_jg/core/themes/themes.dart';

class Notifications {
  static showSnackBar({
    required String title, 
    required String message, 
    Color? color,
    int? duration
  }){
    return Get.snackbar(
      "", message,
      titleText: const SizedBox(),
      icon: const Icon(Icons.report_rounded, color: Colors.white),
      backgroundColor: color ?? AppColor.primaryColor,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      margin: const EdgeInsets.all(AppSizes.paddingLarge),
      duration: duration != null ? Duration(seconds: duration) : const Duration(seconds: 3),
    );
  }

  static showSnackBarError({
    required String title, 
    required String message, 
    Color? color,
    int? duration
  }){
    return Get.snackbar(
      title, message,
      icon: const Icon(Icons.dangerous_rounded, color: Colors.white),
      backgroundColor: color ?? Colors.red,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      margin: const EdgeInsets.all(AppSizes.paddingLarge),
      duration: duration != null ? Duration(seconds: duration) : const Duration(seconds: 3),
    );
  }

}
