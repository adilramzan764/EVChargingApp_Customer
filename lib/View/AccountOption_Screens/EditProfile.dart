import 'package:evchargingapp/Utils/colors.dart';
import 'package:evchargingapp/Widgets/CustomButton.dart';
import 'package:evchargingapp/Widgets/CustomWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      body: SingleChildScrollView(
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
                      blurRadius: 1),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(icon: Icon(CupertinoIcons.left_chevron,size: 16,), onPressed: () {
                        Navigator.pop(context);
                      },),
                      Text(
                        'Edit Profile',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      SizedBox(height: 30,width: 30,)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Stack(
                children: [
                  CircularImage('assets/model.jpg', 80, 80),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: ColorValues.primaryblue,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(CupertinoIcons.camera_fill,size: 12,color: Colors.white,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            EditProfile_TextField('assets/profile-grey.svg','First name'),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            EditProfile_TextField('assets/profile-grey.svg','Last name'),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            EditProfile_TextField('assets/emial.svg','Email'),SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            EditProfile_TextField('assets/Location-grey.svg','Address'),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            EditProfile_TextField('assets/call.svg','Phone number'),

            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Container(
                height: 32,
                width: 140,
                child: CustomButton(text: 'Save', onPressed: (){}))



          ],
        ),
      ),
    );
  }
}
