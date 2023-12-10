import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/SendCodeToMail_Model.dart';
import '../const/BaseURL.dart';


class OTP_Api{
  static Future<SendCodeToMail_Model> sendCodeToEmail(String email,int otp) async {
    String URL = "${baseUrl}sendCodeToEmail/$email/$otp"; // Replace 'baseUrl' with your actual base URL.
    print(URL);
    // print('done');

    final response = await http.post(
      Uri.parse(URL),

    );
    print(response.body);
    final String res = response.body;
print(response.statusCode);
    if (res.isNotEmpty) {
      try {
        print('done');

        final jsonData = json.decode(res) as Map<String, dynamic>;
        return SendCodeToMail_Model.fromJson(jsonData);
      } catch (e) {
        throw Exception("Failed to parse response");
      }
    }

    else if (response.statusCode == 200) {
      try {
        print('done');

        final jsonData = json.decode(res) as Map<String, dynamic>;
        final userResponseLogin = SendCodeToMail_Model.fromJson(jsonData);

        return userResponseLogin;
      } catch (e) {
        throw Exception("Failed to parse response");
      }
    }

    else if (response.statusCode == 500) {
      try {
        print('done');

        final jsonData = json.decode(res) as Map<String, dynamic>;
        final userResponseLogin = SendCodeToMail_Model.fromJson(jsonData);

        return userResponseLogin;
      } catch (e) {
        throw Exception("Failed to parse response");
      }
    } else {
      print('done');

      throw Exception("An error occurred");
    }
  }

}