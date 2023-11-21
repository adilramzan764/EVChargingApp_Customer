import 'package:evchargingapp/View/SignIn/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../Utils/colors.dart';
import 'CustomButton.dart';

class BottomSheet_ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(70), // Increase the radius as needed
            topRight: Radius.circular(70), // Increase the radius as needed
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text(
              'Verify your Email',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Please enter the 4 Digit Code sent to',
              style: TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 11),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 3),
            Text(
              '@idperson.com',
              style: TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 11),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
              ),
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 45,
                  fieldWidth: 45,
                  activeColor: Colors.grey,
                  activeFillColor: Color.fromRGBO(36, 107, 253, 0.12),
                  inactiveColor: Colors.grey,
                  inactiveFillColor: Colors.grey[200],
                  selectedColor: ColorValues.primaryblue,
                  selectedFillColor: Colors.blueAccent,
                ),
                animationDuration: const Duration(milliseconds: 300),
                keyboardType: TextInputType.number,
                onCompleted: (v) {
                  debugPrint("Completed");
                },
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Container(
              height: 32,
              width: 140,
              child: CustomButton(text: 'Verify', onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()), // Replace NewScreen with the screen you want to navigate to
                      (Route<dynamic> route) => false, // This function defines the condition for removal
                );

              }),
            ),
          ],
        ),
      ),
    );
  }
}