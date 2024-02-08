import 'dart:convert';
import 'package:http/http.dart' as http;

import '../const/BaseURL.dart';

class ChangePasswordApi {
  static Future<http.Response> changePassword(String userId, String newPassword) async {
    try {
      const String URL = "${baseUrl}buyerchangePassword";

      // Create the request body
      final Map<dynamic, dynamic> body = {
        "userId":userId,
        "newPassword": newPassword
      };
      final jsonBody = jsonEncode(body);

      print(body);
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      // Make the POST request with form data
      final response = await http.post(
        Uri.parse(URL),
        headers: headers,
        body: jsonBody,
      );
      // Access headers


      print('Content-Type Header: ${response.headers}');
      return response;
    } catch (error) {
      print('Error: $error');
      throw Exception('An error occurred');
    }
  }
}
