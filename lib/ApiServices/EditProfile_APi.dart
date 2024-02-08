import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../const/BaseURL.dart';

class EditProfileApi {
  Future<void> updateProfile({
    String? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? phone,
    String? profileImagePath, // Path to the profile image if needed
  }) async {
    try {
      var url = Uri.parse("${baseUrl}buyerInfoUpdate"); // Replace this with your actual API endpoint
      print("url "+url.toString());
      var request = http.MultipartRequest('Patch', url);

      // Add required parameters to the request body
      request.fields['userId'] = userId ?? '';
      if (firstName != null) request.fields['firstName'] = firstName;
      if (lastName != null) request.fields['lastName'] = lastName;
      if (email != null) request.fields['email'] = email;
      if (password != null) request.fields['password'] = password;
      if (phone != null) request.fields['phone'] = phone;

      // Handle profile image if provided
      if (profileImagePath != "") {
        var file = await http.MultipartFile.fromPath('profileImage', profileImagePath!);
        request.files.add(file);
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        // Success
        Get.snackbar('Success!', 'User Updated Successfully');

        print('User Info Updated successfully');
      } else {
        // Error
        print('Error updating user info: ${response.body}');
      }
    } catch (error) {
      // Exception/Error Handling
      print('Exception occurred: $error');
    }
  }
}
