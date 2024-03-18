import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Amentities extends StatelessWidget {
List<String> amenities;
  Amentities({Key? key,required this.amenities}) : super(key: key);

  final List<String> icons=[
    'assets/dining.svg',
    'assets/restroom.svg',
    'assets/shopping.svg',
    'assets/loging.svg',
    'assets/park.svg',
    'assets/wifi.svg',
    'assets/grocery.svg',
    'assets/charge.svg',

  ];
  // final List<String>? anemities= amenities;
  // [
  //   'Dining',
  //   'Restroom',
  //   'Shopping',
  //   'Lodging',
  //   'Wifi',
  //   'Park',
  //   'grocery',
  //   'Charge',
  // ];
  @override
  Widget build(BuildContext context) {
    // final List<String>? anemities = amenities ;
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Number of columns
        crossAxisSpacing: 15.0, // Spacing between columns
        mainAxisSpacing: 10.0, // Spacing between rows
      ),
      itemCount: amenities.length, // Number of items in the grid
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0.5,
                  blurRadius: 0.5
              )
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: 10,),
              SvgPicture.asset(icons[index]),
              SizedBox(height: 5,),
              Text(
                amenities[index],
                style: TextStyle(color: Colors.black,fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }
}