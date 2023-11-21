import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/colors.dart';
import 'CustomButton.dart';

Widget StationDetails_Summary(BuildContext context){
  return           Container(
    margin: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1),
      ],
    ),
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
                        image: AssetImage('assets/st.jpg'),
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
                    'DS Station',
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Davidson Avenue, Vicent',
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.7),
                        fontSize: 10),
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
                        style: TextStyle(
                            color: Colors.black, fontSize: 10),
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
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: ColorValues.primaryblue,
                          shape: BoxShape.circle),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/call.svg',
                          color: Colors.white,
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
                    text: 'Available',
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
            height: 10,
          ),

        ],
      ),
    ),
  );

}

Widget ChargerDetails_Summary(BuildContext context){
  return                 Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Ac -type 2',
          style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(height: 10,),
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
                    '100kW',
                    style: TextStyle(fontSize: 11),
                  ),
                  Text(
                    'Units',
                    style: TextStyle(
                        fontSize: 11, color: ColorValues.primaryblue),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              VerticalDivider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '15:34 PM',
                    style: TextStyle(fontSize: 11),
                  ),
                  Text(
                    'Time',
                    style: TextStyle(
                        fontSize: 11, color: ColorValues.primaryblue),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              VerticalDivider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '1 hour',
                    style: TextStyle(fontSize: 11),
                  ),
                  Text(
                    'Duration',
                    style: TextStyle(
                        fontSize: 11, color: ColorValues.primaryblue),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              VerticalDivider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '2 june 23',
                    style: TextStyle(fontSize: 11),
                  ),
                  Text(
                    'Date',
                    style: TextStyle(
                        fontSize: 11, color: ColorValues.primaryblue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );

}