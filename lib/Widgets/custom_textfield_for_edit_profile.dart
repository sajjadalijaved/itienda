import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itienda/Utils/appcolors.dart';
// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

class CustomTextFieldForEditProfile extends StatelessWidget {
  CustomTextFieldForEditProfile(
      {super.key,
      this.onTap,
      this.validate,
      this.inputAction,
      this.textInputType,
      this.inputparameter,
      this.hint,
      this.textCapitalization = TextCapitalization.none,
      this.controller,
      required this.fieldValidationkey,
      this.onChanged});

  TextEditingController? controller;
  TextInputType? textInputType;
  TextInputAction? inputAction;
  TextCapitalization textCapitalization;
  String? hint;
  var validate;
  VoidCallback? onTap;
  ValueChanged<String>? onChanged;
  List<TextInputFormatter>? inputparameter;
  GlobalKey<FormFieldState> fieldValidationkey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputparameter,
      textCapitalization: textCapitalization,
      cursorColor: AppColors.buttonColor,
      onChanged: onChanged,
      key: fieldValidationkey,
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
          border: InputBorder.none),
    );
  }
}
