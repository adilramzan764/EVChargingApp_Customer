import 'package:evchargingapp/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomWidgets.dart';
import '../AccountOption_Screens/AddCard.dart';

class SeltectPaymentMethod extends StatefulWidget {
  const SeltectPaymentMethod({Key? key}) : super(key: key);

  @override
  _SeltectPaymentMethodState createState() => _SeltectPaymentMethodState();
}

class _SeltectPaymentMethodState extends State<SeltectPaymentMethod> {
  int? selectedCard;

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
                      'Payment Methods',
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
          Container(
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your payment cards',
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  ),
                  SizedBox(height: 10),
                  buildPaymentCardRadio(
                      0, "assets/debit.png", "**** **** *456"),
                  buildPaymentCardRadio(
                      1, "assets/debit.png", "**** **** *780"),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentMethodProcess(), // Replace with your next screen widget.
                  ),
                );
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    color: ColorValues.lightblue,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                      '+ Add New Payment Method',
                      style: TextStyle(
                          color: ColorValues.primaryblue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    )),
              )),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Container(
              height: 32,
              width: 140,
              child: CustomButton(text: 'Done', onPressed: (){
                SlotBooked_Dialog(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => SeltectPaymentMethod(), // Replace with your next screen widget.
                //   ),
                // );
              }
              ))

        ],
      ),
    );
  }

  Widget buildPaymentCardRadio(int index, String imagePath, String cardNumber) {
    return Row(
      children: [
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
            child: Transform.scale(
              scale: 0.8,
              child: Radio<int>(
                value: index,
                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    // Change this color to the desired circle color
                    return Colors.blue;
                  }
                  // Return a different color for the unselected state if needed
                  return Colors.grey;
                }),
                activeColor: ColorValues.primaryblue, // Change this color to the desired fill color
                groupValue: selectedCard,
                onChanged: (value) {
                  setState(() {
                    selectedCard = value;
                  });
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
