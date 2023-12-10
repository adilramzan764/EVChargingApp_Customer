import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../ApiServices/SignUpApi.dart';
import '../Models/SignUp_Model.dart';
import '../Models/UserModel.dart';
import '../View/SignUp/OTPScreen.dart';
import '../Widgets/CustomWidgets.dart';
import '../Widgets/SnackBarManager.dart';
import 'SendCode_VieModel.dart';

class SignUp_ViewModel extends GetxController {
  final SignUpApi _apiService = SignUpApi();
  final RxBool isLoading = false.obs;
  final SendCode_ViewModel _controller = Get.put(SendCode_ViewModel());


  Future<void> createUser(UserModel user, BuildContext context) async {
    try {
      // await EasyLoading.show(
      //   status: 'Signing Up...',
      //   maskType: EasyLoadingMaskType.black,
      // );
      SignUp_Model createdUser = await SignUpApi.createUser(
        SignUp_Model(
          savedUser: UserModel(
            firstname: user.firstname,
            lastname: user.lastname,
            email: user.email,
            password: user.password,
            phone: user.phone,
          ),
        ),
      );

      if (createdUser.message != null && createdUser.savedUser != null) {
        // await EasyLoading.dismiss();
        // _controller.email(user.email);

        // _controller.sendCode(context);

        OTPConfirmationDialog(context); // Call the dialog function

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => OTPScreen()),
        // );
        //
        // // Show success message
        // SnackbarManager.showSnackbar(
        //   title: 'Success!',
        //   message: 'Account has been created',
        //   context: context,
        // );
      } else  {
        // Show validation error message
        print(createdUser.message);
        SnackbarManager.showSnackbar(
          title: 'Error!',
          message: createdUser.message.toString(),
          context: context,
        );
      }

      print('User created: ${createdUser.message}');
    } catch (e) {
      // Show generic error message in case of an exception
      print('Error creating user: $e');
      // await EasyLoading.dismiss();

      SnackbarManager.showSnackbar(
        title: 'Error!',
        message: 'An error occurred',
        context: context,
      );
    } finally {
      isLoading(false);
    }
  }
}
