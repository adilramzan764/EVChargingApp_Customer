import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../ApiServices/SignUpApi.dart';
import '../Models/SignUp_Model.dart';
import '../Models/UserModel.dart';
import '../View/SignUp/OTPScreen.dart';
import '../Widgets/SnackBarManager.dart';

class SignUp_ViewModel extends GetxController {
  final SignUpApi _apiService = SignUpApi();
  final RxBool isLoading = false.obs;

  Future<void> createUser(UserModel user, BuildContext context) async {
    try {
      isLoading(true);

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OTPScreen()),
        );
        // Show success message
        SnackbarManager.showSnackbar(
          title: 'Congrats!',
          message: 'Account Created successfully',
          context: context,
        );
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
