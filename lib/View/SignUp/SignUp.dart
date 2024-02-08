import 'package:evchargingapp/Models/SignUp_Model.dart';
import 'package:evchargingapp/View/SignUp/OTPScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Models/BuyerModel.dart';
import '../../Utils/colors.dart';
import '../../ViewModel/SendCode_VieModel.dart';
import '../../ViewModel/Signup_ViewModel.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomTextField.dart';
import '../../Widgets/CustomWidgets.dart';
import '../../Widgets/SnackBarManager.dart';

class SignUp extends StatelessWidget {
   SignUp({Key? key}) : super(key: key);
  final SignUp_ViewModel userViewModel = Get.put(SignUp_ViewModel());
TextEditingController firstname=TextEditingController();
   TextEditingController lastname=TextEditingController();
   TextEditingController phone=TextEditingController();
   TextEditingController email=TextEditingController();
   TextEditingController password=TextEditingController();


   final SendCode_ViewModel _controller = Get.put(SendCode_ViewModel());

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height *0.36,
                width: double.infinity,
                child: Image.asset('assets/signup.png',fit: BoxFit.cover,
                ),),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.68,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40),)
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                    
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Text('Sign Up',style: TextStyle(color: ColorValues.blackColor,fontWeight: FontWeight.bold,fontSize: 20),),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomTextField(icon: Transform.scale(
                              scale: 0.4,
                              child: SvgPicture.asset('assets/profile.svg',)), hinttext: 'First name', controller: firstname,),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                    
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomTextField(icon: Transform.scale(
                              scale: 0.4,
                              child: SvgPicture.asset('assets/profile.svg',)), hinttext: 'Last name', controller: lastname,),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                    
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomTextField(icon: Transform.scale(
                              scale: 0.4,
                              child: SvgPicture.asset('assets/call.svg',)), hinttext: 'Phone number', controller: phone,),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                    
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomTextField(icon: Transform.scale(
                              scale: 0.4,
                              child: SvgPicture.asset('assets/emial.svg',)), hinttext: 'Email', controller: email,),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                    
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomTextField(icon: Transform.scale(
                              scale: 0.4,
                              child: SvgPicture.asset('assets/Lock.svg',)), hinttext: 'Password', controller: password,),
                        ),
                    
                    
                        SizedBox(height: MediaQuery.of(context).size.height*0.045,),
                        Container(
                          height: 32,
                          width: 140,
                          child: CustomButton(text: 'Sign Up', onPressed: () async {

                            try {
                              // Show loading indicator
                              // await EasyLoading.show(
                              //   status: 'Signing Up...',
                              //   maskType: EasyLoadingMaskType.black,
                              // );

                              Buyer newUser = Buyer(
                                firstname: 'AR',
                                lastname: 'Ramzan',
                                email: 'arr2@gmail.com',
                                password: '11111111',
                                phone: '1234455',
                              );

                              _controller.email('adilramzan2002@gmail.com');
                              // userViewModel.createUser(newUser, context);

                              _controller.sendCode(context,newUser);


                              // Dismiss the loading indicator

                            } catch (error) {
                              // Dismiss the loading indicator in case of an error
                              await EasyLoading.dismiss();

                              print('Sign Up Error: $error');
                              SnackbarManager.showSnackbar(
                                title: 'Error!',
                                message: 'An error occurred',
                                context: context,
                              );
                            }







                          }),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Text('OR',style: TextStyle(color: Colors.grey,fontSize: 12),),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularButtons('assets/google.svg',(){},35,35),
                            SizedBox(width: 10,),
                            CircularButtons('assets/apple.svg',(){},35,35),
                    
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an Account?',style: TextStyle(color: Colors.grey,fontSize: 11),),
                            InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Text(' Sign In',style: TextStyle(color:ColorValues.primaryblue,fontSize: 11,fontWeight: FontWeight.bold),)),
                    
                    
                          ],
                        )
                    
                    
                    
                    
                    
                    
                    
                    
                    
                      ],
                    ),
                  ),
                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}
