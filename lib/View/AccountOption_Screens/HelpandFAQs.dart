import 'package:evchargingapp/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Widgets/CustomWidgets.dart';
import '../../Widgets/FAQS_Widget.dart';

class HelpandFAQs extends StatefulWidget {
   HelpandFAQs({Key? key}) : super(key: key);

  @override
  State<HelpandFAQs> createState() => _HelpandFAQsState();
}

class _HelpandFAQsState extends State<HelpandFAQs> {
bool ispressed1=false;
bool ispressed2=false;
bool ispressed3=true;
bool ispressed4=false;


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
                      'Help and FAQs',
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
            height: 20,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  FAQS_Widget('How can I become a member?',ispressed1,'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',(){
                    setState(() {
                      ispressed1 = !ispressed1;
                    });
                  }),
                  FAQS_Widget('What are the service hours?',ispressed2,'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',(){
                    setState(() {
                      ispressed2 = !ispressed2;
                    });
                  }),
                  FAQS_Widget('How do I track my order?',ispressed3,'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',(){
                    setState(() {
                      ispressed3 = !ispressed3;
                    });
                  }),
                  FAQS_Widget('How to cancel order',ispressed4,'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',(){
                    setState(() {
                      ispressed4 = !ispressed4;
                    });
                  }),
                  SizedBox(height: 30,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                        )
                      ],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Still need Help?',
                              style: TextStyle(color: ColorValues.primaryblue, fontSize: 14),
                            ),

                          ),
                          SizedBox(height: 15,),
                          InkWell(
                            onTap: () {  },
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.04,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/emial.svg',color: ColorValues.primaryblue,),
                                  SizedBox(width: 10,),
                                  Text(
                                    'Email us',
                                    style: TextStyle(color: Colors.black, fontSize: 12),
                                  ),
                                  Expanded(child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(CupertinoIcons.right_chevron,size: 12,),
                                  )
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          InkWell(
                            onTap: () {  },
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.04,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/call-blue.svg',color: ColorValues.primaryblue,),
                                  SizedBox(width: 10,),
                                  Text(
                                    'Call us',
                                    style: TextStyle(color: Colors.black, fontSize: 12),
                                  ),
                                  Expanded(child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(CupertinoIcons.right_chevron,size: 12,),
                                  )
                                  )
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  )


                  // SizedBox(height: 10,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
