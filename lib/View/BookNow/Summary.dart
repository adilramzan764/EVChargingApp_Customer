import 'package:evchargingapp/View/AccountOption_Screens/PaymentMethods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Socket/SocketManager.dart';
import '../../Utils/colors.dart';
import '../../ViewModel/ChargingStationsbyChargerType_ViewModel.dart';
import '../../ViewModel/Station_ViewModel.dart';
import '../../Widgets/Bookings_Widget.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/Summary_Widgets.dart';
import '../BottomBarScreens/MapScreen2.dart';
import 'SelectPaymentMethod.dart';

class Summary extends StatelessWidget {
  String spotname;
  String startedat;
  String duration;
  String capacity;
  String selecteddate;
   Summary({Key? key,required this.spotname, required this.startedat ,required this.duration,required this.capacity,required this.selecteddate}) : super(key: key);

   final SocketManager socketManager = SocketManager();

  Station_ViewModel station_viewModel= MapPage2.station_viewModel;
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
                      icon: Icon(
                        CupertinoIcons.left_chevron,
                        size: 15,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Summary',
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
          StationDetails_Summary(context,station_viewModel.stations[0],),
          Container(
            height: MediaQuery.of(context).size.height * 0.385,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(15),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1),
              ],
            ),
            child: Column(
              children: [

                ChargerDetails_Summary(context,spotname,capacity,startedat,duration,selecteddate),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Capacity',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '20kW',
                      style: TextStyle(fontSize: 12,color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       'Charger Type ',
                //       style: TextStyle(fontSize: 12),
                //     ),
                //     Text(
                //       ,
                //       style: TextStyle(fontSize: 12,color: Colors.grey),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Charging Price',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '\$${station_viewModel.stations[0].perHourPrice} hour',
                      style: TextStyle(fontSize: 12,color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Parking Price',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '\$${station_viewModel.stations[0].parkingPrice} per minute',
                      style: TextStyle(fontSize: 12,color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Divider(color: Colors.grey.withOpacity(0.5),thickness: 1,),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '\$11223',
                      style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),


              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.06,),
          Container(
              height: 32,
              width: 200,
              child: CustomButton(text: 'Continue to Payment', onPressed: (){
                DateTime now = DateTime.now();

                Map<String, dynamic> bookingsData = {
                  'spotId': '65da603c2834572865b8fa8f',
                  'startedAt': now.toIso8601String(),  // Convert DateTime to string
                  'duration': '3',
                  'units': '400',
                  'stationId': '65da603c2834572865b8fa8c',
                  'chargingPrice': '4577',
                  'parkingPrice': '56',
                  'buyerId': '65aee3b5b278300a5f5381c9',
                  'buyerName': 'Ar Ramzan',
                  'buyerPhone': '1234455',
                  'chargerType': 'Ac-Type1',
                  'carName': 'tesla',
                };

                // Send booking data using SocketManager
                socketManager.sendBookings(bookingsData);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => SeltectPaymentMethod(), // Replace with your next screen widget.
                //   ),
                // );
              }
              ))
        ],
      ),
    );
  }
}
