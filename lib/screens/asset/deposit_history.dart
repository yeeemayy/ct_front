import 'package:ct_app/custom_widgets/custom_app_bar.dart';
import 'package:ct_app/screens/asset/deposit_history_item.dart';
import 'package:ct_app/screens/reusable_widget/custom_number_paginator.dart';
import 'package:flutter/material.dart';

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
                    (index) => DepositHistoryItem(index: index+1)),const Spacer(),
                const CustomNumberPaginator(),
                const SizedBox(height: kToolbarHeight)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
