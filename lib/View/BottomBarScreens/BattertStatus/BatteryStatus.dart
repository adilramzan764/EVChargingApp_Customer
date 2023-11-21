import 'package:evchargingapp/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../GetDirections/RouteSearch.dart';

class BatteryStatus extends StatelessWidget {
  const BatteryStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.28,
                width: double.infinity,
                color: ColorValues.skyblue,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.14, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tesla',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text(
                        'Model s-4',
                        style:
                            TextStyle(color: ColorValues.green, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.13),
                child: Center(child: Image.asset('assets/cartesla.png')),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.22,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorValues.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 1)
                          ],
                        ),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Battery')),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Last charge a week ago',
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(0.8),
                                      fontSize: 10),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            SvgPicture.asset(
                              'assets/batterystatus.svg',
                              height: 70,
                              width: 70,
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorValues.whiteColor,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 1)
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Distance',
                                    style: TextStyle(fontSize: 12)),
                                Text(
                                  '107Km',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text('1h 20min',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey.withOpacity(0.8))),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorValues.whiteColor,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 1)
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Climate', style: TextStyle(fontSize: 12)),
                                Text(
                                  '22 C',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text('Interior 26c',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey.withOpacity(0.8))),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorValues.whiteColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 1)
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nearest Station',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14),
                          ),
                          Text(
                            '10mins away ',
                            style:
                            TextStyle(color: Colors.grey.withOpacity(0.8), fontSize: 12),
                          ),
                        ],
                      ),
                      Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RouteSearch(), // Replace with your next screen widget.
                                  ),
                                );
                              },
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                    color: ColorValues.primaryblue, shape: BoxShape.circle),
                                child: Center(
                                  child: SvgPicture.asset('assets/directions.svg'),
                                ),
                              ),
                            ),
                          )),

                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(image: AssetImage('assets/neareststation.png'),fit: BoxFit.cover),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
