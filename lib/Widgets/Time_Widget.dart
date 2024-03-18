import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Utils/colors.dart';

class MyTimeWidget extends StatefulWidget {
  final Function(String, String, String) onTimeChanged;

  MyTimeWidget({required this.onTimeChanged});

  @override
  _MyTimeWidgetState createState() => _MyTimeWidgetState();
}

class _MyTimeWidgetState extends State<MyTimeWidget> {
  String selectAMPM = 'AM';
  final List<String> options = ['AM', 'PM'];
  double _sliderValue_hours = 3.0;
  int _discreteValue_hours = 3;
  double _sliderValue_minutes = 30.0;
  int _discreteValue_minutes = 30;
  String hours = '03';
  String minutes = '30';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Center(
                child: Text(_discreteValue_hours.toString(),
                    style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(width: 10),
            Text(':', style: TextStyle(fontSize: 16)),
            SizedBox(width: 10),
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Center(
                child: Text(_discreteValue_minutes.toString(),
                    style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(width: 15),
            Container(
              height: 35,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Center(
                child: DropdownButton<String>(
                  underline: Container(),
                  style: TextStyle(color: Colors.black, fontSize: 12),
                  icon: Icon(CupertinoIcons.chevron_down, color: Colors.black),
                  iconSize: 12,
                  value: selectAMPM,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectAMPM = newValue!;
                      widget.onTimeChanged(
                          hours, minutes, selectAMPM); // Callback function
                    });
                  },
                  items: options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hours',
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  )),
              Slider(
                value: _sliderValue_hours,
                activeColor: Colors.blue,
                thumbColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    _sliderValue_hours = value;
                    _discreteValue_hours =
                        value.round(); // Round to the nearest integer
                    hours = _discreteValue_hours.toString().padLeft(2, '0');
                    widget.onTimeChanged(
                        hours, minutes, selectAMPM); // Callback function
                  });
                },
                min: 1.0,
                max: 12.0,
                label:
                '$_discreteValue_hours', // Optional: Display a label on the slider thumb
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Minutes ',
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  )),
              Slider(
                value: _sliderValue_minutes,
                activeColor: Colors.blue,
                thumbColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    _sliderValue_minutes = value;
                    _discreteValue_minutes =
                        value.round(); // Round to the nearest integer
                    minutes =
                        _discreteValue_minutes.toString().padLeft(2, '0');
                    widget.onTimeChanged(
                        hours, minutes, selectAMPM); // Callback function
                  });
                },
                min: 1.0,
                max: 60.0,
                divisions:
                60, // Optional: Add divisions for discrete values
                label:
                '$_discreteValue_minutes', // Optional: Display a label on the slider thumb
              ),
            ],
          ),
        ),
      ],
    );
  }
}
