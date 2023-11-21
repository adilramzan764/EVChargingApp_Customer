import 'package:evchargingapp/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Chargers_Tab extends StatelessWidget {
  const Chargers_Tab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        itemCount: 5, // Number of items in your list
        itemBuilder: (BuildContext context, int index) {
          // Return a widget for each item at the specified index
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
            child: Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 1
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('24 hours',style: TextStyle(color: Colors.grey,fontSize: 12),),
                        Text('Available',style: TextStyle(color: ColorValues.green,fontSize: 12),),

                      ],
                    ),
                    Divider(color: Colors.grey.withOpacity(0.3),),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        SvgPicture.asset('assets/plug.svg'),
                        SizedBox(width: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ac -type 2',style: TextStyle(color: ColorValues.blackColor,fontSize: 12),),
                            Text('6.5kW',style: TextStyle(color: ColorValues.blackColor,fontSize: 12),),

                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
