import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/custom_widgets/custom_app_bar.dart';
import 'package:ct_app/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Announcement extends StatefulWidget {
  const Announcement({super.key});

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleStr: 'Announcement'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ...List.generate(
                4,
                (index) => InkWell(
                      onTap: () => Navigator.pushNamed(context, Routes.announcement_details),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: Constants.secondary_color,
                            borderRadius: BorderRadius.horizontal(right: Radius.circular(10))),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Container(width: 4, color: Constants.primary_color),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('System Under Maintenance',
                                          style:
                                              TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                                      SizedBox(height: 4),
                                      Text(
                                        'System Under Maintenance. Our system is currently undergoing maintenance and system upgrade ...',
                                        style: TextStyle(fontSize: 11, color: Constants.grey_text),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '13 July 2023 | 13:13',
                                        style: TextStyle(fontSize: 11, color: Constants.grey_text),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
