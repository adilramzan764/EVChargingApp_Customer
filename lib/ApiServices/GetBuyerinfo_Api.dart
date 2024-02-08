import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../const/BaseURL.dart';

class GetBuyerinfo_Api {
  static Future<http.Response> getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userId=  preferences.getString("id").toString();
    print("api id: $userId");

    // if (userId != null) {
      String apiUrl = '${baseUrl}getBuyerInfo/${userId}';
      print("API URL: $apiUrl");

      final response = await http.get(Uri.parse(apiUrl));
      print(response);
      return response;
    // } else {
    //   // Handle the case where the user ID is not available in SharedPreferences
    //   throw Exception("User ID not available in SharedPreferences");
    // }
  }
}
