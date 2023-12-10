import 'dart:math';

import 'package:evchargingapp/Models/UserModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../ApiServices/SendCode_Api.dart';
import '../View/SignUp/OTPScreen.dart';
import '../Widgets/SnackBarManager.dart';

class SendCode_ViewModel extends GetxController {
  var email = "".obs;

  void setEmail(String value) {
    email.value = value;
  }

  int generateRandomCode() {
    // Generate a random 4-digit code
    final random = Random();
    return (1000 + random.nextInt(9000));
  }

   Future<void> sendCode(BuildContext context,UserModel newUser) async {
    try {

      final code = generateRandomCode();

      // Assuming OTP_Api requires both email and code as parameters
      await OTP_Api.sendCodeToEmail(email.value, code );
      await EasyLoading.show(
        status: 'Signing Up...',
        maskType: EasyLoadingMaskType.black,
      );

      print('done');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OTPScreen(otp: code,newuser: newUser,)),
      );
      // userViewModel.createUser(newUser, context);

      await EasyLoading.dismiss();

      SnackbarManager.showSnackbar(
        title: 'Action Required!',
        message: 'Code sent to email',
        context: context,
      );    } catch (error) {
      SnackbarManager.showSnackbar(
        title: 'Error!',
        message: 'Failed to send code: $error',
        context: context,
      );    }
  }
}
