import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/CustomButton.dart';

class Language extends StatefulWidget {
   Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String selectedValue = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                    blurRadius: 1),
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
                        size: 16,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Language',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Select Language',
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'Which language do you prefer',
              style: TextStyle(color: Colors.black, fontSize: 11),
            ),
          ),
          // SizedBox(height: 2,),
          Center(
            child: Text(
              'to see in the application?',
              style: TextStyle(color: Colors.black, fontSize: 11),
            ),
          ),

          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Language',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              height: 40,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1
                  )
                ],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedValue,
                icon: Icon(CupertinoIcons.chevron_down,size: 14,),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.black),
                underline: SizedBox(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: <String>['English', 'Spanish', 'Hindi', 'Korean']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.07,),

          Container(
            height: 32,
            width: 140,
            child: CustomButton(text: 'Save', onPressed: (){

            }),
          ),
        ],
      ),
    );
  }
}
