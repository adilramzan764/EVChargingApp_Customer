import 'dart:convert';
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../ApiServices/EditProfile_APi.dart';
import '../Models/BuyerModel.dart';
import '../Models/Car_Model.dart';
import '../Models/GeneralModel.dart';
import '../Models/UserModel.dart';
import 'UserViewModel.dart';


class EditProfileViewModel extends GetxController {
  final EditProfileApi _apiService = EditProfileApi();
  var generalModel = GeneralModel().obs;
  UserViewModel _userViewModel=Get.put(UserViewModel());
  var buyerdata =       UserExists(
    id: '',
    firstName: '',
    lastName: '',
    email: '',
    password: '',
    phone: '',
    profileImage: '',
    createdAt: '',
    updatedAt: '',
    v: 0,
    cars: Car(
      id: '',
      brand: '',
      model: '',
      trim: '',
      batteryCapacity: '',
      createdAt: '',
      updatedAt: '',
      v: 0,
    ),  ).obs;


  Future<void> updatebuyer(
      String userId,
      String firstName,
      String lastName,
      String email,
      String password,
      String phone,
      String profileImage,
      BuildContext context,
      ) async {
    try {
      // await EasyLoading.show(status: 'Updating...');

      await _apiService.updateProfile(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phone: phone,
        profileImagePath: profileImage,
      );

      _userViewModel.getUserData();


    } catch (e) {
      print('Error updating user: $e');
      Get.snackbar('Error!', 'Failed to update seller');
    } finally {
      await EasyLoading.dismiss();
    }
  }
}
