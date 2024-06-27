import 'package:ct_app/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final String titleStr;
  @override
  final bool centerTitle;
  @override
  final bool automaticallyImplyLeading;
  @override
  final List<Widget>? actions;

  CustomAppBar(
      {super.key,
      required this.titleStr,
      this.centerTitle = true,
      this.automaticallyImplyLeading = true,
      this.actions})
      : super(
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            shadowColor: Constants.grey1.withOpacity(0.5),
            automaticallyImplyLeading: automaticallyImplyLeading,
            elevation: 1,
            centerTitle: centerTitle,
            title: Text(
              titleStr,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            actions: actions);
}
