// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:work_shop_project/presentation/styles/app_colors.dart';

// ignore: must_be_immutable
class DefaultTextFormField extends StatelessWidget {
  DefaultTextFormField(
      {super.key,
      required this.controller,
      required this.txtHint,
      required,
      this.PrefixIcon,
      this.IsObscure,
      this.MaxLine,
      this.value,
      this.Valided,
      this.sufficesPressed,
      this.SuffixIcon});

  TextEditingController controller;
  final String txtHint;
  IconData? SuffixIcon;
  IconData? PrefixIcon;
  bool? IsObscure;
  // ignore: prefer_typing_uninitialized_variables
  // ignore: prefer_typing_uninitialized_variables
  var sufficesPressed;
  int? MaxLine = 1;
  var Valided;
  String? value;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      obscureText: IsObscure == null ? false : IsObscure!,
      maxLines: MaxLine,
      textAlign: TextAlign.start,
      validator: Valided,
      initialValue: value,
      controller: controller,
      decoration: InputDecoration(
        hintText: txtHint,
        labelText: txtHint,
        labelStyle: TextStyle(color: AppColor.PrimaryColor),
        hintStyle: TextStyle(color: AppColor.PrimaryColor.withOpacity(0.5)),
        focusColor: AppColor.PrimaryColor,
        suffixIcon: (SuffixIcon == null)
            ? null
            : IconButton(
                onPressed: sufficesPressed,
                icon: Icon(
                  SuffixIcon,
                  color: Colors.orange,
                ),
              ),
        prefixIcon: (PrefixIcon == null)
            ? null
            : Icon(
                PrefixIcon,
                color: AppColor.orange,
              ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.PrimaryColor, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.PrimaryColor, width: 1),
        ),
      ),
    );
  }
}
