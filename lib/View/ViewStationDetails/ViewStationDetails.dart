import 'package:carousel_slider/carousel_slider.dart';
import 'package:evchargingapp/Models/ReviewData_Model.dart';
import 'package:evchargingapp/View/ViewStationDetails/Reviews.dart';
import 'package:evchargingapp/Widgets/MyTabBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Utils/colors.dart';
import '../../ViewModel/Station_ViewModel.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomWidgets.dart';
import '../BookNow_NavBar/BookNow_NavBar.dart';
import 'Chargers_Tab.dart';
import 'OverView_Tab.dart';

class ViewStationDetails extends StatefulWidget {
  bool isavailable;
  Station_ViewModel? station_viewModel;


  ViewStationDetails({Key? key, required this.isavailable,this.station_viewModel}) : super(key: key);

  @override
  State<ViewStationDetails> createState() => _ViewStationDetailsState();
}

class _ViewStationDetailsState extends State<ViewStationDetails> {
  // final List<String> images =
  // [
  //   'assets/startter2.png',
  //   'assets/startter2.png',
  //   'assets/starter1.png',
  // ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> images = widget.station_viewModel?.stations[0].stationImages ?? [];

    return Scaffold(
      bottomNavigationBar: BookNow_NavBar(spots: widget.station_viewModel!.spots, servicehours: widget.station_viewModel!.stations[0].serviceHours,),
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                pinned: true,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Container(
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
                  iconSize: 10,
                ),
                title: Row(
                  children: [
                    SizedBox(),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child:
                        IconButton(
                          onPressed: () {  },
                          icon: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,

                                boxShadow: [

                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,


                                  )
                                ]
                            ),
                            child: Center(
                              child: SvgPicture.asset('assets/save_green.svg',height: 17,width: 17,),
                            ),

                          ),
                        )                      ),
                    ),
                  ],
                ),
                expandedHeight: MediaQuery.of(context).size.height * 0.64,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      Stack(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 300.0,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 2),
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              viewportFraction: 1.1,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                            ),
                            items: images.map((item) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                    ),
                                    child: Image.network(
                                      item,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                          Container(
                            height: 300,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 60,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15.0),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: images
                                              .asMap()
                                              .entries
                                              .map((entry) {
                                            int index = entry.key;
                                            return Container(
                                              width: 6.0,
                                              height: 6.0,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 2.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: _currentIndex == index
                                                    ? Colors.blueAccent
                                                    : Colors.white,
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.isavailable
                                          ? 'DS Station'
                                          : 'Tesla Station ',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'Davidson Avenue, Vicent',
                                      style: TextStyle(
                                          color: Colors.grey.withOpacity(0.7),
                                          fontSize: 10),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Color(0xffF3B755),
                                          size: 14,
                                        ),
                                        Text(
                                          '4.8',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10),
                                        ),
                                        Text(
                                          '(${widget.station_viewModel?.stations[0].reviews.length ?? ""} Reviews)',
                                          style: TextStyle(
                                              color:
                                                  Colors.grey.withOpacity(0.7),
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${widget.station_viewModel?.stations[0].perHourPrice?? " "}',
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: ColorValues.primaryblue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Per hour',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: ColorValues.blackColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: Colors.grey.withOpacity(0.3),
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width:
                                      MediaQuery.of(context).size.width * 0.24,
                                  child: CustomButton(
                                      text:
                                      widget.station_viewModel?.spots[0].status ?? " ",

                                      // widget.isavailable
                                      //     ? 'Available'
                                      //     : 'In Use',
                                      onPressed: () {}),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                SvgPicture.asset('assets/location.svg'),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  '1.5km',
                                  style: TextStyle(fontSize: 10),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                SvgPicture.asset(
                                  'assets/car.svg',
                                  height: 15,
                                  width: 15,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  '7mins',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: Colors.grey.withOpacity(0.3),
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    text: 'Get Direction',
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: CustomButton(
                                    text: 'Check In',
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: Colors.grey.withOpacity(0.3),
                              thickness: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    padding: EdgeInsets.zero,
                    labelColor: ColorValues.primaryblue,
                    labelStyle: TextStyle(fontSize: 12),
                    indicatorColor: ColorValues.primaryblue,
                    indicatorPadding: EdgeInsets.zero,
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
                          child: Tab(text: 'Reviews'),
                        ),
                      ), //
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              // Content for Tab 1
              MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  child: OverView_Screen(station_viewModel: widget.station_viewModel,)), // Content for Tab 2
              MediaQuery.removePadding(
                  context: context, removeTop: true, child: Chargers_Tab(spots: widget.station_viewModel?.spots() ??[], servicehours: widget.station_viewModel?.stations[0].serviceHours ?? "",)),
              Reviews(stationid:widget.station_viewModel?.stations[0].id ?? '' ,),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
