import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/custom_widgets/custom_app_bar.dart';
import 'package:ct_app/screens/asset/deposit_history_item.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class DepositHistory extends StatefulWidget {
  const DepositHistory({super.key});

  @override
  State<DepositHistory> createState() => _DepositHistoryState();
}

class _DepositHistoryState extends State<DepositHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleStr: 'Deposit History'),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset('assets/images/withdraw-bg.png', width: MediaQuery.of(context).size.width),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ...List.generate(
                    3,
                    (index) => DepositHistoryItem(index: index+1)),Spacer(),
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
                SizedBox(height: kToolbarHeight)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
