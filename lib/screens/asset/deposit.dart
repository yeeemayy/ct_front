import 'package:ct_app/constants/custom_icon_data.dart';
import 'package:ct_app/custom_widgets/custom_app_bar.dart';
import 'package:ct_app/custom_widgets/custom_tabbar.dart';
import 'package:ct_app/custom_widgets/single_child_scroll_view_expanded.dart';
import 'package:ct_app/routes/routes.dart';
import 'package:ct_app/screens/asset/bank_card.dart';
import 'package:ct_app/screens/asset/digital_currency.dart';
import 'package:ct_app/screens/reusable_widget/app_bar_action_button.dart';
import 'package:flutter/material.dart';

class Deposit extends StatefulWidget {
  const Deposit({super.key});

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> with SingleTickerProviderStateMixin {
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
    Widget child = Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset('assets/images/withdraw-bg.png', width: MediaQuery.of(context).size.width),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomTabBar(
                  tabController: _tabController, tabTitles: ['Digital Currency', 'Bank Card']),
              [DigitalCurrency(), BankCard()][_tabController.index]
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: CustomAppBar(
        titleStr: 'Deposit',
        actions: [
          AppBarActionButton(
              icon: CustomIconData.history,
              onTap: () => Navigator.pushNamed(context, Routes.deposit_history))
        ],
      ),
      body: _tabController.index == 0
          ? SingleChildScrollView(
              child: child,
            )
          : SingleChildScrollViewExpanded(child: child),
    );
  }
}
