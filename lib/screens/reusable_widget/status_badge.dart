import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final int status;
  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    String? statusStr;
    Color? statusColor;

    switch (status) {
      case 1:
        statusStr = 'Pending';
        statusColor = const Color(0xffa8a8a8);
        break;
      case 2:
        statusStr = 'Approved';
        statusColor = const Color(0xff4cc112);
        break;
      case 3:
        statusStr = 'Rejected';
        statusColor = const Color(0xffff0000);
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      constraints: const BoxConstraints(minWidth: 70),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: statusColor),
      child: Text(
        statusStr ?? "",
        style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: Colors.white),
      ),
    );
  }
}
