import 'package:country_code_picker/country_code_picker.dart';
import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/custom_widgets/custom_app_bar.dart';
import 'package:ct_app/custom_widgets/custom_elevated_button.dart';
import 'package:ct_app/custom_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String countryCode = '+60';

  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _usernameController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleStr: 'Edit Profile'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Personal Details', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
              SizedBox(height: 8),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xffdbe0e8)),
                          borderRadius: BorderRadius.circular(10)),
                      child: CountryCodePicker(
                        onChanged: (countryCode) {
                          print(countryCode.dialCode);
                          this.countryCode = countryCode.dialCode ?? "+60";
                        },
                        initialSelection: 'MY',
                        favorite: ['+60', 'MY'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                        searchDecoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search Country',
                            hintStyle: TextStyle(fontSize: 12, color: Color(0xffc5c5c5)),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 16,
                              color: Constants.primary_color,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffcccccc)),
                                borderRadius: BorderRadius.circular(4)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Constants.primary_color),
                                borderRadius: BorderRadius.circular(4)),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(4))),
                      ),
                    ),
                    SizedBox(width: 8),
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
              SizedBox(height: 40),
              Center(child: CustomElevatedButton(label: 'Save', onPressed: () {}))
            ],
          ),
        ),
      ),
    );
  }
}
