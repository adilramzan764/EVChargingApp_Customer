import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:evchargingapp/Utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/Bookings_Widget.dart';
import 'CancelledBookings.dart';
import 'ComplettedBookings.dart';
import 'UpcomingBookings.dart';

class Bookings extends StatefulWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection); // Add listener for tab changes
  }

  // Method to handle tab selection and change text color
  void _handleTabSelection() {
    setState(() {}); // Trigger a rebuild when the tab is changed
  }

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
                child: Text(
                  'Bookings',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  backgroundColor: Colors.white,
                  unselectedBackgroundColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  tabs: [
                    Tab(
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width *0.28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Upcoming',
                            style: TextStyle(
                              color: _tabController.index == 0 ? ColorValues.primaryblue : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width *0.28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Completed',
                            style: TextStyle(
                              color: _tabController.index == 1 ? ColorValues.primaryblue : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width *0.28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Cancelled',
                            style: TextStyle(
                              color: _tabController.index == 2 ? ColorValues.primaryblue : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  controller: _tabController,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      UpcomingBookings(),
                      ComplettedBookings(),
                      CancelledBookings()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
