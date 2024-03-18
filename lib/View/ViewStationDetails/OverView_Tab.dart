import 'package:evchargingapp/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../ViewModel/Station_ViewModel.dart';
import '../../Widgets/Amentities.dart';

class OverView_Screen extends StatelessWidget {
  Station_ViewModel? station_viewModel;

  OverView_Screen({Key? key,this.station_viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height: 15,),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Discription',style: TextStyle(fontSize: 16),)),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 1
                    )
                  ],
                  color: Colors.white
              ),
              child: Column(
                children: [
                  Text(
                    station_viewModel?.stations[0].description ?? "",
                    // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived  not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                    style: TextStyle(fontSize: 12),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {  },
                      child: Text(
                        "Read More",
                        style: TextStyle(fontSize: 13, color: ColorValues.primaryblue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Parking',style: TextStyle(fontSize: 16),)),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 40,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 1
                    )
                  ],
                  color: Colors.white
              ),
              child: Text('Accessible',style: TextStyle(fontSize: 14),),
            ),
            SizedBox(height: 20,),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Amenities',style: TextStyle(fontSize: 16),)),
            SizedBox(height: 10,),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Container(
                height: 160,
                width: double.infinity,
                child: Amentities(amenities: station_viewModel?.stations[0].amenities ?? [],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
