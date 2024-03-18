import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  final Function(String, int) onSelectionChanged;

  DropdownWidget({required this.onSelectionChanged});

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

  final List<int> years = List.generate(10, (index) => DateTime.now().year + index);

  String selectedMonth = 'Jan';
  int selectedYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
                  underline: Container(),
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Icon(Icons.arrow_drop_down),
                  ),
                  iconSize: 12,
                  value: selectedMonth,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMonth = newValue!;
                      widget.onSelectionChanged(selectedMonth, selectedYear);
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
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Icon(Icons.arrow_drop_down),
                  ),
                  iconSize: 12,
                  value: selectedYear,
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedYear = newValue!;
                      widget.onSelectionChanged(selectedMonth, selectedYear);
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
