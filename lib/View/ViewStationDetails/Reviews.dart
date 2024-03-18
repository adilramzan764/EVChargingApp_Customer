import 'package:evchargingapp/Models/ReviewData_Model.dart';
import 'package:evchargingapp/ViewModel/Reviews_ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rating_summary/rating_summary.dart';

import '../../Widgets/Review_Widget.dart';

class Reviews extends StatefulWidget {
  String stationid;

  Reviews({Key? key, required this.stationid}) : super(key: key);

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  ReviewViewModel reviewViewModel = ReviewViewModel();

  @override
  void initState() {
    reviewViewModel.fetchReviews(widget.stationid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Ratings', style: TextStyle(fontSize: 14)),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 1,
                          spreadRadius: 1
                      )
                    ]
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('3', style: TextStyle(fontSize: 16)),
                            SizedBox(width: 5),
                            RatingBar.builder(
                              ignoreGestures: true,
                              updateOnDrag: false,
                              tapOnlyMode: false,
                              initialRating: 3,
                              itemCount: 5,
                              itemSize: 22.0,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                                // You can handle the rating here
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text('${reviewViewModel.reviews.length} Reviews', style: TextStyle(fontSize: 14, color: Colors.grey)),
                        SizedBox(height: 10),
                        RatingSummary(
                          counter: 13,
                          showAverage: false,
                          average: 3.846,
                          counterFiveStars: 5,
                          counterFourStars: 4,
                          counterThreeStars: 2,
                          counterTwoStars: 1,
                          counterOneStars: 1,
                          labelCounterOneStars: 'Accuracy',
                          labelCounterTwoStars: 'Convenience',
                          labelCounterThreeStars: 'Communication',
                          labelCounterFourStars: 'Maintenance',
                          labelCounterFiveStars: 'Cleanliness',
                          labelCounterOneStarsStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                          labelCounterTwoStarsStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                          labelCounterThreeStarsStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                          labelCounterFourStarsStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                          labelCounterFiveStarsStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),

              Align(
                alignment: Alignment.centerLeft,
                child: Text('Reviews', style: TextStyle(fontSize: 14)),
              ),
              SizedBox(height: 10,),
              Container(
                height: 110*reviewViewModel.reviews.length.toDouble(),
                width: double.infinity,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: reviewViewModel.reviews.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5),
                      child: Review_Widget(review: reviewViewModel.reviews[index]),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
