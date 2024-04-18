import 'package:ct_app/constants/constants.dart';
import 'package:flutter/material.dart';

class CopyrightText extends StatelessWidget {
  final Color textColor;
  const CopyrightText({super.key, this.textColor = Constants.grey_text});

  @override
  Widget build(BuildContext context) {
    return Text(
      '© 2023 . Central Tanshi . All Right Reserved',
      style: TextStyle(fontSize: 11, color: textColor),
    );
  }
}
