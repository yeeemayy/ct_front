import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/custom_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AmountTextField extends StatelessWidget {
  final TextEditingController controller;
  const AmountTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text('Amount', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            RichText(
                text: const TextSpan(
                    style: TextStyle(fontSize: 11, color: Constants.grey_text),
                    children: [
                      TextSpan(text: 'Asset Balance: '),
                      TextSpan(text: '\$ 0.00', style: TextStyle(fontWeight: FontWeight.w700)),
                    ]))
          ],
        ),
        CustomTextField(textEditingController: controller),
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            '1 USD = 4 MYR',
            style: TextStyle(fontSize: 13, color: Constants.grey_text),
          ),
        ),
      ],
    );
  }
}
