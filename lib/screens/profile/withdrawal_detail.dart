import 'package:ct_app/custom_widgets/custom_app_bar.dart';
import 'package:ct_app/custom_widgets/custom_dropdown_button.dart';
import 'package:ct_app/custom_widgets/custom_elevated_button.dart';
import 'package:ct_app/custom_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class WithdrawalDetail extends StatefulWidget {
  const WithdrawalDetail({super.key});

  @override
  State<WithdrawalDetail> createState() => _WithdrawalDetailState();
}

class _WithdrawalDetailState extends State<WithdrawalDetail> {
  final _selectedWithdrawalMethod = ValueNotifier<String?>(null);

  final _bankNameController = TextEditingController();
  final _bankHolderController = TextEditingController();
  final _bankNumberController = TextEditingController();

  @override
  void dispose() {
    _bankNameController.dispose();
    _bankHolderController.dispose();
    _bankNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleStr: 'Withdrawal Detail'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomDropdownButton<String>(
                  hint: 'Choose Withdrawal Method',
                  items: ['Bank', 'Item 1', 'item 2', 'Item 3'],
                  valueListenable: _selectedWithdrawalMethod,
                  onChanged: (value) {
                    _selectedWithdrawalMethod.value = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a withdrawal method';
                    }
                    return null;
                  },
                ),
              ),
              CustomTextField(textEditingController: _bankNameController, hintText: 'Bank Name'),
              CustomTextField(textEditingController: _bankHolderController, hintText: 'Bank Account Holder'),
              CustomTextField(textEditingController: _bankNumberController, hintText: 'Bank Account Number'),
              SizedBox(height: 40),
              Center(child: CustomElevatedButton(label: 'Save', onPressed: (){}))
            ],
          ),
        ),
      ),
    );
  }
}
