import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../ApiServices/Login_Api.dart';
import '../Models/LoginUser_Model.dart';
import '../const/BaseURL.dart';

class LoginViewModel extends GetxController {
  var isLoading = false.obs;
  var errorMessage = "".obs;
  var loginResponse = LogIn_Model().obs;

  Future<void> login(String email, String password) async {
    try {
      isLoading(true);
      errorMessage("");

      final userResponseLogin = await LoginApi.login(email, password);

      loginResponse(userResponseLogin);
      if (loginResponse.value.message == 'Login successful' &&
          loginResponse.value.id != null) {
        _login(loginResponse.value.id!);

      }
    } catch (e) {
      errorMessage("Failed to perform login: $e");
    } finally {
      isLoading(false);
    }
  }
  Future<void> storeUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', userId);
  }

  Future<void> _saveLoggedIn(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString("id", id);

  }
  void _login(String id) async {
    // Simulate a successful login

    await _saveLoggedIn(id);

  }
}
