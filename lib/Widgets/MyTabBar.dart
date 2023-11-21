import 'package:evchargingapp/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
           TabBar(
            padding: EdgeInsets.zero,
            labelColor: ColorValues.primaryblue,
            labelStyle: TextStyle(fontSize: 12),
            indicatorColor: ColorValues.primaryblue,
            // indicatorWeight: 1,
            indicatorPadding: EdgeInsets.zero,
             // indicator: BoxDecoration(
             //
             // ),
             // labelPadding: EdgeInsets.zero,

             indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 40,
                  width: 50,
                  child: Tab(text: 'Overview'),
                ),
              ), // First tab
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 40,
                  width: 50,
                  child: Tab(text: 'Chargers'),
                ),
              ), // Second tab
              Align(
                  alignment: Alignment.centerLeft,

                  child: Container(
                      height: 40,
                      width: 50,
                      child: Tab(text: 'Reviews'))), //
            ],
          ),
          Expanded(
            // height: MediaQuery.of(context).size.height*0.6,
            child: TabBarView(
              children: [
                // Content for Tab 1
Text('Tab 1'),
                // Content for Tab 2
                Text('Tab 2'),
                Text('Tab 3'),


              ],
            ),
          ),

        ],
      ),
    );
  }
}