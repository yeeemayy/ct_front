import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/custom_widgets/custom_elevated_button.dart';
import 'package:ct_app/custom_widgets/custom_input_quantity_field.dart';
import 'package:ct_app/custom_widgets/custom_text_field.dart';
import 'package:ct_app/screens/reusable_widget/detail_row.dart';
import 'package:flutter/material.dart';

class OrderForm extends StatefulWidget {
  final bool showAmount;
  const OrderForm({super.key, this.showAmount = true});

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final _amountController = TextEditingController();

  bool _setLoss = false;
  bool _takeProfit = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.showAmount) ...[
            CustomTextField(label: 'Amount', textEditingController: _amountController, labelFontSize: 16),
            const SizedBox(height: 8),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Set Loss'),
                      Checkbox(
                        value: _setLoss,
                        onChanged: (val) {
                          if (val != null) {
                            setState(() {
                              _setLoss = val;
                            });
                          }
                        },
                        activeColor: Constants.primary_color,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Constants.grey2),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 6,
                  child: CustomInputQuantityField(),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Take Profit'),
                        Checkbox(
                          value: _takeProfit,
                          onChanged: (val) {
                            if (val != null) {
                              setState(() {
                                _takeProfit = val;
                              });
                            }
                          },
                          activeColor: Constants.primary_color,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Constants.grey2),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ],
                    )),
                const Expanded(
                  flex: 6,
                  child: CustomInputQuantityField(),
                )
              ],
            ),
          ),
          const SizedBox(height: 4),
          const DetailRow(title: 'Each Lots', content: '1 Lots = 1000 XAUUSD'),
          const DetailRow(title: 'Estimated Handling Fee', content: '1.5'),
          const DetailRow(title: 'Estimated Margin', content: '100'),
          const DetailRow(title: 'Balance', content: '34373.5'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                Expanded(child: CustomElevatedButton(label: 'Buy', onPressed: () {})),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomElevatedButton(
                        label: 'Sell', onPressed: () {}, backgroundColor: Constants.red)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
