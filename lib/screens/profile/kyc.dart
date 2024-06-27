import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/custom_widgets/custom_app_bar.dart';
import 'package:ct_app/custom_widgets/custom_dropdown_button.dart';
import 'package:ct_app/custom_widgets/custom_elevated_button.dart';
import 'package:ct_app/custom_widgets/custom_text_field.dart';
import 'package:ct_app/screens/reusable_widget/choose_file_container.dart';
import 'package:flutter/material.dart';

class KYC extends StatefulWidget {
  const KYC({super.key});

  @override
  State<KYC> createState() => _KYCState();
}

class _KYCState extends State<KYC> {
  final _selectedDocumentType = ValueNotifier<String?>(null);

  final _nameController = TextEditingController();
  final _icController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _icController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleStr: 'KYC'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Enter Your ID Details',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomDropdownButton<String>(
                  hint: 'Choose Document Type',
                  items: const ['Identification Card', 'Passport'],
                  valueListenable: _selectedDocumentType,
                  onChanged: (value) {
                    _selectedDocumentType.value = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a document type';
                    }
                    return null;
                  },
                ),
              ),
              CustomTextField(textEditingController: _nameController, hintText: 'Name as IC'),
              CustomTextField(
                  textEditingController: _icController, hintText: 'Identification Number'),
              const SizedBox(height: 32),
              const Text('Upload Document', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              ...List.generate(
                  2,
                  (index) => Container(
                        width: double.maxFinite,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Constants.grey2)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(index == 0 ? 'Front Image' : 'Back Image',
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: ChooseFileContainer(minHeight: 160),
                            ),
                            const Text(
                              'Check the following:\n\n∙ Valid unexpired government ID\n∙ All four corners are showing\n∙ Text is clear\n∙ Format in PNG, JPG, PDF',
                              style: TextStyle(color: Constants.grey_text, fontSize: 12),
                            )
                          ],
                        ),
                      )),
              const SizedBox(height: 32),
              Center(child: CustomElevatedButton(label: 'Submit', onPressed: (){}))
            ],
          ),
        ),
      ),
    );
  }
}
