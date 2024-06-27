import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/constants/custom_icon_data.dart';
import 'package:ct_app/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatelessWidget {
  final Function(int) switchTab;
  const Profile({super.key, required this.switchTab});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset('assets/images/profile.png',
              width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(radius: 31.25),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton.icon(
                                onPressed: () => Navigator.pushNamed(context, Routes.edit_profile),
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.white, padding: EdgeInsets.zero),
                                icon: Text('yy01',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                                label: Icon(CustomIconData.edit, size: 15)),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white),
                              ),
                              child: Text(
                                'Member',
                                style: TextStyle(fontSize: 12.5, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 24),
                  InkWell(
                    onTap: () => switchTab(3),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 36, offset: Offset(0, 4))
                          ]),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('My Assets', style: TextStyle(fontSize: 14.5)),
                                Text('10,000.00',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_right, size: 20),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildSection('Account Verification', [
                    {
                      'icon': CustomIconData.kyc,
                      'title': 'KYC',
                      'onTap': () => Navigator.pushNamed(context, Routes.kyc)
                    },
                  ]),
                  _buildSection('Settings', [
                    {
                      'icon': CustomIconData.withdrawal_detail,
                      'title': 'Withdrawal Detail',
                      'onTap': () => Navigator.pushNamed(context, Routes.withdrawal_detail)
                    },
                    {
                      'icon': CustomIconData.security_center,
                      'title': 'Security Centre',
                      'onTap': () => Navigator.pushNamed(context, Routes.security_centre)
                    },
                  ]),
                  _buildSection('Referral Programme', [
                    {
                      'icon': CustomIconData.invite_friends,
                      'title': 'Invite Friends',
                      'onTap': () => Navigator.pushNamed(context, Routes.invite_friends)
                    },
                    {
                      'icon': CustomIconData.my_team,
                      'title': 'My Team',
                      'onTap': () => Navigator.pushNamed(context, Routes.my_team)
                    },
                  ]),
                  _buildSection('Information & Contact', [
                    {
                      'icon': CustomIconData.announcement,
                      'title': 'Announcement',
                      'onTap': () => Navigator.pushNamed(context, Routes.announcement)
                    },
                    {
                      'icon': CustomIconData.info,
                      'title': 'Info',
                      'onTap': () => Navigator.pushNamed(context, Routes.info)
                    },
                    {
                      'icon': CustomIconData.support,
                      'title': 'Support',
                      'onTap': () => Navigator.pushNamed(context, Routes.support)
                    },
                    {
                      'icon': CustomIconData.download_center,
                      'title': 'Download Center',
                      'onTap': () => Navigator.pushNamed(context, Routes.download_centre)
                    },
                  ]),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ElevatedButton.icon(
                        onPressed: () => Navigator.pushNamedAndRemoveUntil(
                            context, Routes.splash, (route) => false),
                        icon: Icon(
                          Icons.logout,
                          size: 20,
                          color: Colors.red,
                        ),
                        label: Text(
                          'Log Out',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w700, color: Constants.red),
                        ),
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            minimumSize: Size(150, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: Colors.red))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSection(String sectionTitle, List<Map<String, dynamic>> buttons) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sectionTitle,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 8),
          ...buttons
              .map((e) => ListTile(
                  visualDensity: VisualDensity(vertical: -2),
                  onTap: e['onTap'],
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(e['icon'], size: 20, color: Constants.primary_color),
                  title: Text(e['title'], style: TextStyle(fontSize: 14)),
                  trailing:
                      Icon(Icons.keyboard_arrow_right, size: 20, color: Constants.primary_color)))
              .toList()
        ],
      ),
    );
  }
}
