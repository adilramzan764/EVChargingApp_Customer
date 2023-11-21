import 'package:evchargingapp/Utils/colors.dart';
import 'package:evchargingapp/View/Topup/SelectPaymentCard_Topup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomWidgets.dart';

class Topup_EnterAmountScreen extends StatelessWidget {
  const Topup_EnterAmountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                    blurRadius: 1),
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
                      'Topup',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter the amount of Topup',
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    style: TextStyle(color: ColorValues.primaryblue),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 5, left: 5),

                      // hintText: 'Search for Charging point',

                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        fontSize: 11,
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Topup_Button('\$300',(){}),
                    SizedBox(width: 10,),
                    Topup_Button('\$5466',(){}),
                    SizedBox(width: 10,),
                    Topup_Button('\$7543',(){}),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                Container(
                  height: 32,
                  width: 140,
                  child: CustomButton(text: 'Next', onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectPaymentCard_Topup(), // Replace with your next screen widget.
                      ),
                    );
                  }),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
