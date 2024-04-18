import 'package:ct_app/constants/constants.dart';
import 'package:flutter/material.dart';

class TransactionHistoryItem extends StatelessWidget {
  const TransactionHistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration:
          BoxDecoration(color: Constants.secondary_color, borderRadius: BorderRadius.circular(10)),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('12 Sep 2023 - 06:35:00',
              style: TextStyle(fontSize: 10, color: Constants.grey_text)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Withdraw', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                Text(
                  '- \$ 50.00',
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w700, color: Constants.primary_color),
                )
              ],
            ),
          ),
          Text('lorem ipsum dolor sit amet',
              style: TextStyle(fontSize: 11, color: Constants.grey_text)),
        ],
      ),
    );
  }
}
