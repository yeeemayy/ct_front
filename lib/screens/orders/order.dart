import 'package:ct_app/custom_widgets/custom_tabbar.dart';
import 'package:ct_app/screens/orders/position_holding.dart';
import 'package:ct_app/screens/trade/order_form.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CustomTabBar(
            tabController: _tabController,
            tabTitles: ['Position Holding', 'Pending Orders'],
          ),
          [PositionHolding(), OrderForm()][_tabController.index]
        ],
      ),
    );
  }
}
