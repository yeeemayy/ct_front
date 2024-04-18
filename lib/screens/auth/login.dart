import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/constants/custom_icon_data.dart';
import 'package:ct_app/custom_widgets/custom_elevated_button.dart';
import 'package:ct_app/custom_widgets/custom_text_field.dart';
import 'package:ct_app/custom_widgets/full_screen_background_container.dart';
import 'package:ct_app/routes/routes.dart';
import 'package:ct_app/screens/reusable_widget/copyright_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _passwordObscure = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FullScreenBackgroundContainer(
          backgroundImage: 'assets/images/login-page.png',
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                Text('Login to your account',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
                SizedBox(height: 16),
                RichText(
                    text: TextSpan(style: TextStyle(fontSize: 14), children: [
                  TextSpan(text: 'No account yet? ', style: TextStyle(color: Constants.grey_text)),
                  TextSpan(
                      text: 'Create an account.',
                      style: TextStyle(color: Constants.primary_color, fontWeight: FontWeight.w700),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pushNamed(context, Routes.create_account)),
                ])),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                CustomTextField(textEditingController: _usernameController, hintText: 'Username'),
                CustomTextField(
                  textEditingController: _passwordController,
                  hintText: 'Password',
                  obscureText: _passwordObscure,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordObscure = !_passwordObscure;
                        });
                      },
                      icon: Icon(_passwordObscure
                          ? CustomIconData.visibility_on
                          : CustomIconData.visibility_off),
                      iconSize: 16,
                      color: Constants.primary_color),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password'),
                  style: TextButton.styleFrom(foregroundColor: Constants.primary_color),
                ),
                SizedBox(height: 48),
                CustomElevatedButton(
                    label: 'Login',
                    onPressed: () => Navigator.pushReplacementNamed(context, Routes.main)),
                Spacer(),
                CopyrightText(textColor: Colors.white)
              ],
            ),
          )),
    );
  }
}
