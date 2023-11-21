import 'package:evchargingapp/View/SignUp/OTPScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/colors.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomTextField.dart';
import '../../Widgets/CustomWidgets.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

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
                              child: SvgPicture.asset('assets/profile.svg',)), hinttext: 'First name',),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                    
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomTextField(icon: Transform.scale(
                              scale: 0.4,
                              child: SvgPicture.asset('assets/profile.svg',)), hinttext: 'Last name',),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                    
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomTextField(icon: Transform.scale(
                              scale: 0.4,
                              child: SvgPicture.asset('assets/call.svg',)), hinttext: 'Phone number',),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                    
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomTextField(icon: Transform.scale(
                              scale: 0.4,
                              child: SvgPicture.asset('assets/emial.svg',)), hinttext: 'Email',),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                    
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomTextField(icon: Transform.scale(
                              scale: 0.4,
                              child: SvgPicture.asset('assets/Lock.svg',)), hinttext: 'Password',),
                        ),
                    
                    
                        SizedBox(height: MediaQuery.of(context).size.height*0.045,),
                        Container(
                          height: 32,
                          width: 140,
                          child: CustomButton(text: 'Sign Up', onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OTPScreen(), // Replace with your next screen widget.
                              ),
                            );
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
