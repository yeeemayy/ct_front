import 'package:flutter/material.dart';
import 'package:ct_app/constants/constants.dart';

class DetailRow extends StatelessWidget {
  final String title;
  final String content;
  final double padding;
  final bool boldContent;
  const DetailRow(
      {super.key,
      required this.title,
      required this.content,
      this.padding = 8,
      this.boldContent = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 11, color: Constants.grey_text)),
          Text(content,
              style: TextStyle(
                  fontSize: 11, fontWeight: boldContent ? FontWeight.w700 : FontWeight.normal))
        ],
      ),
    );
  }
}
