import 'package:evchargingapp/Utils/colors.dart';
import 'package:evchargingapp/View/BookNow/SelectCharger.dart';
import 'package:evchargingapp/Widgets/CustomButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookNow_NavBar extends StatelessWidget {
  const BookNow_NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15),),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            button('assets/scan.svg', () { },context),
            SizedBox(width: 10,),
            button('assets/call-blue.svg', () { },context),
            SizedBox(width: 10,),
            Container(
                height: 40,
                width: MediaQuery.of(context).size.width*0.5,
                child: CustomButton(text: 'Book Now', onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectCharger(), // Replace with your next screen widget.
                    ),
                  );
                }))

          ],
        ),
      ),
    );
  }
}

Widget button(String icon, VoidCallback onpressed,BuildContext context){
  return           InkWell(
    onTap: onpressed,
    child: Container(
      height: 40,
      width: MediaQuery.of(context).size.width*0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: ColorValues.lightblue,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1
          )
        ],
      ),
      child: Transform.scale(
          scale: 0.5,
          child: SvgPicture.asset(icon)),),
  );
}
