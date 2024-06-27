import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/constants/custom_icon_data.dart';
import 'package:ct_app/custom_widgets/custom_app_bar.dart';
import 'package:ct_app/custom_widgets/custom_elevated_button.dart';
import 'package:ct_app/custom_widgets/custom_tabbar.dart';
import 'package:ct_app/custom_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SecurityCentre extends StatefulWidget {
  const SecurityCentre({super.key});

  @override
  State<SecurityCentre> createState() => _SecurityCentreState();
}

class _SecurityCentreState extends State<SecurityCentre> with SingleTickerProviderStateMixin {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();
  final _oldPinController = TextEditingController();
  final _newPinController = TextEditingController();
  final _confirmNewPinController = TextEditingController();

  bool _newPasswordObscure = true;
  bool _confirmPasswordObscure = true;
  bool _newPinObscure = true;
  bool _confirmPinObscure = true;

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    _oldPinController.dispose();
    _newPinController.dispose();
    _confirmNewPinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleStr: 'Security Centre'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTabBar(tabController: _tabController, tabTitles: const ['Password', 'Security PIN']),
              const SizedBox(height: 8),
              [
                Column(
                  children: [
                    CustomTextField(
                        textEditingController: _oldPasswordController,
                        hintText: 'Current Password'),
                    CustomTextField(
                      textEditingController: _newPasswordController,
                      hintText: 'New Password',
                      obscureText: _newPasswordObscure,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _newPasswordObscure = !_newPasswordObscure;
                            });
                          },
                          icon: Icon(_newPasswordObscure
                              ? CustomIconData.visibility_on
                              : CustomIconData.visibility_off),
                          iconSize: 16,
                          color: Constants.primary_color),
                    ),
                    CustomTextField(
                      textEditingController: _confirmNewPasswordController,
                      hintText: 'Confirm New Password',
                      obscureText: _confirmPasswordObscure,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _confirmPasswordObscure = !_confirmPasswordObscure;
                            });
                          },
                          icon: Icon(_confirmPasswordObscure
                              ? CustomIconData.visibility_on
                              : CustomIconData.visibility_off),
                          iconSize: 16,
                          color: Constants.primary_color),
                    ),
                    const SizedBox(height: 40),
                    CustomElevatedButton(label: 'Save', onPressed: () {})
                  ],
                ),
                Column(
                  children: [
                    CustomTextField(
                        textEditingController: _oldPinController, hintText: 'Current Security PIN'),
                    CustomTextField(
                      textEditingController: _newPinController,
                      hintText: 'New Security PIN',
                      obscureText: _newPinObscure,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _newPinObscure = !_newPinObscure;
                            });
                          },
                          icon: Icon(_newPinObscure
                              ? CustomIconData.visibility_on
                              : CustomIconData.visibility_off),
                          iconSize: 16,
                          color: Constants.primary_color),
                    ),
                    CustomTextField(
                      textEditingController: _confirmNewPinController,
                      hintText: 'Confirm New Security PIN',
                      obscureText: _confirmPinObscure,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _confirmPinObscure = !_confirmPinObscure;
                            });
                          },
                          icon: Icon(_confirmPinObscure
                              ? CustomIconData.visibility_on
                              : CustomIconData.visibility_off),
                          iconSize: 16,
                          color: Constants.primary_color),
                    ),
                    const SizedBox(height: 40),
                    CustomElevatedButton(label: 'Save', onPressed: () {})
                  ],
                )
              ][_tabController.index]
            ],
          ),
        ),
      ),
    );
  }
}
