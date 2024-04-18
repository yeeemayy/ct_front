import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/constants/custom_icon_data.dart';
import 'package:ct_app/custom_widgets/custom_app_bar.dart';
import 'package:ct_app/screens/orders/order_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleStr: 'Order History'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: true
            ? Column(
                children: [
                  ...List.generate(5, (index) => OrderItem()),
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
                ],
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CustomIconData.no_record,
                      size: 80,
                      color: Color(0xffa8a8a8).withOpacity(0.5),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'No Record',
                      style: TextStyle(
                          fontSize: 11, color: Constants.grey_text, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
