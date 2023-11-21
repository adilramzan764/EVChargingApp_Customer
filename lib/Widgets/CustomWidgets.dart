import 'dart:math';
import 'dart:ui';

import 'package:evchargingapp/Utils/colors.dart';
import 'package:evchargingapp/View/BottomNavigationBar/MyBottomNavigationBar.dart';
import 'package:evchargingapp/View/SearchFilter/Search.dart';
import 'package:evchargingapp/View/SignUp/VehicleDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../View/GetDirections/Navigation.dart';
import 'CustomButton.dart';

Widget CircularButtons(
    String icon, VoidCallback onpressed, double height, double width) {
  return InkWell(
    onTap: onpressed,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
            )
          ]),
      child: Center(
        child: SvgPicture.asset(
          icon,
          height: 17,
          width: 17,
        ),
      ),
    ),
  );
}

Future<void> OTPConfirmationDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.38,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset('assets/done.svg'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Code confirmed ",
                  style: TextStyle(
                    fontSize: 17,
                    color: ColorValues.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "successfully! ",
                  style: TextStyle(
                    fontSize: 17,
                    color: ColorValues.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "We are almost there! Now we need to know a little more about you",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff77787A),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                  height: 32,
                  width: 140,
                  child: CustomButton(
                      text: 'Next',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                VehicleDetails(), // Replace with your next screen widget.
                          ),
                        );
                        // OTPConfirmationDialog(context); // Call the dialog function
                      }),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget Carbrands_SignupWidget(
  String icon,
  String brandname,
  bool isSelected,
) {
  return Container(
    height: 25,
    width: 70,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.3), spreadRadius: 1, blurRadius: 1)
      ],
      color: isSelected ? ColorValues.green : Colors.white,
      borderRadius: BorderRadius.circular(20),

      // border: Border.all(color: ColorValues.green)
    ),
    child: Row(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                // border: Border.all(color: ColorValues.green),
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 1)
                ]),
            child: Transform.scale(scale: 0.7, child: SvgPicture.asset(icon)),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          brandname,
          style: TextStyle(
              color: !isSelected ? ColorValues.green : Colors.white,
              fontSize: 9),
        )
      ],
    ),
  );
}

Widget TextField_Search(BuildContext context) {
  FocusNode _focusNode = FocusNode();

  return Container(
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
    child: Focus(
      onFocusChange: (hasFocus) {
        _focusNode.dispose();
      },
      child: TextFormField(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SearchScreen(), // Replace with your next screen widget.
            ),
          );
        },
        focusNode: _focusNode,
        decoration: InputDecoration(
          prefixIcon: Transform.scale(
              scale: 0.4, child: SvgPicture.asset('assets/Search.svg')),
          hintText: 'Search for Charging point',
          suffixIcon: Transform.scale(
              scale: 0.4, child: SvgPicture.asset('assets/microphone.svg')),
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
  );
}

Widget Back_Button(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pop(context);
    },
    child: Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          CupertinoIcons.left_chevron,
          size: 16,
        ),
      ),
    ),
  );
}

Widget CircularImage(String pic, double height, double width) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(pic), fit: BoxFit.cover)

        // boxShadow: [
        //
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 1,
        //
        //
        //   )
        // ]
        ),
  );
}

Widget EditProfile_TextField(String icon, String hintext) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: TextField(
      // controller: _textEditingController,
      decoration: InputDecoration(
        prefixIcon: Transform.scale(scale: 0.3, child: SvgPicture.asset(icon)),
        hintText: hintext,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: 13),
        // Hint text color
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5)), // Underline color
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: ColorValues.primaryblue), // Underline color
        ),
      ),
    ),
  );
}

Widget Topup_Button(String text, VoidCallback onpressed) {
  return InkWell(
    onTap: onpressed,
    child: Container(
      height: 22,
      width: 60,
      decoration: BoxDecoration(
          border: Border.all(color: ColorValues.primaryblue),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: ColorValues.primaryblue, fontSize: 10),
      )),
    ),
  );
}

Future<void> TopuoSuccess_Dialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.38,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset('assets/done.svg'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Topup Successful! ",
                  style: TextStyle(
                    fontSize: 17,
                    color: ColorValues.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "A total amount of \$64844 has been  added to your account",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff77787A),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                  height: 32,
                  width: 140,
                  child: CustomButton(
                      text: 'Next',
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyBottomNavigationBar()),
                          (route) => false,
                        );

                        // OTPConfirmationDialog(context); // Call the dialog function
                      }),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<void> ChangePassword_Dialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.38,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset('assets/done.svg'),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Password changed successfully!",
                    style: TextStyle(
                      fontSize: 17,
                      color: ColorValues.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "We recommend that you write down so you don't forget, okay?",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff77787A),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                  height: 32,
                  width: 140,
                  child: CustomButton(
                      text: 'Next',
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyBottomNavigationBar()),
                          (route) => false,
                        );

                        // OTPConfirmationDialog(context); // Call the dialog function
                      }),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<void> SlotBooked_Dialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.38,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset('assets/done.svg'),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Slot Booked successfully!",
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorValues.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "We recommend that you write down so you don't forget, okay?",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff77787A),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              color: ColorValues.lightblue,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 1)
                              ],
                            ),
                            child: Transform.scale(
                                scale: 0.5,
                                child: SvgPicture.asset('assets/scan.svg')),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 32,
                          width: 140,
                          child: CustomButton(
                              text: 'Get Directon',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Navigation(), // Replace with your next screen widget.
                                  ),
                                );

                                // OTPConfirmationDialog(context); // Call the dialog function
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget DirectionWidget(String hinttext, BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.06,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffFAFAFA),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  // spreadRadius: 1,
                ),
              ],
            ),
            child: TextField(
              style: TextStyle(fontSize: 13),
              onTap: () {
                // setState(() {
                //   _selectedIndex = index;
                //   _selectedTextFieldIndex = index;
                // });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  borderSide: BorderSide(color: Colors.grey.shade300

                      // width: 1.0,
                      ),
                ),
                contentPadding: EdgeInsets.only(
                  left: 8.0,
                  top: 45.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 8),
          child: Text(
            hinttext,
            style: TextStyle(
                color: ColorValues.primaryblue,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
        ),
      ],
    ),
  );
}
