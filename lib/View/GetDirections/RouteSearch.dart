import 'package:evchargingapp/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomWidgets.dart';
import '../../Widgets/StationDetails_Widget.dart';
import 'Navigation.dart';

class RouteSearch extends StatefulWidget {
  const RouteSearch({Key? key}) : super(key: key);

  @override
  State<RouteSearch> createState() => _RouteSearchState();
}

class _RouteSearchState extends State<RouteSearch> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/map.png'))),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField_Search(context),
              ),
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
                          // setState(() {
                          //   is_available_station_pressed = !is_available_station_pressed;
                          //   if(is_in_use_station_pressed)
                          //     is_in_use_station_pressed = !is_in_use_station_pressed;
                          //
                          // });
                        },
                        child: SvgPicture.asset('assets/station2.svg')),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                    onTap: (){
                      // setState(() {
                      //   is_in_use_station_pressed = !is_in_use_station_pressed;
                      //   if(is_available_station_pressed)
                      //     is_available_station_pressed = !is_available_station_pressed;
                      // });
                    },
                    child: SvgPicture.asset('assets/station1.svg')),
              ),



              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              // Padding(
              //   padding: EdgeInsets.only(
              //       bottom: is_available_station_pressed || is_in_use_station_pressed ? MediaQuery.of(context).size.height * 0.02 : MediaQuery.of(context).size.height * 0.11),
              //   child: Align(
              //       alignment: Alignment.bottomRight,
              //       child: CircularButtons('assets/path.svg', () {}, 45, 45)),
              // ),

              // if(is_in_use_station_pressed)
              //   Padding(
              //     padding:  EdgeInsets.only(
              //         bottom: MediaQuery.of(context).size.height * 0.11),
              //     child: StationDetails_Widget(isavailable: is_available_station_pressed,),
              //   ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.35,
                    width:double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20) ,topLeft: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1)
                      ],
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: 5,
                            width: MediaQuery.of(context).size.width *0.3,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)

                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Center(child: Text('Route Search',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                        SizedBox(height: 20,),
                        DirectionWidget('From',context),
                        SizedBox(height: 10,),
                        DirectionWidget('To',context),
                        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                        Container(
                            height: 32,
                            width: 140,
                            child: CustomButton(text: 'Search', onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Navigation(), // Replace with your next screen widget.
                                ),
                              );
                            }
                            ))

                      ],
                    ),

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
