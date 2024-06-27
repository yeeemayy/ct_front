import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/constants/custom_icon_data.dart';
import 'package:ct_app/routes/routes.dart';
import 'package:ct_app/screens/asset/transaction_history_item.dart';
import 'package:ct_app/screens/reusable_widget/custom_number_paginator.dart';
import 'package:flutter/material.dart';

class Asset extends StatelessWidget {
  const Asset({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 4))]),
            child: Row(
              children: [
                const Expanded(
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
                ...[
                  {
                    'icon': CustomIconData.deposit,
                    'label': 'Deposit',
                    'onTap': () => Navigator.pushNamed(context, Routes.deposit)
                  },
                  {
                    'icon': CustomIconData.withdraw,
                    'label': 'Withdraw',
                    'onTap': () => Navigator.pushNamed(context, Routes.withdraw)
                  }
                ]
                    .asMap()
                    .map((i, e) => MapEntry(
                          i,
                          Padding(
                            padding: i == 0 ? const EdgeInsets.only(right: 20.0) : EdgeInsets.zero,
                            child: InkWell(
                              onTap: e['onTap'] as VoidCallback,
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Constants.secondary_color,
                                        borderRadius: BorderRadius.circular(8.0)),
                                    child: Center(
                                      child: Icon(
                                        e['icon'] as IconData,
                                        color: Constants.primary_color,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    e['label'] as String,
                                    style: const TextStyle(fontSize: 9),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))
                    .values],
            ),
          ),
          const SizedBox(height: 30),
          const Text('Transaction History', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          ...List.generate(3, (index) => const TransactionHistoryItem()),
          const Spacer(),
          const CustomNumberPaginator(),
          const SizedBox(height: kToolbarHeight),
        ],
      ),
    );
  }
}
