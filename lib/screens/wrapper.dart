import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/constants/custom_icon_data.dart';
import 'package:ct_app/screens/asset/asset.dart';
import 'package:ct_app/screens/home.dart';
import 'package:ct_app/screens/orders/order.dart';
import 'package:ct_app/screens/profile/profile.dart';
import 'package:ct_app/screens/reusable_widget/app_bar_action_button.dart';
import 'package:ct_app/screens/trade/trade.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _currentPageIndex = 0;

  Widget _getBody() {
    switch (_currentPageIndex) {
      case 0:
        return Home();
      case 1:
        return Order();
      case 2:
        return Trade();
      case 3:
        return Asset();
      case 4:
        return Profile(
          switchTab: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
        );
      default:
        return Container();
    }
  }

  List<Map<String, dynamic>> _bottomAppBarItems(BuildContext context) => [
        {'title': 'Markets', 'icon': CustomIconData.market},
        {
          'title': 'Order',
          'icon': CustomIconData.order,
          'action': AppBarActionButton(icon: CustomIconData.history, onTap: () {}),
        },
        {'title': 'Trade', 'icon': null},
        {'title': 'Assets', 'icon': CustomIconData.asset},
        {'title': 'Profile', 'icon': CustomIconData.profile},
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: _currentPageIndex == 4,
      appBar: AppBar(
        surfaceTintColor: _currentPageIndex != 4 ? Colors.white : Colors.transparent,
        backgroundColor: _currentPageIndex != 4 ? Colors.white : Colors.transparent,
        shadowColor: _currentPageIndex != 4 ? Constants.grey1.withOpacity(0.5) : Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 1,
        centerTitle: _currentPageIndex != 0,
        title: _currentPageIndex == 0
            ? Text(
                'Welcome Back, yy01',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              )
            : Text(
                _bottomAppBarItems(context)[_currentPageIndex]['title'],
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: _currentPageIndex == 4 ? Colors.white : null),
              ),
        actions: _bottomAppBarItems(context)[_currentPageIndex]['action'] != null
            ? [_bottomAppBarItems(context)[_currentPageIndex]['action']]
            : [],
      ),
      body: _getBody(),
      floatingActionButton: Container(
        height: 65,
        width: 65,
        margin: EdgeInsets.only(top: 20),
        child: FittedBox(
          child: FloatingActionButton(
              backgroundColor: Colors.white,
              shape: CircleBorder(),
              onPressed: () {
                setState(() {
                  _currentPageIndex = 2;
                });
              },
              child: Icon(
                CustomIconData.app_logo,
                size: 30,
                color: _currentPageIndex == 2 ? Constants.primary_color : Constants.grey1,
              )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        notchMargin: 8,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _bottomAppBarItems(context)
              .asMap()
              .map((i, e) => MapEntry(
                    i,
                    InkWell(
                      onTap: i != 2
                          ? () {
                              setState(() {
                                _currentPageIndex = i;
                              });
                            }
                          : null,
                      child: Container(
                        constraints:
                            BoxConstraints(minWidth: MediaQuery.of(context).size.width / 6),
                        padding: EdgeInsets.all(10),
                        decoration: i != 2
                            ? BoxDecoration(
                                color: _currentPageIndex == i
                                    ? Constants.secondary_color
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                              )
                            : null,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(e['icon'],
                                size: 20,
                                color: _currentPageIndex == i
                                    ? Constants.primary_color
                                    : Constants.grey1),
                            SizedBox(height: 10),
                            Text(
                              i != 2 ? e['title'] : '',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: _currentPageIndex == i
                                      ? Constants.primary_color
                                      : Constants.grey1),
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
              .values
              .toList(),
        ),
      ),
    );
  }
}
