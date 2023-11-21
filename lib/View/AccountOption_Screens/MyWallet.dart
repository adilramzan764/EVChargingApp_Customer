import 'package:evchargingapp/View/Topup/Topup_EnterAmountScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Models/TransactionHistoryModel.dart';
import '../../Utils/colors.dart';
import '../../Widgets/Transactions_Widget.dart';

class MyWallet extends StatelessWidget {
   MyWallet({Key? key}) : super(key: key);
List<TransactionHistoryModel> transactionhistory=[
TransactionHistoryModel(location: 'Davidson Avenue, Vicent', dateandtime: '21 june 2023 - 12:21AM', status: 'Paid', amount: '-\$1346'),
  TransactionHistoryModel(location: 'Topup Wallet', dateandtime: '21 june 2023 - 12:21AM', status: 'Paid', amount: '\$1346'),
  TransactionHistoryModel(location: 'Davidson Avenue, Vicent', dateandtime: '21 june 2023 - 12:21AM', status: 'Paid', amount: '-\$1346'),
  TransactionHistoryModel(location: 'Topup Wallet', dateandtime: '21 june 2023 - 12:21AM', status: 'Paid', amount: '\$1346'),

];
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
                    IconButton(icon: Icon(CupertinoIcons.left_chevron,size: 16,), onPressed: () {
                      Navigator.pop(context);
                    },),
                    Text(
                      'My Wallet',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(height: 50,width: 50,)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                SvgPicture.asset('assets/topupcard.svg'),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your Balance',style: TextStyle(fontSize: 13,color: Colors.white),),
                      Text('\$2000.12',style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.06,),

                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.43,
                          height: 29,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),

                              color: Colors.white
                          ),
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Topup_EnterAmountScreen(), // Replace with your next screen widget.
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child:   Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Top Up',style: TextStyle(fontSize: 14,color: ColorValues.blackColor),),
                                SizedBox(width: 10,),

                                SvgPicture.asset('assets/topup.svg',height: 12,width: 12,),
                              ],
                            )
                          ),
                        ),
                      )

                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transactions',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                Text(
                  'View all',
                  style: TextStyle(color: ColorValues.primaryblue, fontSize: 12),
                ),
              ],
            ),
          ),
SizedBox(height: 10,),
      Expanded(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            itemCount: transactionhistory.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 7.0),
                child: Transactions_Widget( transactionhistory[index]),
              );
            },
          ),
        ),
      )

        ],
      ),
    );
  }
}
