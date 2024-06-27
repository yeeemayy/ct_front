import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/custom_widgets/custom_app_bar.dart';
import 'package:ct_app/screens/reusable_widget/custom_number_paginator.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class MyTeam extends StatelessWidget {
  const MyTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleStr: 'My Team'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Constants.secondary_color,
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Text('Total Number of Invites', style: TextStyle(fontSize: 10)),
                        Spacer(),
                        Text('0',
                            style: TextStyle(
                                fontSize: 16,
                                color: Constants.primary_color,
                                fontWeight: FontWeight.w700)),
                      ],
                    )),
                    SizedBox(
                      height: 50,
                      child: VerticalDivider(color: Constants.primary_color.withOpacity(0.3)),
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Text('Total Profit & Loss', style: TextStyle(fontSize: 10)),
                        Spacer(),
                        Text('\$ 50.00',
                            style: TextStyle(
                                fontSize: 16,
                                color: Constants.primary_color,
                                fontWeight: FontWeight.w700)),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            ...List.generate(
                4,
                (index) => Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Constants.secondary_color,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('yy01',
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 2),
                                  constraints: BoxConstraints(minWidth: 70),
                                  decoration: BoxDecoration(
                                    color:
                                        index % 2 == 0 ? Constants.primary_color : Constants.grey1,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    index % 2 == 0 ? 'Trader' : 'Member',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: Constants.primary_color.withOpacity(0.3),
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total Deposit', style: TextStyle(fontSize: 11)),
                                    Text('\$50.00',
                                        style:
                                            TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total Profit & Loss', style: TextStyle(fontSize: 11)),
                                    Text('\$50.00',
                                        style:
                                        TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    )),
            Spacer(),
            CustomNumberPaginator(),
          ],
        ),
      ),
    );
  }
}
