import 'dart:convert';

import 'package:get/get.dart';

import '../ApiServices/GetBuyerinfo_Api.dart';
import '../Models/Car_Model.dart';
import '../Models/UserModel.dart';


class UserViewModel extends GetxController {
  var userExists =

      UserExists(
    id: '',
    firstName: '',
    lastName: '',
    email: '',
    password: '',
    phone: '',
    // profileImage: '',
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

  Future<void> getUserData() async {
    try {
      final response = await GetBuyerinfo_Api.getUserData();
      print('API Response: ${response.body}');

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        print('s Response: ${response.body}');

        var userData = UserExistsResponse.fromJson(responseData);

        userExists.value = userData.userExists!;
        print(userExists);
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      throw Exception('Failed to perform API call: $e');
    }
  }
}
