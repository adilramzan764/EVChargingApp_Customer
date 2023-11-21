import 'package:evchargingapp/Utils/colors.dart';
import 'package:evchargingapp/View/BottomBarScreens/Bookings/Bookings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Models/ChargerModel.dart';
import '../../Widgets/CustomButton.dart';
import 'Booking.dart';

class SelectCharger extends StatefulWidget {
  const SelectCharger({Key? key}) : super(key: key);

  @override
  _SelectChargerState createState() => _SelectChargerState();
}

class _SelectChargerState extends State<SelectCharger> {
  List<ChargerModel> chargers = [
    ChargerModel(
      duration: '24 hours',
      availability: 'Available',
      type: 'Ac -type 2',
      power: '6.5kW',
    ),
    ChargerModel(
      duration: '24 hours',
      availability: 'Available',
      type: 'Ac -type 2',
      power: '6.5kW',
    ),
    ChargerModel(
      duration: '24 hours',
      availability: 'Available',
      type: 'Ac -type 2',
      power: '6.5kW',
    ),
    ChargerModel(
      duration: '24 hours',
      availability: 'Available',
      type: 'Ac -type 2',
      power: '6.5kW',
    ),
    // Add more ChargerModel items as needed
  ];

  int selectedChargerIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                  blurRadius: 1,
                ),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(CupertinoIcons.left_chevron,size: 15,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Select Charger',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 110 *chargers.length.toDouble(),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: chargers.length,
                itemBuilder: (BuildContext context, int index) {
                  ChargerModel charger = chargers[index];
                  bool isSelected = index == selectedChargerIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedChargerIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8),
                      child: Container(
                        height: 90,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: isSelected ? ColorValues.lightblue : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color:isSelected ? Colors.blue : Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    charger.duration,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                  Text(
                                    charger.availability,
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 12),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset('assets/plug.svg'),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        charger.type,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                      Text(
                                        charger.power,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),


          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          Container(
              height: 32,
              width: 140,
              child: CustomButton(text: 'Continue', onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Bookingslot(), // Replace with your next screen widget.
                  ),
                );
              }))
        ],
      ),
    );
  }
}