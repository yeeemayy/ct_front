import 'package:ct_app/custom_widgets/custom_dropdown_button.dart';
import 'package:ct_app/custom_widgets/custom_elevated_button.dart';
import 'package:ct_app/screens/asset/amount_text_field.dart';
import 'package:ct_app/screens/reusable_widget/choose_file_container.dart';
import 'package:flutter/material.dart';

class BankCard extends StatefulWidget {
  const BankCard({super.key});

  @override
  State<BankCard> createState() => _BankCardState();
}

class _BankCardState extends State<BankCard> {
  final _selectedCurrency = ValueNotifier<String?>(null);

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
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Receipt Currency', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomDropdownButton<String>(
                hint: 'Select Currency',
                items: const ['USD', 'Item 2', 'Item 3'],
                valueListenable: _selectedCurrency,
                onChanged: (value) {
                  _selectedCurrency.value = value;
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a currency';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16),
            AmountTextField(controller: _amountController),
            const SizedBox(height: 24),
            const Text('Uploading Certificate',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            const ChooseFileContainer(),
            const SizedBox(height: 24),
            Center(child: CustomElevatedButton(label: 'Submit', onPressed: (){})),
          ],
        ));
  }
}
