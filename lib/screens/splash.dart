import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/custom_widgets/custom_elevated_button.dart';
import 'package:ct_app/custom_widgets/full_screen_background_container.dart';
import 'package:ct_app/routes/routes.dart';
import 'package:ct_app/screens/reusable_widget/copyright_text.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FullScreenBackgroundContainer(
          backgroundImage: 'assets/images/1st-page.png',
          child: Column(
            children: [
              const Spacer(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        'Get your Forex Trading started!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Central Tanshi is the simplest way to buy, sell, and Best Forex Trading of the world.',
                        style: TextStyle(fontSize: 14, color: Constants.grey_text),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 48),
                      CustomElevatedButton(
                          label: 'Get Started',
                          onPressed: () => Navigator.pushReplacementNamed(context, Routes.login),
                          labelFontSize: 15),
                      const Spacer(),
                      const CopyrightText()
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
