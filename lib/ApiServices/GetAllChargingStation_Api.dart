import 'package:http/http.dart' as http;

import '../const/BaseURL.dart';

class GetAllChargingStation_Api {
  static Future<http.Response> getChargingStationData() async {
    final url = '${baseUrl}getAllStations'; // Replace with your actual API endpoint
    print("API URL: $url");

    return await http.get(Uri.parse(url));
  }
}
