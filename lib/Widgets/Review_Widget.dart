import 'package:evchargingapp/Models/ReviewData_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'CustomWidgets.dart';

class Review_Widget extends StatelessWidget {
  final Review_Model review;

  const Review_Widget({Key? key,required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            children: [
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: NetworkImage(review.buyerImage), fit: BoxFit.cover)

                  // boxShadow: [
                  //
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.5),
                  //     spreadRadius: 1,
                  //
                  //
                  //   )
                  // ]
                ),
              ),
              // CircularImage(review.buyerImage,42,42),
              SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(review.buyerName, style: TextStyle(fontSize: 13)),
                  Text(review.reviewDate, style: TextStyle(fontSize: 10,color: Colors.grey.withOpacity(0.6))),
                ],
              ),
              Expanded(child:
              Align(
                alignment: Alignment.centerRight,
                child:                           RatingBar.builder(
                  ignoreGestures: true,
                  updateOnDrag: false,
                  tapOnlyMode: false,
                  initialRating: review.reviewRating,
                  itemCount: 5,
                  itemSize: 16.0,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                    // You can handle the rating here
                  },
                ),

              ))

            ],
          ),
          SizedBox(height: 10,),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(review.reviewBody, style: TextStyle(fontSize: 11))),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
