import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/constants/custom_icon_data.dart';
import 'package:ct_app/custom_widgets/custom_app_bar.dart';
import 'package:ct_app/custom_widgets/custom_elevated_button.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Referral extends StatelessWidget {
  const Referral({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleStr: 'Invite Friends'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('Refer more, Earn more!',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700, color: Constants.primary_color)),
              SizedBox(height: 4),
              Text('Invite Your Friends',
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600, color: Constants.primary_color)),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Constants.primary_color, width: 2),
                ),
                child: QrImageView(
                  data: '0x70161cB8d72306f244cA036140921A311e51b94b',
                  version: QrVersions.auto,
                  size: MediaQuery.of(context).size.width / 3,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Scan QR Code or copy referral code',
                style: TextStyle(fontSize: 12, color: Constants.grey_text),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Text(
                  'MDEX01',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
                label: Icon(
                  Icons.copy,
                  color: Constants.primary_color,
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    foregroundColor: Colors.black,
                    backgroundColor: Constants.secondary_color),
              ),
              SizedBox(height: 24),
              ...[
                {
                  'icon': CustomIconData.referral_1,
                  'label':
                      'Invite your friend to install the app with the qr code or referral code.'
                },
                {
                  'icon': CustomIconData.referral_2,
                  'label': 'Your friend required to register an account and trade.'
                },
                {'icon': CustomIconData.referral_3, 'label': 'You will get rewards commission.'},
              ]
                  .asMap()
                  .map((i, e) => MapEntry(
                        i,
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Container(
                                  width: double.maxFinite,
                                  margin: EdgeInsets.only(top: 60 / 2),
                                  padding: EdgeInsets.fromLTRB(24, 45, 24, 12),
                                  decoration: BoxDecoration(
                                    color: Constants.secondary_color,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    e['label'] as String,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Constants.primary_color,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    e['icon'] as IconData,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            if (i != 2)
                              DottedLine(
                                direction: Axis.vertical,
                                alignment: WrapAlignment.center,
                                lineLength: 30,
                                lineThickness: 2,
                                dashLength: 4.0,
                                dashColor: Constants.primary_color,
                                dashGapColor: Colors.transparent,
                              )
                          ],
                        ),
                      ))
                  .values
                  .toList(),
              SizedBox(height: 32),
              CustomElevatedButton(label: 'Copy Link', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
