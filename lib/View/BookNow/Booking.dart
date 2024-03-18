import 'package:evchargingapp/ViewModel/BookingSet_VM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Widgets/CustomButton.dart';
import '../../Widgets/MonthandYearList_Widget.dart';
import '../../Widgets/Time_Widget.dart';
import 'Summary.dart';


class Bookingslot extends StatelessWidget {
  final BookingSet_VM controller = Get.put(BookingSet_VM());
  Bookingslot({Key? key, String? spotname}) : super(key: key) {
    // Set the spotId value in the controller
    controller.spotname.value = spotname ?? ''; // Use an empty string or provide a default value if necessary
  }
  TextEditingController units= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.left_chevron,
                          size: 15,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        'Booking',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      SizedBox(
                        height: 50,
                        width: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 1,
                    spreadRadius: 1)
              ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select Date',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      DropdownWidget(
                        onSelectionChanged: controller.onSelectionChanged,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
              Obx(() =>  TableCalendar(
                    availableCalendarFormats: const {
                      CalendarFormat.week: 'Week',
                    },
                    availableGestures: AvailableGestures.horizontalSwipe,
                    calendarFormat: controller.calendarFormat.value,
                    firstDay: DateTime(2023),
                    lastDay: DateTime(2033),
                    focusedDay: controller.focusedDay.value,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    headerVisible: false,
                    daysOfWeekStyle: const DaysOfWeekStyle(
                        weekdayStyle: TextStyle(color: Colors.black),
                        weekendStyle: TextStyle(color: Colors.black)),
                    selectedDayPredicate: (day) {
                      return isSameDay(controller.selectedDay.value, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      controller.onDaySelected(selectedDay, focusedDay);
                    },

                    onFormatChanged: (format) {
                      controller.onFormatChanged(format);
                    },
                    calendarStyle: const CalendarStyle(
                      defaultTextStyle: TextStyle(color: Colors.black),
                      weekendTextStyle: TextStyle(color: Colors.black),
                      isTodayHighlighted: false,
                    ),
                    calendarBuilders: CalendarBuilders(
                      selectedBuilder: (context, date, events) {
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.blue, shape: BoxShape.circle),
                          child: Text(
                            date.day.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select your arrival Time',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyTimeWidget(
                    onTimeChanged: controller.onArrivalTimeChanged,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select your Departure Time',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyTimeWidget(
                    onTimeChanged: controller.onDepartureTimeChanged,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Units',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 35,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      onTap: () {},
                      controller: units,
                      decoration: InputDecoration(
                        hintText: '20KW',
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.5),
                          fontSize: 11,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Container(
              height: 32,
              width: 140,
              child: CustomButton(
                text: 'Book',
                onPressed: () {
                  controller.calculateAndStoreDuration();
                  print("arrival time ${controller.arrivalTime.value}" );
                  print("departure time ${controller.departureTime.value}" );

                  print('Stored Duration: ${controller.duration.value}');

                  Get.to(() => Summary(spotname: controller.spotname.value, startedat: controller.arrivalTime.value, duration: controller.duration.value, capacity: units.text, selecteddate: controller.selectedDate.value,));
                },
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
