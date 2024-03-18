import 'dart:convert';
import 'package:evchargingapp/Models/ReviewData_Model.dart';
import 'package:http/http.dart' as http;

import '../const/BaseURL.dart';

class GetReviews_Api {


  static Future<List<Review_Model>> getReviews(String stationid) async {
    final response = await http.get(Uri.parse('${baseUrl}getreviewsbystationId/${stationid}'));
    print("req "+response.request.toString());
    print("bbody "+response.body.toString());


    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['review'];
      return data.map((review) => Review_Model.fromJson(review)).toList();
    } else {
      throw Exception('Failed to load reviews');
    }
  }
}
