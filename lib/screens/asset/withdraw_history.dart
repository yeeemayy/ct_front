import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/custom_widgets/custom_app_bar.dart';
import 'package:ct_app/custom_widgets/single_child_scroll_view_expanded.dart';
import 'package:ct_app/screens/asset/withdraw_history_item.dart';
import 'package:ct_app/screens/reusable_widget/custom_number_paginator.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class WithdrawHistory extends StatelessWidget {
  const WithdrawHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleStr: 'Withdraw History'),
      body: SingleChildScrollViewExpanded(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset('assets/images/withdraw-bg.png', width: MediaQuery.of(context).size.width),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ...List.generate(3, (index) => WithdrawHistoryItem(index: index + 1)),
                  Spacer(),
                  CustomNumberPaginator(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
