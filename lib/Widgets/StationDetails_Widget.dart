import 'package:evchargingapp/Utils/colors.dart';
import 'package:evchargingapp/View/BookNow/SelectCharger.dart';
import 'package:evchargingapp/View/ViewStationDetails/ViewStationDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../View/GetDirections/Navigation.dart';
import 'CustomButton.dart';

class StationDetails_Widget extends StatelessWidget {
  bool isavailable;
   StationDetails_Widget({Key? key,required this.isavailable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1
          ),

        ],),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image:  AssetImage(
                              isavailable ? 'assets/st.jpg' : 'assets/st2.jpg'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isavailable ?
                      'DS Station' : 'Tesla Station ',
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Davidson Avenue, Vicent',
                      style: TextStyle(
                          color: Colors.grey.withOpacity(0.7), fontSize: 10),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xffF3B755),
                          size: 14,
                        ),
                        Text(
                          '4.8',
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        ),
                        Text(
                          '(30 Reviews)',
                          style: TextStyle(
                              color: Colors.grey.withOpacity(0.7),
                              fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Navigation(), // Replace with your next screen widget.
                        ),
                      );
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: ColorValues.primaryblue, shape: BoxShape.circle),
                      child: Center(
                        child: SvgPicture.asset('assets/directions.svg'),
                      ),
                    ),
                  ),
                ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width * 0.24,
                  child: CustomButton(
                      text: isavailable ? 'Available' :'In Use',
                      onPressed: () {
                        // Navigator.pushAndRemoveUntil(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => SignIn()), // Replace NewScreen with the screen you want to navigate to
                        //       (Route<dynamic> route) => false, // This function defines the condition for removal
                        // );
                      }),
                ),
                SizedBox(
                  width: 15,
                ),
                SvgPicture.asset('assets/location.svg'),
                SizedBox(
                  width: 3,
                ),
                Text(
                  '1.5km',
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(
                  'assets/car.svg',
                  height: 15,
                  width: 15,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  '7mins',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: double.infinity,
              color: ColorValues.lightblue.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Type 3',
                          style: TextStyle(fontSize: 11),
                        ),
                        Text(
                          'Connection',
                          style: TextStyle(
                              fontSize: 11, color: ColorValues.primaryblue),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    VerticalDivider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$30',
                          style: TextStyle(fontSize: 11),
                        ),
                        Text(
                          'Per hour',
                          style: TextStyle(
                              fontSize: 11, color: ColorValues.primaryblue),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    VerticalDivider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$0.1',
                          style: TextStyle(fontSize: 11),
                        ),
                        Text(
                          'Parking fee',
                          style: TextStyle(
                              fontSize: 11, color: ColorValues.primaryblue),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                  text: 'View',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewStationDetails(isavailable: isavailable,), // Replace with your next screen widget.
                      ),
                    );
                  },
                )),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: CustomButton(
                  text: 'Book',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectCharger(), // Replace with your next screen widget.
                      ),
                    );
                  },
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
