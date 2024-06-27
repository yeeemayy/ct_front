import 'package:country_code_picker/country_code_picker.dart';
import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/constants/custom_icon_data.dart';
import 'package:ct_app/custom_widgets/custom_app_bar.dart';
import 'package:ct_app/custom_widgets/custom_elevated_button.dart';
import 'package:ct_app/custom_widgets/custom_text_field.dart';
import 'package:ct_app/screens/auth/password_strength_indicator.dart';
import 'package:ct_app/screens/reusable_widget/copyright_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ct_app/custom_widgets/custom_status_dialog.dart' as csd;

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String countryCode = '+60';

  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _invitationCodeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _securityPinController = TextEditingController();
  final _verificationCodeController = TextEditingController();

  bool _passwordObscure = true;
  bool _securityPinObscure = true;
  bool _tncAccepted = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _usernameController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _invitationCodeController.dispose();
    _passwordController.dispose();
    _securityPinController.dispose();
    _verificationCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleStr: 'Create Account'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Personal Details', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xffdbe0e8)),
                          borderRadius: BorderRadius.circular(10)),
                      child: CountryCodePicker(
                        onChanged: (countryCode) {
                          this.countryCode = countryCode.dialCode ?? "+60";
                        },
                        initialSelection: 'MY',
                        favorite: const ['+60', 'MY'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                        searchDecoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search Country',
                            hintStyle: const TextStyle(fontSize: 12, color: Color(0xffc5c5c5)),
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 16,
                              color: Constants.primary_color,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffcccccc)),
                                borderRadius: BorderRadius.circular(4)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Constants.primary_color),
                                borderRadius: BorderRadius.circular(4)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(4))),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                        child: CustomTextField(
                      textEditingController: _phoneController,
                      hintText: 'Mobile Number',
                      keyboardType: TextInputType.phone,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        return null;
                      },
                    ))
                  ],
                ),
              ),
              CustomTextField(textEditingController: _usernameController, hintText: 'Username'),
              CustomTextField(textEditingController: _fullNameController, hintText: 'Full Name'),
              CustomTextField(textEditingController: _emailController, hintText: 'Email'),
              const SizedBox(height: 24),
              CustomTextField(
                  textEditingController: _invitationCodeController,
                  label: 'Referral Programme',
                  hintText: 'Invitation Code'),
              const SizedBox(height: 24),
              CustomTextField(
                textEditingController: _passwordController,
                label: 'Password & PIN',
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
                onChanged: (val) {
                  setState(() {});
                },
              ),
              PasswordStrengthIndicator(password: _passwordController.text),
              const SizedBox(height: 24),
              CustomTextField(
                textEditingController: _securityPinController,
                hintText: 'Security PIN',
                obscureText: _securityPinObscure,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _securityPinObscure = !_securityPinObscure;
                      });
                    },
                    icon: Icon(_securityPinObscure
                        ? CustomIconData.visibility_on
                        : CustomIconData.visibility_off),
                    iconSize: 16,
                    color: Constants.primary_color),
                onChanged: (val) {
                  setState(() {});
                },
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              PasswordStrengthIndicator(password: _securityPinController.text, type: 2),
              const SizedBox(height: 24),
              CustomTextField(
                  label: 'Email Verification',
                  textEditingController: _verificationCodeController,
                  hintText: 'Verification Code'),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SizedBox(
                  height: 15,
                  width: 15,
                  child: Checkbox(
                      value: _tncAccepted,
                      onChanged: (val) {
                        if (val != null) {
                          setState(() {
                            _tncAccepted = val;
                          });
                        }
                      },
                      shape: const CircleBorder(),
                      activeColor: Constants.primary_color),
                ),
                title: RichText(
                    text: const TextSpan(
                        style: TextStyle(fontSize: 12, color: Constants.grey_text),
                        children: [
                      TextSpan(text: 'I agree to the '),
                      TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(color: Constants.primary_color)),
                      TextSpan(text: ' and '),
                      TextSpan(
                          text: 'Privacy Policy', style: TextStyle(color: Constants.primary_color)),
                    ])),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    CustomElevatedButton(
                        label: 'Create Account',
                        onPressed: () {
                          csd.showCustomIconAlertDialog(
                              context: context,
                              title: 'Register',
                              type: csd.IconAlertDialogStatus.success,
                              description1: 'Successfully Registered',
                              description2: 'You\'ve successfully registered an account',
                          buttonText: 'OK',
                          onButtonPressed: ()=> Navigator.pop(context));
                        }),
                    const SizedBox(height: 16),
                    RichText(
                        text: const TextSpan(
                            style: TextStyle(fontSize: 14, color: Constants.grey_text),
                            children: [
                          TextSpan(text: 'Already have an account? '),
                          TextSpan(
                              text: 'Login here', style: TextStyle(color: Constants.primary_color)),
                        ])),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    const CopyrightText()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
