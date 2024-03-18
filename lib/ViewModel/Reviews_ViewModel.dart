import 'package:evchargingapp/ApiServices/GetReviewsApi.dart';
import 'package:evchargingapp/Models/ReviewData_Model.dart';
import 'package:get/get.dart';

class ReviewViewModel extends GetxController {
  final RxList<Review_Model> reviews = <Review_Model>[].obs;




   void fetchReviews(String stationid) async {
    try {
      final List<Review_Model> fetchedReviews = await GetReviews_Api.getReviews(stationid);
      reviews.assignAll(fetchedReviews);
    } catch (e) {
      print('Error fetching reviews: $e');
    }
  }
}
