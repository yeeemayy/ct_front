import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/custom_widgets/custom_tabbar.dart';
import 'package:ct_app/screens/chart/candle_chart.dart';
import 'package:ct_app/screens/reusable_widget/flag_stack.dart';
import 'package:ct_app/screens/trade/order_form.dart';
import 'package:flutter/material.dart';

class Trade extends StatefulWidget {
  const Trade({super.key});

  @override
  State<Trade> createState() => _TradeState();
}

class _TradeState extends State<Trade> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  String _selectedDuration = '1D';

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                FlagStack(
                    size: 28, country1: 'assets/images/usd.png', country2: 'assets/images/cny.png'),
                SizedBox(width: 25),
                Column(
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
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$ 26,673.79',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700, color: Constants.red),
                    ),
                    Text(
                      '+0.6%',
                      style: TextStyle(
                          fontSize: 12, color: Constants.red, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
              height: 60,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                scrollDirection: Axis.horizontal,
                children: ['1M', '5M', '15M', '30M', '1H', '1D']
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedDuration = e;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: e == _selectedDuration
                                    ? Constants.primary_color
                                    : const Color(0xffeeeeee),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              e,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: e == _selectedDuration
                                      ? Colors.white
                                      : Theme.of(context).textTheme.bodyMedium?.color),
                            ),
                          ),
                        ))
                    .toList(),
              )),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: CandleChart(),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CustomTabBar(
                  tabController: _tabController,
                  tabTitles: const ['Market Price', 'Pending Orders'],
                ),
                [const OrderForm(showAmount: false), const OrderForm()][_tabController.index]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
