import 'package:ct_app/constants/constants.dart';
import 'package:flutter/material.dart';

class AppBarActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const AppBarActionButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Constants.grey2)),
          child: Center(
            child: Icon(
              icon,
              color: Constants.primary_color,
            ),
          ),
        ),
      ),
    );
  }
}
