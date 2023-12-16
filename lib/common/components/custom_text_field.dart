import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.formatter,
    this.inputType,
    super.key,
  });

  final String hintText;
  final TextEditingController controller;
  final List<TextInputFormatter>? formatter;
  final TextInputType? inputType;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: double.infinity,
      child: TextField(
        controller: controller,
        inputFormatters: formatter,
        keyboardType: inputType,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          isDense: true,
        ),
      ),
    );
  }
}
