import 'package:evchargingapp/View/BottomNavigationBar/MyBottomNavigationBar.dart';
import 'package:evchargingapp/Widgets/CustomWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widgets/CustomButton.dart';

class PaymentMethodProcess extends StatefulWidget {
  const PaymentMethodProcess({Key? key}) : super(key: key);

  @override
  State<PaymentMethodProcess> createState() => _PaymentMethodProcessState();
}

class _PaymentMethodProcessState extends State<PaymentMethodProcess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 85,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            CupertinoIcons.left_chevron,
                            size: 16,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          'Add Card',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SvgPicture.asset("assets/card.svg"),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Card Holder",
                    style: TextStyle(color: Color(0xff8F92A1),fontSize: 12),
                  ),
                ),
              ),
              // SizedBox(height: 10),
EditProfile_TextField('assets/profile-grey.svg', 'Oguz Bulbul')   ,           SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Card Number",
                    style: TextStyle(color: Color(0xff8F92A1),fontSize: 12),
                  ),
                ),
              ),
              // SizedBox(height: 10),
              EditProfile_TextField('assets/cardnumber.svg', '946953'),
              Row(
                children: [
                  Expanded(
                    flex:1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "Expiry Date",
                            style: TextStyle(color: Color(0xff8F92A1), fontSize: 12),
                          ),
                        ),
                        EditProfile_TextField('assets/calender.svg', '28/09/2023'),
                      ],
                    ),
                  ),
                  SizedBox(width: 10), // Add spacing between the fields
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [SizedBox(height: 10),
                        Text(
                          "CVV",
                          style: TextStyle(color: Color(0xff8F92A1),fontSize: 12),
                        ),
                        SizedBox(height: 10),
                        EditProfile_TextField('assets/Lock.svg', '0 0 0'),
                      ],
                    ),
                  ),
                ],
              ),




              SizedBox(height: MediaQuery.of(context).size.height*0.06,),
              Container(
                  height: 32,
                  width: 140,
                  child: CustomButton(text: 'Save', onPressed: (){
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyBottomNavigationBar()),
                          (Route<dynamic> route) => false,
                    );

                  }
                  ))
            ],
          ),
        ),
      ),
    );
  }
}