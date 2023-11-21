import 'package:evchargingapp/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/TransactionHistoryModel.dart';

Widget Transactions_Widget(TransactionHistoryModel transactionHistoryModel) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 1),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transactionHistoryModel.location,
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                Text(
                  transactionHistoryModel.dateandtime,
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.7), fontSize: 10),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 18,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: transactionHistoryModel.location=='Topup Wallet' ? ColorValues.green : ColorValues.errorColor
                    ),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(child: Text(transactionHistoryModel.status,style: TextStyle(           color: transactionHistoryModel.location=='Topup Wallet' ? ColorValues.green : ColorValues.errorColor,fontSize: 10),)),
                )
              ],
            ),
            Expanded(child:
            Align(
              alignment: Alignment.centerRight,
              child: Text(transactionHistoryModel.amount,style: TextStyle(           color: transactionHistoryModel.location=='Topup Wallet' ? ColorValues.green : ColorValues.errorColor,fontSize: 15),) ,
            )),
            SizedBox(width: 10,),
            Icon(CupertinoIcons.right_chevron,size: 11,)

          ],
        ),
      ),
    ),
  );
}
