import 'package:evchargingapp/View/BottomNavigationBar/MyBottomNavigationBar.dart';
import 'package:evchargingapp/View/SignIn/SignIn.dart';
import 'package:evchargingapp/Widgets/StationDetails_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ViewModel/ChargingStations_ViewModel.dart';

class BookMarks extends StatelessWidget {
   BookMarks({Key? key}) : super(key: key);
final List<bool> isavailable=[
  true,
  false,
  true,
];
    ChargingStationViewModel chargingStationViewModel =
   SignIn.chargingStationViewModel;
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
                    blurRadius: 1),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'Bookmarks',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemCount: chargingStationViewModel.chargingStations.length, // Number of items in your list
                itemBuilder: (BuildContext context, int index) {
                  var station = chargingStationViewModel.chargingStations[index];
                  print("Station "+station.id);

                  // Return a widget for each item at the specified index
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StationDetails_Widget(isavailable: isavailable[index]),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.1,)
        ],
      ),
    );
  }
}
