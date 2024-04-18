import 'package:ct_app/constants/constants.dart';
import 'package:flutter/material.dart';

class PasswordStrength {
  final String text;
  final bool value;

  const PasswordStrength(this.text, this.value);
}

class PasswordStrengthIndicator extends StatelessWidget {
  final int type; //1: password, 2: pin
  final String password;

  const PasswordStrengthIndicator({Key? key, this.type = 1, required this.password}) : super(key: key);

  List<PasswordStrength> _passwordStrength() {
    return type == 1 ? [
      PasswordStrength('At least 8 characters', password.length >= 8),
      PasswordStrength('At least 1 uppercase character', password.contains(RegExp(r'[A-Z]'))),
      PasswordStrength('At least 1 number (0-9)', password.contains(RegExp(r'[0-9]'))),
      PasswordStrength('At least 1 special character(e.g.?/#~!)',
          password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))),
    ] : [
      PasswordStrength('4 digits (0-9) ONLY', password.length == 4),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ..._passwordStrength()
            .map((e) => Row(
                  children: [
                    Icon(Icons.check_circle,
                        size: 12.5,
                        color: e.value ? Constants.primary_color : Color(0xffb2b2b2)),
                    SizedBox(width: 10),
                    Text(
                      e.text,
                      style: TextStyle(fontSize: 11, color: Constants.grey_text),
                    )
                  ],
                ))
            .toList()
      ],
    );
  }
}
