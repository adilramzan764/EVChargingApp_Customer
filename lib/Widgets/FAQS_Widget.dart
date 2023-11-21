import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FAQS_Widget extends StatefulWidget {
  final String question;
  final bool isPressed;
  final String answer;
  final VoidCallback onPressed;

  FAQS_Widget(this.question, this.isPressed, this.answer, this.onPressed);

  @override
  _FAQsState createState() => _FAQsState();
}

class _FAQsState extends State<FAQS_Widget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.question,
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            Expanded(child:
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(onPressed: widget.onPressed, icon: Icon(widget.isPressed ? CupertinoIcons.chevron_up : CupertinoIcons.chevron_down  ,size: 14,),),
            ))
          ],
        ),

        if( widget.isPressed)
             Text(widget.answer,
          style: TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 12),
        )
           ,
        MediaQuery.removePadding(context: context,
            removeTop: true,
            child: Divider(color: Colors.grey.withOpacity(0.5),thickness: 1,))
      ],
    );
  }
}
