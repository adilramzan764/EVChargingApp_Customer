import 'package:evchargingapp/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Models/BuyerModel.dart';
import '../../ViewModel/Signup_ViewModel.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomWidgets.dart';
import '../../Widgets/SnackBarManager.dart';

class OTPScreen extends StatelessWidget {
   int? otp;
   Buyer? newuser;
   OTPScreen({Key? key, this.otp,this.newuser}) : super(key: key);
  TextEditingController _otpController = TextEditingController();
   final SignUp_ViewModel userViewModel = Get.put(SignUp_ViewModel());

   Future<void> _startLoading(BuildContext context) async {
     // _timer?.cancel();

     await EasyLoading.show(
       status: 'Verifying...',
       maskType: EasyLoadingMaskType.black,
     );
     // await Future.delayed(Duration(seconds: 3));
     userViewModel.createUser(newuser!, context);


     // OTPConfirmationDialog(context); // Call the dialog function

     await EasyLoading.dismiss();


     // SnackbarManager.showSnackbar(
     //   title: 'Email Verification',
     //   message: 'Your Email has been successfully verified',
     //   context: context,
     // );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
                controller: _otpController,
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
                if (_otpController.text == otp.toString()) {
                  print("Entered OTP: " + _otpController.text);
                  print("Expected OTP: " + otp.toString());

                  _startLoading(context);
                }
                else{
                  SnackbarManager.showSnackbar(
                    title: 'Email Verification',
                    message: 'Invalid Pincode. Try Again!',
                    context: context,
                  );

                }

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
      ),
    );
  }
}
