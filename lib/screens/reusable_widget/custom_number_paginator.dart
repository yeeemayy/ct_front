import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/constants/custom_icon_data.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class CustomNumberPaginator extends StatelessWidget {
  const CustomNumberPaginator({super.key});

  @override
  Widget build(BuildContext context) {
    return NumberPaginator(
      numberPages: 4,
      initialPage: 0,
      onPageChange: (int index) {},
      prevButtonContent: Icon(CustomIconData.keyboard_arrow_left, size: 12),
      nextButtonContent: Icon(CustomIconData.keyboard_arrow_right, size: 12),
      config: NumberPaginatorUIConfig(
          height: 40,
          buttonShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          buttonSelectedBackgroundColor: Constants.primary_color,
          buttonUnselectedForegroundColor: Constants.primary_color,
          buttonTextStyle: TextStyle(fontWeight: FontWeight.w700)),
    );
  }
}
