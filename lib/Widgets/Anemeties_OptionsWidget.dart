import 'package:evchargingapp/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Anemeties_OptionsWidget extends StatefulWidget {
  @override
  _Anemeties_OptionsWidgetState createState() => _Anemeties_OptionsWidgetState();
}

class _Anemeties_OptionsWidgetState extends State<Anemeties_OptionsWidget> {
  final List<String> icons = [
    'assets/dining.svg',
    'assets/restroom.svg',
    'assets/shopping.svg',
    'assets/loging.svg',
    'assets/park.svg',
    'assets/wifi.svg',
    'assets/grocery.svg',
    'assets/charge.svg',
  ];
  final List<String> amenities = [
    'Dining',
    'Restroom',
    'Shopping',
    'Lodging',
    'Wifi',
    'Park',
    'grocery',
    'Charge',
  ];

  List<bool> selectedStates = List.generate(8, (index) => false);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Number of columns
        crossAxisSpacing: 15.0, // Spacing between columns
        mainAxisSpacing: 10.0, // Spacing between rows
      ),
      itemCount: 8, // Number of items in the grid
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedStates[index] = !selectedStates[index];
            });
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: selectedStates[index] ? ColorValues.primaryblue : Colors.white
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0.5,
                  blurRadius: 0.5,
                )
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: 10),
                SvgPicture.asset(
                  icons[index],
                  color: selectedStates[index] ? ColorValues.primaryblue : Colors.black,
                ),
                SizedBox(height: 5),
                Text(
                  amenities[index],
                  style: TextStyle(
                    color: selectedStates[index] ? ColorValues.primaryblue : Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
