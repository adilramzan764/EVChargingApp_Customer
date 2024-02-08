

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../ApiServices/AddVehicle_Api.dart';
import '../View/SignIn/SignIn.dart';

class AddVehicleBuyer extends GetxController {
  final AddVehicle_Api apiService = AddVehicle_Api();

  var userId = ''.obs;
  var brand = ''.obs;
  var model = ''.obs;
  var trim = ''.obs;
  var batteryCapacity = ''.obs;

  // Method to add buyer vehicle
  Future<void> addBuyerVehicle(BuildContext context) async {
    try {
      // Validate required fields
      if (userId.isEmpty) {
        Get.snackbar('Error', 'User Id is not given');
        return;
      }

      if (brand.isEmpty || model.isEmpty || trim.isEmpty || batteryCapacity.isEmpty) {
        Get.snackbar('Error', 'Required Fields are not given');
        return;
      }

      // Make API request using ApiService
      final response = await apiService.addBuyerVehicle(
        userId: userId.value,
        brand: brand.value,
        model: model.value,
        trim: trim.value,
        batteryCapacity: batteryCapacity.value,
      );
      print(response.body);

      // Check the response status
      if (response.statusCode == 200) {
        // Show loading indicator
        await EasyLoading.show(
          status: 'Almost there...',
          maskType: EasyLoadingMaskType.black,
        );
        await Future.delayed(const Duration(seconds: 2));

        await EasyLoading.dismiss();


        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SignIn()), // Replace NewScreen with the screen you want to navigate to
              (Route<dynamic> route) => false, // This function defines the condition for removal
        );
        Get.snackbar('Success!', 'Account Created Successfully');

      } else {
        Get.snackbar('Error', 'Failed to add vehicle. ${response.reasonPhrase}');
      }

    } catch (error) {
      print(error);
      Get.snackbar('Error', 'An error occurred');
    }
  }
}
