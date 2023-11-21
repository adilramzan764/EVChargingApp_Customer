import 'package:evchargingapp/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomWidgets.dart';

class SelectPaymentCard_Topup extends StatefulWidget {
   SelectPaymentCard_Topup({Key? key}) : super(key: key);

  @override
  State<SelectPaymentCard_Topup> createState() => _SelectPaymentCard_TopupState();
}

class _SelectPaymentCard_TopupState extends State<SelectPaymentCard_Topup> {
  bool isRadioSelected = true;
  int selectedCardIndex = -1;

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
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            // height: 40,
            // width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                ),
              ],
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     'Your payment cards',
                  //     style: TextStyle(color: Colors.black, fontSize: 13),
                  //   ),
                  // ),
                  SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Your payment cards',
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ),
                      SizedBox(height: 10,),

                      // First Container
                      buildPaymentCard(0, "assets/debit.png", "**** **** *456"),

                      // Second Container
                      buildPaymentCard(1, "assets/debit.png", "**** **** *789"),



                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          Container(
            height: 32,
            width: 140,
            child: CustomButton(text: 'Next', onPressed: (){
              TopuoSuccess_Dialog(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => SelectPaymentCard_Topup(), // Replace with your next screen widget.
              //   ),
              // );
            }),
          ),

        ],
      ),
    );
  }


  Widget buildPaymentCard(int index, String imagePath, String cardNumber) {
    return Row(
      children: [
        SizedBox(width: 5),
        Image.asset(imagePath),
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            cardNumber,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedCardIndex = index;
                });
              },
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: selectedCardIndex == index
                        ? Colors.blue // Selected color
                        : Colors.grey.withOpacity(0.5), // Unselected color
                  ),
                ),
                child: selectedCardIndex == index
                    ? Center(
                  child: Icon(
                    Icons.circle,
                    size: 12.0,
                    color: Colors.blue, // Selected color
                  ),
                )
                    : SizedBox(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
