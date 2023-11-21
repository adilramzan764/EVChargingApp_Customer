import 'package:evchargingapp/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomWidgets.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.18,),
          Center(child: Text('Enter the Code',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
          SizedBox(height: MediaQuery.of(context).size.height*0.005,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
            child: Text('We have just sent you a 4-digit code to example@gmail.com ',style: TextStyle(color: Colors.grey.withOpacity(0.7),fontSize: 11),textAlign: TextAlign.center,),

          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.06,),


          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: PinCodeTextField(
              appContext: context,

              length: 4,

              animationType: AnimationType.fade,

              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 50,
                fieldWidth: 50,
                activeColor: Colors.grey,
                activeFillColor: Color.fromRGBO(36, 107, 253, 0.12),
                inactiveColor: Colors.grey,
                inactiveFillColor: Colors.grey[200],
                selectedColor: ColorValues.primaryblue,
                selectedFillColor: Colors.blueAccent,              ),
              animationDuration: const Duration(milliseconds: 300),

              keyboardType: TextInputType.number,

              onCompleted: (v) {
                debugPrint("Completed");
              },
              // onTap: () {
              //   print("Pressed");
              // },
              onChanged: (value) {
                // debugPrint(value);
                // setState(() {
                //   currentText = value;
                // });
              },


            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.06,),

          Container(
            height: 32,
            width: 140,
            child: CustomButton(text: 'Next', onPressed: (){
              OTPConfirmationDialog(context); // Call the dialog function

            }),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.04,),
          Text('Did not receive?',style: TextStyle(color: Colors.grey.withOpacity(0.7),fontSize: 12),textAlign: TextAlign.center,),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          InkWell(
              onTap: (){},
              child: Text('Resend Code',style: TextStyle(color: ColorValues.primaryblue,fontSize: 12),textAlign: TextAlign.center,)),



        ],
      ),
    );
  }
}
