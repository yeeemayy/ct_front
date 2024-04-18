import 'package:ct_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';

class CustomInputQuantityField extends StatefulWidget {
  const CustomInputQuantityField({super.key});

  @override
  State<CustomInputQuantityField> createState() => _CustomInputQuantityFieldState();
}

class _CustomInputQuantityFieldState extends State<CustomInputQuantityField> {
  @override
  Widget build(BuildContext context) {
    return InputQty(
        initVal: 0,
        decimalPlaces: 2,
        qtyFormProps: QtyFormProps(style: TextStyle(fontSize: 13)),
        decoration: QtyDecorationProps(
          plusBtn: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.add, color: Constants.primary_color),
          ),
            minusBtn: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.remove, color: Constants.primary_color),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            qtyStyle: QtyStyle.classic,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffdbe0e8)),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Constants.primary_color),
                borderRadius: BorderRadius.circular(12)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(12)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(12))));
  }
}
