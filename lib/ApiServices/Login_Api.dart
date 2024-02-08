import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/LoginUser_Model.dart';
import '../const/BaseURL.dart';

class LoginApi {
  static Future<LogIn_Model> login(String email, String password) async {
    const String URL = "${baseUrl}login"; // Replace 'baseUrl' with your actual base URL.
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };

    final response = await http.post(
      Uri.parse(URL),
      body: json.encode(body),
      headers: {"Content-Type": "application/json"},
    );

    final String res = response.body;

    if (response.statusCode == 200 || response.statusCode == 401 || response.statusCode == 404 || response.statusCode == 400) {
      final jsonData = json.decode(res) as Map<String, dynamic>;
      final userResponseLogin = LogIn_Model.fromJson(jsonData);
      return userResponseLogin;
    } else {
      throw Exception("An error occurred");
    }
  }
}
