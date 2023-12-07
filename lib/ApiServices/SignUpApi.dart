// api_service.dart

import 'dart:convert';
import 'package:evchargingapp/Models/SignUp_Model.dart';
import 'package:http/http.dart' as http;

import '../const/BaseURL.dart';

class SignUpApi {
  static Future<SignUp_Model> createUser(SignUp_Model signUp_Model) async {
    try {
      String URL = "${baseUrl}buyerSignUp"; // Replace 'baseUrl' with your actual base URL.
      var response = await http.post(
        Uri.parse(URL),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'firstname': signUp_Model.savedUser?.firstname,
          'lastname': signUp_Model.savedUser?.lastname,
          'email': signUp_Model.savedUser?.email,
          'password': signUp_Model.savedUser?.password,
          'phone': signUp_Model.savedUser?.phone,
        }),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        print('User Created api');
        return SignUp_Model.fromJson(jsonData);
      } else {
        print('Error: ${response.statusCode}');
        throw Exception('Failed to sign up user');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('An error occurred');
    }
  }
}
