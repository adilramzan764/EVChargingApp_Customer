import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widgets/CustomWidgets.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isfilled = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
  final List<String> searches = [
    '21, Alex Davidson Avenue, Opposite Omegatron, Vicent',
    'Loss Angeles, CA',
    'Impark 202 3d ',

    // Add more items as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Row(
              children: [
                Back_Button(context),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Container(
                    height: 35,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          isfilled = hasFocus;
                        });
                      },
                      child: TextFormField(
                        focusNode: _focusNode,
                        decoration: InputDecoration(
                          prefixIcon: Transform.scale(
                            scale: 0.4,
                            child: SvgPicture.asset('assets/Search.svg'),
                          ),
                          hintText: 'Search for Charging point',
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.5),
                            fontSize: 11,
                          ),
                          fillColor: Colors.blue.withOpacity(0.1),
                          filled: isfilled,
                          focusColor: Colors.blue.withOpacity(0.3),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Transform.scale(
                        scale: 1.1,
                        child: SvgPicture.asset('assets/blue-filter.svg')),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Previous Search',style: TextStyle(color: Colors.black,fontSize: 12),),
            ),
            // SizedBox(height: 10,),
            Container(
              height: 50 *searches.length.toDouble(),
              child:
            ListView.builder(
              itemCount: searches.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Divider(color: Colors.grey.withOpacity(0.3),thickness: 1,),
                    SizedBox(height: 5,),
                    InkWell(
                      onTap: () {  },
                      child: Row(
                        children: [
                          Text(searches[index],style: TextStyle(fontSize: 12,color: Colors.grey.withOpacity(0.5)),),
                          Expanded(child: Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(onTap: () {  }, child: Icon(CupertinoIcons.multiply,size: 14,color: Colors.grey.withOpacity(0.8),),)))
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
            )



          ],
        ),
      ),
    );
  }
}
