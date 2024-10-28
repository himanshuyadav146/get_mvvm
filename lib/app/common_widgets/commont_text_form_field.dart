import 'package:flutter/material.dart';

class CommonTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String prefixText;
  final String? labelText;
  final String? hintText;
  final IconData? suffixIcon;
  final IconData? errorIcon;
  final Color borderColor;
  final Color successIconColor;
  final Color errorIconColor;
  final bool obscureText;
  final TextStyle? textStyle;
  final String? Function(String?)? validator;

  CommonTextFormField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.prefixText = '',
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.errorIcon,
    this.borderColor = Colors.black12,
    this.successIconColor = Colors.green,
    this.errorIconColor = Colors.red,
    this.obscureText = false,
    this.textStyle,
    this.validator,
  });

  @override
  _CommonTextFormFieldState createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  bool _isValid = false;
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          style: widget.textStyle ??
              TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
          decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor),
              borderRadius: BorderRadius.circular(10),
            ),
            prefix: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                widget.prefixText,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            suffixIcon: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: _isValid
                  ? Icon(
                      widget.suffixIcon ?? Icons.check_circle,
                      color: widget.successIconColor,
                      size: 32,
                      key: ValueKey('valid'),
                    )
                  : _hasError
                      ? Icon(
                          widget.errorIcon ?? Icons.error,
                          color: widget.errorIconColor,
                          size: 32,
                          key: ValueKey('error'),
                        )
                      : SizedBox.shrink(),
            ),
          ),
          obscureText: widget.obscureText,
          onChanged: (value) {
            final isValid = widget.validator?.call(value) == null;
            setState(() {
              _isValid = isValid;
              _hasError = !isValid;
            });
          },
          validator: (value) {
            final errorMessage = widget.validator?.call(value);
            setState(() {
              _hasError = errorMessage != null;
              _isValid = errorMessage == null;
            });
            return errorMessage;
          },
        ),
        if (_hasError)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.validator?.call(widget.controller.text) ?? '',
              style: TextStyle(color: widget.errorIconColor),
            ),
          ),
      ],
    );
  }
}
