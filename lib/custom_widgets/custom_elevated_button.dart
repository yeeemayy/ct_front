import 'package:ct_app/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double labelFontSize;

  const CustomElevatedButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.backgroundColor = Constants.primary_color,
        this.labelFontSize = 13});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, padding: const EdgeInsets.symmetric(vertical: 9), minimumSize: const Size(150, 40)),
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: labelFontSize, fontWeight: FontWeight.w700),
      ),
    );
  }
}
