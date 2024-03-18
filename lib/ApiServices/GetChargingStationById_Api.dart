import 'package:http/http.dart' as http;

import '../const/BaseURL.dart';

class GetAllChargingStationByid_Api {
  static Future<http.Response> getChargingStationData(String id) async {
    final url = '${baseUrl}getstationbyId/${id}'; // Replace with your actual API endpoint
    print("API URL: $url");

    return await http.get(Uri.parse(url));
  }
}
