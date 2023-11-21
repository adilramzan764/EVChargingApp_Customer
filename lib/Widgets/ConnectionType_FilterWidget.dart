import 'package:flutter/material.dart';

import '../Utils/colors.dart';

class ConnectionType_FilterWidget extends StatefulWidget {
  final String text;

  ConnectionType_FilterWidget({required this.text});
  @override
  _ConnectionType_FilterWidgetState createState() => _ConnectionType_FilterWidgetState();
}

class _ConnectionType_FilterWidgetState extends State<ConnectionType_FilterWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(widget.text, style: TextStyle(fontSize: 12, color: isChecked ? ColorValues.primaryblue : Colors.grey)),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: isChecked ? ColorValues.primaryblue : Colors.white,
                      border: Border.all(
                        color: isChecked ? ColorValues.primaryblue : Colors.grey, // Change the color accordingly
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: isChecked
                        ? Center(
                      child: Icon(
                        Icons.check,
                        size: 18,
                        color: Colors.white,
                      ),
                    )
                        : null,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Divider(color: Colors.grey.withOpacity(0.3), thickness: 1),
      ],
    );
  }
}
