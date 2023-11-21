import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

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
                      'Privacy & Policy',
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('1 - Terms and Conditions',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)),
              SizedBox(height: 10,),
              Text('Text to Fill provides a flexible platform to sell your products or services so that you can focus on your sales provides a flexible latform to sell your products or services so that you can focus on.Text to Fill provides a flexible platform to sell your products or services so that you can focus on your sales provides a flexible latform to sell your produ',style: TextStyle(fontSize: 11)),
                  SizedBox(height: 20,),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('2 - Privacy Policy',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)),
                  SizedBox(height: 10,),
              Text('Text to Fill provides a flexible platform to sell your products or services so that you can focus on your sales provides a flexible latform to sell your products or services so that you can focus on.Text to Fill provides a flexible platform to sell your products or services so that you can focus on your sales provides a flexible latform to sell your produ. Text to Fill provides a flexible platform to sell your products or services so that you can focus on your sales provides a flexible latform to sell your products or services so that you can focus on.Text to Fill provides a flexible platform to sell your products or services so that you can focus on your sales provides a flexible latform to sell your produ',style: TextStyle(fontSize: 11)),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
