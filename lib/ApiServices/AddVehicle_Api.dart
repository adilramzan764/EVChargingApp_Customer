import 'dart:convert';
import 'package:http/http.dart' as http;

import '../const/BaseURL.dart';

class AddVehicle_Api {


  Future<http.Response> addBuyerVehicle({
    required String userId,
    required String brand,
    required String model,
    required String trim,
    required String batteryCapacity,
  }) async {
    final Map<String, dynamic> requestBody = {
      'userId': userId,
      'brand': brand,
      'model': model,
      'trim': trim,
      'batteryCapacity': batteryCapacity,
    };

    final response = await http.post(
      Uri.parse('${baseUrl}buyerVehicleAdd'), // replace with your actual endpoint
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    return response;
  }
}
