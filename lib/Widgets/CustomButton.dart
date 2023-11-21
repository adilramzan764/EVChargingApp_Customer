import 'package:evchargingapp/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  CustomButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
return  Container(
  width: double.infinity,
  height: 32,
  decoration: BoxDecoration(
      borderRadius: text=='Available' || text=='In use' ?BorderRadius.circular(8) : BorderRadius.circular(25),
border: Border.all(
  color: text == 'View' || text=='Get Direction' ? ColorValues.primaryblue : Colors.transparent,
),
      color:text=='Available' ?   ColorValues.green:  text=='View' || text=='Get Direction' ? Colors.white : ColorValues.primaryblue
  ),
  child: ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      primary: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
    child:  text=='Get Direction' ?  Row(
      children: [
        SvgPicture.asset('assets/directions.svg',color: ColorValues.primaryblue,height: 12,width: 12,),
        Text('  Get Direction',style: TextStyle(fontSize: 14,color: ColorValues.primaryblue),)
      ],
    ) : Text(
      text,
      style: TextStyle(color: text=='View' ?ColorValues.primaryblue : Colors.white ,fontSize: text=='Available' || text=='In Use' ? 12.sp :14),
    ),
  ),
);
  }

}