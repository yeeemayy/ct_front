import 'package:ct_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? label;
  final String? hintText;
  final bool obscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final int? maxLines;
  final double labelFontSize;
  const CustomTextField(
      {super.key,
      required this.textEditingController,
      this.label,
      this.hintText,
      this.obscureText = false,
      this.readOnly = false,
      this.suffixIcon,
      this.keyboardType,
      this.onChanged,
      this.onTap,
      this.inputFormatters,
      this.validator,
      this.maxLines = 1,
      this.labelFontSize = 14});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Text(
              label!,
              style: TextStyle(fontSize: labelFontSize, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
          ],
          TextFormField(
            controller: textEditingController,
            obscureText: obscureText,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            maxLines: maxLines,
            cursorColor: Constants.primary_color,
            keyboardType: keyboardType,
            readOnly: readOnly,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            validator: validator,
            onTap: onTap,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle:
                    const TextStyle(fontSize: 12, color: Color(0xff8793a3), fontWeight: FontWeight.w400),
                // prefixIcon: label.isNotEmpty
                //     ? Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Padding(
                //             padding: EdgeInsets.only(left: 20.0 * _sizeConfig.scaleFactor),
                //             child:
                //                 Text(label, style: TextStyle(fontSize: 13, color: Color(0xffa2abc1))),
                //           ),
                //         ],
                //       )
                //     : null,
                suffixIcon: suffixIcon,
                filled: true,
                fillColor: Colors.white,
                helperStyle: const TextStyle(fontSize: 13, color: Color(0xff898989)),
                errorMaxLines: 2,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffdbe0e8)),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Constants.primary_color),
                    borderRadius: BorderRadius.circular(10)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      ),
    );
  }
}
