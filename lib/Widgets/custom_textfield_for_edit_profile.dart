import 'package:flutter/material.dart';
import 'package:itienda/Utils/appcolors.dart';
// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

class CustomTextFieldForEditProfile extends StatelessWidget {
  CustomTextFieldForEditProfile({
    super.key,
    this.onTap,
    this.validate,
    this.inputAction,
    this.textInputType,
    this.hint,
    required this.height,
    this.textCapitalization = TextCapitalization.none,
    required this.controller,
  });

  TextEditingController controller;

  TextInputType? textInputType;
  TextInputAction? inputAction;
  double height;
  TextCapitalization textCapitalization;
  String? hint;
  var validate;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        textCapitalization: textCapitalization,
        cursorColor: AppColors.buttonColor,
        onTap: onTap,
        keyboardType: textInputType,
        controller: controller,
        validator: validate,
        textInputAction: inputAction,
        decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 12, color: Color(0xFF766B6B)),
          hintText: hint,
          isDense: true,
          filled: true,
          fillColor: const Color(0xFFFFFFFF),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xFF365830), width: 0.4),
              borderRadius: BorderRadius.circular(1)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xFF365830), width: 0.4),
              borderRadius: BorderRadius.circular(1)),
          border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xFF365830), width: 0.4),
              borderRadius: BorderRadius.circular(1)),
        ),
      ),
    );
  }
}
