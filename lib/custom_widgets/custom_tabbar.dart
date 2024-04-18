import 'package:ct_app/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> tabTitles;
  const CustomTabBar(
      {super.key, required this.tabController, required this.tabTitles});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Color(0xffededed),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TabBar(
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Constants.primary_color,
        ),
        labelColor: Colors.white,
        labelStyle: TextStyle(fontSize: 14),
        unselectedLabelColor: Colors.black,
        tabs: tabTitles.map((e) => Tab(text: e)).toList(),
      ),
    );
  }
}
