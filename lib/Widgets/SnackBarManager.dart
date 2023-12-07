import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarManager {
  static void showSnackbar({
    required String title,
    required String message,
    required BuildContext context,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      borderRadius: 20,
      backgroundColor: Colors.grey.shade300,
      duration: Duration(seconds: 3),
      margin: EdgeInsets.only(top: 8.0, left: 10, right: 10),
      icon: Icon(Icons.person, color: Colors.grey),
      shouldIconPulse: false,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.bounceInOut,
    );
  }
}