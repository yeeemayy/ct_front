import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/constants/custom_icon_data.dart';
import 'package:ct_app/custom_widgets/custom_app_bar.dart';
import 'package:ct_app/custom_widgets/full_screen_background_container.dart';
import 'package:flutter/material.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleStr: 'Support'),
      body: FullScreenBackgroundContainer(
          backgroundImage: 'assets/images/support-bg.png',
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: kToolbarHeight),
                Image.asset('assets/logos/ct1.png', height: 30),
                SizedBox(height: 30),
                Image.asset('assets/images/customer-support.png'),
                SizedBox(height: 27),
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Constants.secondary_color, borderRadius: BorderRadius.circular(8)),
                  child: Column(children: [
                    Text(
                      'Customer Support',
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    Text('Monday - Friday | 9:00 - 21:00',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xff616264)))
                  ]),
                ),
                SizedBox(height: 24),
                ...[
                  {'icon': CustomIconData.whatsapp, 'label': 'WhatsApp', 'onTap': () {}},
                  {'icon': CustomIconData.telegram, 'label': 'Telegram', 'onTap': () {}}
                ]
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ElevatedButton.icon(
                              onPressed: e['onTap'] as VoidCallback,
                              icon: Icon(e['icon'] as IconData, size: 20),
                              label: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  e['label'] as String,
                                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  alignment: Alignment.centerLeft,
                                  backgroundColor: Constants.primary_color,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                  minimumSize: Size(160, 50))),
                        ))
                    .toList()
              ],
            ),
          )),
    );
  }
}
