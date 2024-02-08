import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../ApiServices/ChangePasswordApi.dart';
import '../Models/GeneralModel.dart';
import '../Widgets/CustomWidgets.dart';


class ChangePasswordViewModel extends GetxController {
  final ChangePasswordApi _apiService = ChangePasswordApi();
  var generalModel = GeneralModel().obs;

  Future<void> changePassword(String userId, String newPassword, BuildContext context) async {
    try {
      await EasyLoading.show(
        status: 'Changing Password...',
        maskType: EasyLoadingMaskType.black,
      );
print('new'+newPassword);
      final response = await ChangePasswordApi.changePassword(userId, newPassword);

      if (response.statusCode == 200) {
        ChangePassword_Dialog(context);

        // Get.snackbar('Success!', 'Password changed successfully');
      } else {
        var responseData = json.decode(response.body);
        generalModel(GeneralModel.fromJson(responseData));

        if (response.statusCode == 400) {
          print(generalModel.value.error);
          Get.snackbar('Error!', generalModel.value.error ?? 'Bad Request');
        } else {
          Get.snackbar('Error!', 'Failed to change password');
        }
      }
    } catch (e) {
      print('Error changing password: $e');
    } finally {
      await EasyLoading.dismiss();
    }
  }
}
