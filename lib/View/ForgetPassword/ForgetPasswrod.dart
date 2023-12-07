import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Widgets/BotttomSheet_ForgetPassword.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomTextField.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({Key? key}) : super(key: key);
   TextEditingController email=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true, // Enable keyboard handling

      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 1
              ),]),

            child: Column(

              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.06,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Transform.scale(
                        scale: 1.4,
                        child: SvgPicture.asset('assets/back.svg')),),
                    Text('Forgot  Password',style: TextStyle(fontSize: 16),),
                    SizedBox(height: 20,width: 20,),

                  ],
                ),
                SizedBox(height: 10,)
              ],
            ),
          ),
          SizedBox(height: 20,),
          SvgPicture.asset('assets/forgetpassword.svg',height: 130,width: 130,),
          SizedBox(height: 20,),
          Text('Forgot  Password',style: TextStyle(fontSize: 16),),
          SizedBox(height: 5,),

          Text('Recover your account password',style: TextStyle(color: Colors.grey.withOpacity(0.7),fontSize: 11),textAlign: TextAlign.center,),
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomTextField(icon: Transform.scale(
                scale: 0.4,
                child: SvgPicture.asset('assets/emial.svg',)), hinttext: 'Email', controller: email,),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),

          Container(
            height: 32,
            width: 140,
            child: CustomButton(text: 'Send', onPressed: (){
              showModalBottomSheet(
                context: context,

                shape: const RoundedRectangleBorder( // <-- SEE HERE
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(70.0),
                  ),
                ),
                isScrollControlled: true, // Enable full-screen behavior

                builder: (context) {
                  return BottomSheet_ForgetPassword(); // Use the custom widget
                },
              );
            }),
          ),


        ],
      ),
    );
  }
}
