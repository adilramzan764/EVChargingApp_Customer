import 'package:evchargingapp/Utils/colors.dart';
import 'package:evchargingapp/View/BookNow/Summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomWidgets.dart';
import '../../Widgets/MonthandYearList_Widget.dart';
import '../../Widgets/Time_Widget.dart';

class Bookingslot extends StatefulWidget {
  Bookingslot({Key? key}) : super(key: key);

  @override
  State<Bookingslot> createState() => _BookingslotState();
}

class _BookingslotState extends State<Bookingslot> {
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  final List<int> years =
      List.generate(10, (index) => DateTime.now().year + index);

  String selectedMonth = 'January'; // Initial month selection
  int selectedYear = DateTime.now().year; // Initial year selection
  String _selectedTimeSlot = '';

  CalendarFormat _calendarFormat = CalendarFormat.week;

  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay = DateTime.now();

  String _selectedDate = DateFormat('EEE, MMMM d').format(DateTime.now());

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
                      DropdownWidget(),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TableCalendar(
                    availableCalendarFormats: const {
                      CalendarFormat.week: 'Week', // Only show the week format
                    },
                    availableGestures: AvailableGestures.horizontalSwipe,
                    calendarFormat: _calendarFormat,
                    firstDay: DateTime(2023),
                    lastDay: DateTime(2033),
                    focusedDay: _focusedDay,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    headerVisible: false,
                    daysOfWeekStyle: const DaysOfWeekStyle(
                        weekdayStyle: TextStyle(color: Colors.black),
                        weekendStyle: TextStyle(color: Colors.black)),
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                        _selectedDate =
                            DateFormat('EEE, MMMM d').format(selectedDay);
                      });
                    },
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
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
                              color: ColorValues.primaryblue,
                              shape: BoxShape.circle),
                          child: Text(
                            date.day.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
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

                  MyTimeWidget(),
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
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         SearchScreen(), // Replace with your next screen widget.
                        //   ),
                        // );
                      },
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
                  // SizedBox(height: 10,)
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Summary(), // Replace with your next screen widget.
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
