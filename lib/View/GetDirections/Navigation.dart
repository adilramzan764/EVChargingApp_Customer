import 'package:dotted_line/dotted_line.dart';
import 'package:evchargingapp/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomWidgets.dart';
import '../BottomNavigationBar/MyBottomNavigationBar.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

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
                child: Align
                  (alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyBottomNavigationBar()),
                              (route) => false,
                        );                      },
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
                    )),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircularButtons('assets/path.svg', () {}, 45, 45)),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.33,
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
                      Center(child: Text('Showing Locations along route',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                      Text('1445mi.',style: TextStyle(fontSize: 12,color: ColorValues.primaryblue),),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  SvgPicture.asset('assets/path.svg',color: ColorValues.primaryblue,),
                                  SizedBox(height: 8,),
                                  DottedLine(
                                    direction: Axis.vertical,
                                    alignment: WrapAlignment.center,
                                    lineLength: 50,
                                    lineThickness: 1.0,
                                    dashLength: 4.0,
                                    dashColor: ColorValues.primaryblue,
                                    dashRadius: 0.0,
                                    dashGapLength: 6.0,
                                    dashGapColor: Colors.transparent,
                                    dashGapRadius: 0.0,
                                  ),
                                  SizedBox(height: 5,),
                                  SvgPicture.asset('assets/location.svg',color: ColorValues.primaryblue,)
                                ],
                              )),
                          Expanded(
                            flex: 7,
                            child: Column(
                              children: [
                                DirectionWidget('From',context),
                                SizedBox(height: 10,),
                                DirectionWidget('To',context),
                              ],
                            ),
                          ),
                        ],
                      ),


                    ],
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
