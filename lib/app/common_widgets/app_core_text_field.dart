import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextInputAction textInputAction;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final int? maxLength;
  final int? maxLines;
  final InputBorder? border;
  final TextStyle? style;
  final TextAlign textAlign;

  CommonTextField({
    required this.controller,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
    this.onSubmitted,
    this.maxLength,
    this.maxLines = 1,
    this.border,
    this.style,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: border ?? OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      maxLength: maxLength,
      maxLines: maxLines,
      style: style,
      textAlign: textAlign,
    );
  }
}
