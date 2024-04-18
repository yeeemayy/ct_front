import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/screens/reusable_widget/status_badge.dart';
import 'package:flutter/material.dart';

class DepositHistoryItem extends StatelessWidget {
  final int index;
  const DepositHistoryItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Constants.secondary_color,
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('12 Sep 2023 - 06:35:00',
                  style: TextStyle(fontSize: 10, color: Constants.grey_text)),
              StatusBadge(status: index)
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Deposit',
                    style:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                Text('\$ 50.00 (USDT)',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Constants.primary_color)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Type',
                  style: TextStyle(fontSize: 11, color: Constants.grey_text)),
              Text('Digital Currency', style: TextStyle(fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }
}
