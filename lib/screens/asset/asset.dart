import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/constants/custom_icon_data.dart';
import 'package:ct_app/routes/routes.dart';
import 'package:ct_app/screens/asset/transaction_history_item.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class Asset extends StatelessWidget {
  const Asset({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 4))]),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('My Assets', style: TextStyle(fontSize: 14.5)),
                      Text('10,000.00',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                      Text('≈MYR 0.00', style: TextStyle(fontSize: 12, color: Constants.grey_text))
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, Routes.withdraw),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Constants.secondary_color,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: Icon(
                            CustomIconData.withdraw,
                            color: Constants.primary_color,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Withdraw',
                        style: TextStyle(fontSize: 9),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          Text('Transaction History', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          SizedBox(height: 8),
          ...List.generate(3, (index) => TransactionHistoryItem()),
          Spacer(),
          NumberPaginator(
            numberPages: 4,
            initialPage: 1,
            onPageChange: (int index) {},
            prevButtonContent: Icon(Icons.arrow_left),
            nextButtonContent: Icon(Icons.arrow_right),
            config: NumberPaginatorUIConfig(
                height: 40,
                buttonShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                buttonSelectedBackgroundColor: Constants.primary_color),
          ),
          SizedBox(height: kToolbarHeight),
        ],
      ),
    );
  }
}
