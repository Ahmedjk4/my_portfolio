import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/shoruh_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.maxLines = 1,
    this.hintText,
    this.type,
    this.action,
    this.labelText,
  });
  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;
  final String? labelText;
  final TextInputType? type;
  final TextInputAction? action;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          textSelectionTheme:
              const TextSelectionThemeData(selectionColor: Colors.green)),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          if (type == TextInputType.emailAddress &&
              !EmailValidator.validate(value)) {
            return 'Please enter a valid email address';
          }
          return null;
        },
        keyboardType: type,
        textInputAction: action,
        controller: controller,
        maxLines: maxLines,
        style: const TextStyle(
          color: CustomColor.scaffoldBg,
        ),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          labelText: labelText,
          filled: true,
          fillColor: CustomColor.whiteSecondary,
          focusedBorder: getInputBorder,
          enabledBorder: getInputBorder,
          border: getInputBorder,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: CustomColor.hintDark,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder get getInputBorder {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );
  }
}
