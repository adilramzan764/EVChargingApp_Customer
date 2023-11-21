import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../Utils/colors.dart';
import 'Amentities.dart';
import 'Anemeties_OptionsWidget.dart';
import 'ConnectionType_FilterWidget.dart';
import 'CustomButton.dart';
import 'CustomWidgets.dart';

class Filter_Widget extends StatefulWidget {

  @override
  State<Filter_Widget> createState() => _Filter_WidgetState();
}

class _Filter_WidgetState extends State<Filter_Widget> {
  List<String> brandicons =[
    'assets/audi.svg',
    'assets/tesla.svg',
    'assets/ferrari.svg',
    'assets/bmw.svg',

    'assets/porsche.svg',

  ];

  List<String> brandnames =[
    'Audi',
    'Tesla',
    'Ferarri',
    'BMW',
    'Porshe',

  ];
  bool isChecked = false;

  int selectedBrandIndex = 0;
  RangeValues _values = RangeValues(150, 250);

  final List<String> connectiontypes=[
    'Ac -type 2',
    'CSI!-Dc',
    'GB/T',
    'Wall',
    'Type 2',
    'Type 3'
  ];
  final List<String> parking=[
    'Accessible',
    'Pull through',
    'Pull in',
    'Trailerfriendly'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15), // Increase the radius as needed
          topRight: Radius.circular(15), // Increase the radius as needed
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
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
          Center(child: Text('Filter',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
          SizedBox(height: 10,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child:             Text('Brands',style: TextStyle(fontSize: 13),textAlign: TextAlign.center,),
            
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.005,),
                  Container(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: brandicons.length, // Replace with the actual number of items
                      itemBuilder: (context, index) {
                        // Access your data and create the widget
                        String icon = brandicons[index]; // Replace with how you access icon data
                        String brandname = brandnames[index]; // Replace with how you access brandname data
                        final isSelected = selectedBrandIndex == index;
            
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: InkWell(
                              onTap: (){
                                setState(() {
                                  selectedBrandIndex = index;
                                });
                              },
                              child: Carbrands_SignupWidget(icon, brandname,isSelected)),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:             Text('Kilowatt Range',style: TextStyle(fontSize: 13),textAlign: TextAlign.center,),
            
                  ),
            
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RangeSlider(
                      values: _values,
                      min: 0,
                      max: 400,
                      onChanged: (RangeValues newValues) {
                        setState(() {
                          _values = newValues;
                        });
                      },
                      activeColor: ColorValues.primaryblue,
                      // : ColorValues.green,
                      divisions: 100,
                      labels: RangeLabels(
                        _values.start.round().toString(),
                        _values.end.round().toString(),
                      ),
                    ),
                  ),
                  // SizedBox(height: 10,),
                  Text('${_values.start.round().toString()}kw-${_values.end.round().toString()}kw',style: TextStyle(color: ColorValues.primaryblue,fontSize: 13),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:             Text('Connector Type',style: TextStyle(fontSize: 13),textAlign: TextAlign.center,),
            
            
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.35,
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 1
                        ),
            
                      ],
            
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: connectiontypes.length,
                            itemBuilder: (context, index) {
                              return ConnectionType_FilterWidget(text: connectiontypes[index],);
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Show incompatible plugs', style: TextStyle(fontSize: 12, color: Colors.black)),
                            SizedBox(width: 5,),
                            InkWell(
                                onTap: (){},
                                child: Icon(CupertinoIcons.chevron_down,size: 14,))
            
                          ],
                        )
                      ],
                    )
            
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:             Text('Parking',style: TextStyle(fontSize: 13),textAlign: TextAlign.center,),
            
            
                  ),
                  SizedBox(height: 10,),
                  Container(
                      height: MediaQuery.of(context).size.height*0.23,
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 1
                          ),
            
                        ],
            
                      ),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: parking.length,
                        itemBuilder: (context, index) {
                          return ConnectionType_FilterWidget(text: parking[index],);
                        },
                      )
            
                  ),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:             Text('Amenities',style: TextStyle(fontSize: 13),textAlign: TextAlign.center,),


                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Anemeties_OptionsWidget(),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}