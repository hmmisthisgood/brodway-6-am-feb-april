import 'package:flutter/material.dart';
import 'package:tiktok/common/extension/theme_extension.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {Key? key,
      required this.controller,
      this.validator,
      required this.hintText,
      this.keyboardType,
      this.obscureText = false,
      this.suffixIcon,
      this.label})
      : super(key: key);

  final TextEditingController controller;

  final String? Function(String?)? validator; //

  final String hintText;
  final TextInputType? keyboardType;

  final bool obscureText;
  final Widget? suffixIcon;
  final String? label;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          style: textTheme.h5(),
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: textTheme.headline6,
              border: InputBorder.none,
              suffix: suffixIcon),
        ),
      ),
    );
  }
}
