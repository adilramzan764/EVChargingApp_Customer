import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class DropdownWidget extends StatefulWidget {
  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  final List<int> years =
      List.generate(10, (index) => DateTime.now().year + index);

  String selectedMonth = 'Jan';
  int selectedYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ElevatedButton(
        //   onPressed: () {
        //     // Your logic here when the button is pressed
        //   },
        //   child: Text('$selectedMonth $selectedYear'),
        // ),
        // SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 25,
              width: MediaQuery.of(context).size.width * 0.18,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 1,
                      spreadRadius: 1)
                ],
              ),
              child: Center(
                child: DropdownButton<String>(
                  // isExpanded: false,
                  underline: Container(),
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  // Remove underline
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Icon(CupertinoIcons.chevron_down),
                  ),
                  iconSize: 12,
                  value: selectedMonth,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMonth = newValue!;
                    });
                  },
                  items: months.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 25,
              width: MediaQuery.of(context).size.width * 0.18,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 1,
                        spreadRadius: 1)
                  ]),
              child: Center(
                child: DropdownButton<int>(
                  underline: Container(),
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  // Remove underline
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Icon(CupertinoIcons.chevron_down),
                  ),
                  iconSize: 12,
                  value: selectedYear,
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedYear = newValue!;
                    });
                  },
                  items: years.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
