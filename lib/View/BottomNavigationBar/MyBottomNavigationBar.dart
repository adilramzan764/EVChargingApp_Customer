

import 'package:evchargingapp/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../BottomBarScreens/Account/Account.dart';
import '../BottomBarScreens/BattertStatus/BatteryStatus.dart';
import '../BottomBarScreens/BookMarks.dart';
import '../BottomBarScreens/Bookings/Bookings.dart';
import '../BottomBarScreens/MapScreen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _StackedBottomNavigationBarState createState() =>
      _StackedBottomNavigationBarState();
}

class _StackedBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    MapScreen(),
    BookMarks(),
    Bookings(),
    BatteryStatus(),
    Account()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _screens[_currentIndex],
          // if(_currentIndex==1)
            Positioned(
              left: 1.0.h,
              right: 1.0.h,
              bottom: 2.0.h,
              child: Container(
                height: 7.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.h),
                  boxShadow:  [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 1,
                        spreadRadius: 1
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    CustomBottomNavigationBar(
                      currentIndex: _currentIndex,
                      onTap: (int index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    // Padding(
                    //   padding: _currentIndex==0 ? EdgeInsets.only(left: 5.h) : _currentIndex==1 ? EdgeInsets.only(left: 13.h) : _currentIndex==2 ? EdgeInsets.only(left: 21.h) : _currentIndex==3 ? EdgeInsets.only(left: 29.h) : EdgeInsets.only(left: 37.h) ,
                    //   child: Icon(Icons.circle,color: ColorValues.primaryblue,size: 10,),
                    // )
                  ],
                ),
              ),

            ),

        ],
      ),
    );
  }
}



class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height*0.07, // Set your desired height here
      height: 7.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.h),
        boxShadow:  [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 1,
            spreadRadius: 1
          ),
        ],
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3.2.h),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor:  ColorValues.primaryblue,
          selectedLabelStyle: const TextStyle(fontSize: 0),
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            _buildNavItem("assets/map.svg", currentIndex, 0),
            _buildNavItem("assets/save.svg", currentIndex, 1),
            _buildNavItem("assets/car.svg", currentIndex, 2),
            _buildNavItem("assets/batterylevel.svg", currentIndex, 3),
            _buildNavItem("assets/profile.svg", currentIndex, 4),


          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(String iconPath, int currentIndex, int index) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          if(currentIndex==index)
          Icon(Icons.circle,color: ColorValues.primaryblue,size: 10,),

          SvgPicture.asset(
            iconPath,
            color: currentIndex == index ? ColorValues.primaryblue : null,
            width: 2.5.h,
            height: 2.5.h,
          ),
        ],
      ),
      label: '',
    );
  }
}