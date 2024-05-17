import 'package:flutter/material.dart';
import 'package:itienda/Utils/appcolors.dart';
// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.onTap,
      this.character = ' ',
      this.validate,
      this.inputAction,
      this.textInputType,
      this.hintText,
      this.sufixIcon,
      this.style,
      this.textCapitalization = TextCapitalization.none,
      required this.controller,
      this.onChanged,
      this.obscureText = false,
      required this.fieldValidationkey});

  Widget? sufixIcon;
  String character;
  TextEditingController controller;
  GlobalKey<FormFieldState> fieldValidationkey;
  TextInputType? textInputType;
  TextInputAction? inputAction;
  TextCapitalization textCapitalization;
  bool obscureText;
  String? hintText;

  var validate;
  VoidCallback? onTap;
  TextStyle? style;
  ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        textCapitalization: textCapitalization,
        obscureText: obscureText,
        cursorColor: AppColors.buttonColor,
        obscuringCharacter: character,
        onTap: onTap,
        style: style,
        onChanged: onChanged,
        keyboardType: textInputType,
        key: fieldValidationkey,
        controller: controller,
        validator: validate,
        textInputAction: inputAction,
        decoration: InputDecoration(
          errorStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          hintText: hintText,
          isDense: true,
          filled: true,
          fillColor: const Color(0xFFFFFFFF),
          hintStyle: const TextStyle(color: Color(0xFF766B6B)),
          suffixIcon: sufixIcon,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF365830), width: 1),
              borderRadius: BorderRadius.circular(5)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(5)),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF365830), width: 1),
              borderRadius: BorderRadius.circular(5)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF365830), width: 1),
              borderRadius: BorderRadius.circular(5)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF365830), width: 1),
              borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
