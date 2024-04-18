import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/custom_widgets/custom_dropdown_button.dart';
import 'package:ct_app/custom_widgets/custom_elevated_button.dart';
import 'package:ct_app/screens/asset/amount_text_field.dart';
import 'package:ct_app/screens/reusable_widget/choose_file_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DigitalCurrency extends StatefulWidget {
  const DigitalCurrency({super.key});

  @override
  State<DigitalCurrency> createState() => _DigitalCurrencyState();
}

class _DigitalCurrencyState extends State<DigitalCurrency> {
  final _selectedNetwork = ValueNotifier<String?>(null);

  final _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select Network', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CustomDropdownButton<String>(
              hint: 'Select Network',
              items: ['USDC-ERC20', 'Item 2', 'Item 3'],
              valueListenable: _selectedNetwork,
              onChanged: (value) {
                _selectedNetwork.value = value;
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select a network';
                }
                return null;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)]),
            child: Column(
              children: [
                QrImageView(
                  data: '0x70161cB8d72306f244cA036140921A311e51b94b',
                  version: QrVersions.auto,
                  size: 155,
                ),
                Container(
                  padding: EdgeInsets.only(top: 13),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                      color: Constants.secondary_color),
                  child: Column(
                    children: [
                      Text('0x70161cB8d72306f244cA036140921A311e51b94b',
                          style: TextStyle(fontSize: 13)),
                      TextButton(
                        onPressed: () async {
                          await Clipboard.setData(
                              ClipboardData(text: '0x70161cB8d72306f244cA036140921A311e51b94b'));
                        },
                        child: Text('Copy'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 13,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w800)),
                        style: TextButton.styleFrom(foregroundColor: Constants.primary_color),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          AmountTextField(controller: _amountController),
          SizedBox(height: 24),
          Text('Uploading Certificate',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          ChooseFileContainer(),
          SizedBox(height: 22),
          Center(child: CustomElevatedButton(label: 'Submit', onPressed: (){})),
        ],
      ),
    );
  }
}
