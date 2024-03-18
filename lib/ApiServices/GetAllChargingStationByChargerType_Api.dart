import 'package:http/http.dart' as http;

import '../const/BaseURL.dart';

class GetAllChargingStationByChargerType_Api {
  static Future<http.Response> getChargingStationData() async {
    final url = '${baseUrl}getstationbychargertype/Ac-Type2'; // Replace with your actual API endpoint
    print("API URL: $url");

    return await http.get(Uri.parse(url));
  }
}
