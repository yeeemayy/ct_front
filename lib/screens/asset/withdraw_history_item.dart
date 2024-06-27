import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/screens/reusable_widget/detail_row.dart';
import 'package:ct_app/screens/reusable_widget/status_badge.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class WithdrawHistoryItem extends StatelessWidget {
  final int index;
  const WithdrawHistoryItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Constants.secondary_color, borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('12 Sep 2023 - 06:35:00',
                        style: TextStyle(fontSize: 10, color: Constants.grey_text)),
                    StatusBadge(status: index)
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Withdraw',
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
                const DetailRow(title: 'Handling Fee (0%)', content: '0.00', padding: 4),
                const DetailRow(title: 'Total Received', content: '\$ 50.00 (MYR 200.00)', padding: 4),
                const SizedBox(height: 16)
              ],
            ),
            ExpandableNotifier(
                child: ScrollOnExpand(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expandable(
                        collapsed: const SizedBox(),
                        expanded: Column(
                          children: [
                            Divider(color: Constants.primary_color.withOpacity(0.5), thickness: 1),
                            const DetailRow(title: 'Bank Name', content: 'CIMB Bank', padding: 4),
                            const DetailRow(title: 'Bank Holder Name', content: 'Tan Ah Kau', padding: 4),
                            const DetailRow(title: 'Bank Account Number', content: '1234567890', padding: 4),
                            const DetailRow(title: 'Remark', content: 'Invalid bank account', padding: 4),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          var controller = ExpandableController.of(context, required: true)!;
                          return Center(
                            child: InkWell(
                              onTap: () {
                                controller.toggle();
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(   controller.expanded ? 'See Less': 'See More', style: const TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w700, color: Constants.primary_color
                                  ),),
                                  Icon(controller.expanded ? Icons.keyboard_arrow_up: Icons.keyboard_arrow_down, size: 20, color: Constants.primary_color)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}
