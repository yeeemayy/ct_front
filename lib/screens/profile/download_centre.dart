import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/constants/custom_icon_data.dart';
import 'package:ct_app/custom_widgets/custom_app_bar.dart';
import 'package:ct_app/custom_widgets/full_screen_background_container.dart';
import 'package:flutter/material.dart';

class DownloadCentre extends StatelessWidget {
  const DownloadCentre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleStr: 'Download Centre'),
      body: FullScreenBackgroundContainer(
          backgroundImage: 'assets/images/support-bg.png',
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: kToolbarHeight),
                Image.asset('assets/logos/ct1.png', height: 30),
                SizedBox(height: 30),
              Icon(CustomIconData.download_centre, size: 50, color: Constants.primary_color),
                SizedBox(height: 27),
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Constants.secondary_color, borderRadius: BorderRadius.circular(8)),
                  child: Column(children: [
                    Text(
                      'Download CT Apps Now!',
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    Text('Click the button below to download CT App',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xff616264)))
                  ]),
                ),
                SizedBox(height: 24),
                ...[
                  {'icon': CustomIconData.android, 'label': 'Android App', 'onTap': () {}},
                  {'icon': CustomIconData.ios, 'label': 'iOS App', 'onTap': () {}}
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
                          minimumSize: Size(170, 50))),
                ))
                    .toList()
              ],
            ),
          )),
    );
  }
}
