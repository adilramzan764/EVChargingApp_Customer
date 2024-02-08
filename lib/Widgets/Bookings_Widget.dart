import 'package:evchargingapp/View/BookNow/SelectCharger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Utils/colors.dart';
import '../View/GetDirections/Navigation.dart';
import '../View/ViewStationDetails/ViewStationDetails.dart';
import '../ViewModel/ChargingStations_ViewModel.dart';
import 'CustomButton.dart';

class Bookings_Widget extends StatefulWidget {
  bool isupcoming;  bool iscompleted;   bool iscancelled;



  Bookings_Widget({Key? key,required this.isupcoming, required this.iscompleted,required this.iscancelled}) : super(key: key);

  @override
  State<Bookings_Widget> createState() => _Bookings_WidgetState();
}

class _Bookings_WidgetState extends State<Bookings_Widget> {
  bool isavailable = true;

   bool switchValue = false;
  final ChargingStationViewModel chargingStationViewModel =
  ChargingStationViewModel();

   @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.38,
      // width: double.infinity,
      padding: widget.iscompleted ?EdgeInsets.all(8) : EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 1
          ),

        ],),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '15:34 PM',
                      style: TextStyle(
                          color: Colors.grey.withOpacity(0.7), fontSize: 10),
                    ),
                    Text(
                      '21 june 2023',
                      style: TextStyle(
                          color: Colors.grey.withOpacity(0.7), fontSize: 10),
                    ),

                  ],
                ),
                if(widget.isupcoming)
                Expanded(child:
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Remind me',
                    style: TextStyle(
                        color: ColorValues.primaryblue, fontSize: 10),
                  ),
                )),
                if(widget.isupcoming)

                  Transform.scale(
                    scale: 0.8,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      removeLeft: true,
                      removeRight: true,
                      child: Switch(

                      value: switchValue,
                      onChanged: (value) {
                        setState(() {
                          switchValue = value;
                        });
                      },
                      // activeTrackColor: Colors.white,
                      activeColor: ColorValues.primaryblue,
                    ),
                    ),
                  ),
                if(widget.iscompleted || widget.iscancelled)
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 60,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(8) ,

                            color:widget.iscompleted ?    ColorValues.green:   ColorValues.errorColor
                        ),
                        child: Center(
                          child: Text(
                            widget.iscompleted ? 'Completed' : 'Cancelled',
                            style: TextStyle(color: Colors.white ,fontSize:12.sp ),
                          ),
                        ),
                      ),
                    ),
                  )              ],
            ),
            SizedBox(
             height: MediaQuery.of(context).size.height * 0.01,
                          ),
            Divider(color: Colors.grey.withOpacity(0.3),thickness: 1,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    print("pressed");
                    chargingStationViewModel.getChargingStationData();
                    // if(chargingStationViewModel.chargingStations.isNotEmpty)
                    // print("Stations in model "+ chargingStationViewModel.chargingStations[0].id);
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image:  AssetImage(
                                isavailable ? 'assets/st.jpg' : 'assets/st2.jpg'),
                            fit: BoxFit.cover)),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isavailable ?
                      'DS Station' : 'Tesla Station ',
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Davidson Avenue, Vicent',
                      style: TextStyle(
                          color: Colors.grey.withOpacity(0.7), fontSize: 10),
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
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        ),
                        Text(
                          '(30 Reviews)',
                          style: TextStyle(
                              color: Colors.grey.withOpacity(0.7),
                              fontSize: 10),
                        ),
                      ],
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
                              builder: (context) => Navigation(), // Replace with your next screen widget.
                            ),
                          );
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              color: ColorValues.primaryblue, shape: BoxShape.circle),
                          child: Center(
                            child: SvgPicture.asset('assets/directions.svg'),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: double.infinity,
              color: ColorValues.lightblue.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/plug.svg',height: 18,width: 18,),
                        Text(
                          'Tesla Plug',
                          style: TextStyle(
                              fontSize: 11, color: ColorValues.primaryblue),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    VerticalDivider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '100kW',
                          style: TextStyle(fontSize: 11),
                        ),
                        Text(
                          'Max Power',
                          style: TextStyle(
                              fontSize: 11, color: ColorValues.primaryblue),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    VerticalDivider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '1 hour',
                          style: TextStyle(fontSize: 11),
                        ),
                        Text(
                          'Duration',
                          style: TextStyle(
                              fontSize: 11, color: ColorValues.primaryblue),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    VerticalDivider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$0.1',
                          style: TextStyle(fontSize: 11),
                        ),
                        Text(
                          'Amount',
                          style: TextStyle(
                              fontSize: 11, color: ColorValues.primaryblue),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            if(widget.isupcoming || widget.iscompleted)

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: CustomButton(
                      text: 'View',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewStationDetails(isavailable: isavailable,), // Replace with your next screen widget.
                          ),
                        );
                      },
                    )),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: CustomButton(
                      text: widget.isupcoming ? 'Charge Now' :'Book Again',
                      onPressed: () {
                        // if(widget.isupcoming  )
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Navigation(), // Replace with your next screen widget.
                          //   ),
                          // );
                        // else
                        if(!widget.isupcoming  )

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectCharger(), // Replace with your next screen widget.
                            ),
                          );
                      },
                    ))
              ],
            ),
            if(widget.iscancelled)
              Container(
                height:32 ,
                width: MediaQuery.of(context).size.width *0.4,
                child: CustomButton(
                  text: 'View',
                  onPressed: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => ViewStationDetails(isavailable: isavailable,), // Replace with your next screen widget.
                    //     ),
                    //   );
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
