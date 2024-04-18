import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/constants/custom_icon_data.dart';
import 'package:ct_app/custom_widgets/custom_app_bar.dart';
import 'package:ct_app/custom_widgets/custom_elevated_button.dart';
import 'package:ct_app/routes/routes.dart';
import 'package:ct_app/screens/asset/amount_text_field.dart';
import 'package:ct_app/screens/reusable_widget/app_bar_action_button.dart';
import 'package:ct_app/screens/reusable_widget/detail_row.dart';
import 'package:flutter/material.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({super.key});

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleStr: 'Withdraw',
        actions: [AppBarActionButton(icon: CustomIconData.history, onTap: () => Navigator.pushNamed(context, Routes.withdraw_history))],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset('assets/images/withdraw-bg.png', width: MediaQuery.of(context).size.width),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AmountTextField(controller: _amountController),
                SizedBox(height: 24),
                Text('Withdraw Address',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 16),
                  decoration: BoxDecoration(
                      color: Constants.secondary_color, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      DetailRow(title: 'Bank Name', content: 'CIMB Bank', padding: 3),
                      DetailRow(title: 'Bank Holder Name', content: 'Tan Ah Kau', padding: 3),
                      DetailRow(title: 'Bank Account Number', content: '1234567890', padding: 3),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                DetailRow(title: 'Withdraw Amount', content: '\S 1.00', padding: 4),
                DetailRow(title: 'Handling Fee', content: '\S 0.00', padding: 4),
                DetailRow(title: 'Total Received', content: '\S 1.00', padding: 4),
                SizedBox(height: 40),
                Center(child: CustomElevatedButton(label: 'Withdraw', onPressed: () {}))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
