import 'package:ct_app/constants/custom_icon_data.dart';
import 'package:ct_app/custom_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

enum IconAlertDialogStatus { loading, success, failed }

Widget _buildCustomIconAlertDialog(BuildContext context, String title, IconAlertDialogStatus type,
    String description1, String description2,
    {String? buttonText, VoidCallback? onButtonPressed, required bool canPop}) {
  String statusIcon;
  Color statusColor;

  switch (type) {
    case IconAlertDialogStatus.loading:
      statusIcon = 'assets/images/popup-pending.png';
      statusColor = Color(0xffffa413);
      break;
    case IconAlertDialogStatus.success:
      statusIcon = 'assets/images/popup-tick.png';
      statusColor = Color(0xff4cc112);
      break;
    case IconAlertDialogStatus.failed:
      statusIcon = 'assets/images/popup-cross.png';
      statusColor = Color(0xffff0000);
      break;
  }

  return PopScope(
    canPop: canPop,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 24.0),
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    iconSize: 14,
                    icon: const Icon(null),
                    onPressed: null)      ,          Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                IconButton(
                    iconSize: 14,
                    icon: const Icon(CustomIconData.cancel),
                    onPressed: () => Navigator.pop(context))
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Image.asset(statusIcon, height: 90),
                  SizedBox(height: 24),
                  Text(description1,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: statusColor)),
                  SizedBox(height: 5),
                  Text(description2, style: TextStyle(fontSize: 13, color: Color(0xff8793a3)), textAlign: TextAlign.center,),
                  if (buttonText != null) ...[
                    SizedBox(height: 18),
                    CustomElevatedButton(
                        onPressed: onButtonPressed, label: buttonText, backgroundColor: statusColor)
                  ]
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Future<IconAlertDialogStatus?> showCustomIconAlertDialog(
    {required BuildContext context,
    required String title,
    required IconAlertDialogStatus type,
    required String description1,
    required String description2,
    String? buttonText,
    VoidCallback? onButtonPressed,
    bool canPop = true,
    bool isDismissable = false}) {
  return showDialog(
      context: context,
      barrierDismissible: isDismissable,
      builder: (context) => Dialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: _buildCustomIconAlertDialog(context, title, type, description1, description2,
                buttonText: buttonText, onButtonPressed: onButtonPressed, canPop: canPop),
          ));
}

void popBottomSheet(BuildContext context) {
  Navigator.pop(context);
}
