import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class GenericTextFormField extends StatelessWidget {
  final String labelTextField;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final Color? fillColor;
  final bool? filled;
  const GenericTextFormField(
      {super.key,
      required this.labelTextField,
      this.validator,
      this.obscureText,
      this.enabledBorder,
      this.focusedBorder,
      this.errorBorder,
      this.fillColor,
      this.filled});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return TextFormField(
          validator: validator,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: filled,
            labelText: labelTextField,
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            errorBorder: errorBorder,
          ),
        );
      },
    );
  }
}
