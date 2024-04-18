import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/screens/chart/area_chart.dart';
import 'package:ct_app/screens/reusable_widget/flag_stack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marquee/marquee.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/home-banner.png'),
          Container(
            decoration: BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide(color: Color(0xffDBE0E8)))),
            height: 46,
            child: Row(
              children: [
                Container(
                  color: Constants.secondary_color,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                  child: Text(
                    'Latest News',
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w700, color: Constants.primary_color),
                  ),
                ),
                Expanded(
                  child: Marquee(
                    text:
                        'Central Tanshi 10th Anniversary Celebration 10th Anniversary Celebration',
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            tabs: ['Forex', 'Metal', 'Oil', 'CFD', 'Crypto']
                .map(
                  (e) => Tab(
                    text: e,
                  ),
                )
                .toList(),
            isScrollable: true,
            dividerColor: Colors.transparent,
            padding: EdgeInsets.symmetric(vertical: 16),
            labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).textTheme.bodyMedium?.color),
            labelPadding: EdgeInsets.symmetric(horizontal: 25),
            unselectedLabelStyle: TextStyle(fontSize: 14),
            indicator: TabBarGradientIndicator(gradientColor: [
              Color(0xff004DA1).withOpacity(1),
              Color(0xff004DA100).withOpacity(0)
            ], indicatorWidth: 5),
            tabAlignment: TabAlignment.start,
          ),
          ...ListTile.divideTiles(
              context: context,
              tiles: List.generate(
                  10,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
                        child: Row(
                          children: [
                            FlagStack(
                                size: 28,
                                country1: 'assets/images/usd.png',
                                country2: 'assets/images/cny.png'),
                            SizedBox(width: 25),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'USDCNY',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'USD/CNY',
                                    style: TextStyle(fontSize: 11, color: Constants.grey_text),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '\$ 26,673.79',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Constants.red),
                                  ),
                                  Text(
                                    '+0.6%',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Constants.red,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            Expanded(child: SizedBox(height: 50, child: AreaChart()))
                          ],
                        ),
                      ))).toList()
        ],
      ),
    );
  }
}
