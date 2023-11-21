import 'package:evchargingapp/Widgets/Filter_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Widgets/CustomWidgets.dart';
import '../../Widgets/StationDetails_Widget.dart';

class MapScreen extends StatefulWidget {
   MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
bool is_available_station_pressed=false;

   bool is_in_use_station_pressed=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/map.png'))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                TextField_Search(context),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                          // onTap: (){
                          //   setState(() {
                          //     is_in_use_station_pressed = !is_in_use_station_pressed;
                          //   });
                          // },
                          child: SvgPicture.asset('assets/station1.svg')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: InkWell(
                          onTap: (){
                            setState(() {
                              is_available_station_pressed = !is_available_station_pressed;
                              if(is_in_use_station_pressed)
                                is_in_use_station_pressed = !is_in_use_station_pressed;

                            });
                          },
                          child: SvgPicture.asset('assets/station2.svg')),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                      onTap: (){
                        setState(() {
                          is_in_use_station_pressed = !is_in_use_station_pressed;
                          if(is_available_station_pressed)
                            is_available_station_pressed = !is_available_station_pressed;
                        });
                      },
                      child: SvgPicture.asset('assets/station1.svg')),
                ),


                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircularButtons('assets/swap.svg', () {}, 45, 45),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CircularButtons('assets/filter.svg', () {
                    showModalBottomSheet(
                      context: context,

                      shape: const RoundedRectangleBorder( // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15.0),
                        ),
                      ),
                      isScrollControlled: true, // Enable full-screen behavior

                      builder: (context) {
                        return Filter_Widget(); // Use the custom widget
                      },
                    );
                  }, 45, 45),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: is_available_station_pressed || is_in_use_station_pressed ? MediaQuery.of(context).size.height * 0.02 : MediaQuery.of(context).size.height * 0.11),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircularButtons('assets/path.svg', () {}, 45, 45)),
                ),
                if(is_available_station_pressed )
                Padding(
                  padding:  EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.11),
                  child: StationDetails_Widget(isavailable: is_available_station_pressed,),
                ),
                if(is_in_use_station_pressed)
                  Padding(
                    padding:  EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.11),
                    child: StationDetails_Widget(isavailable: is_available_station_pressed,),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
