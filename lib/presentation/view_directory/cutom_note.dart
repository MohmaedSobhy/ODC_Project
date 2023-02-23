import 'package:flutter/material.dart';
import 'package:work_shop_project/presentation/styles/app_colors.dart';

class CustomNotesTextField extends StatelessWidget {
  String labelText;
  String hintText;
  Function validation;
  Function onChanged;
  int maxLines;
  TextEditingController editController;
  String startValue;

  CustomNotesTextField(
      {required this.labelText,
      required this.hintText,
      required this.validation,
      required this.onChanged,
      required this.maxLines,
      required this.editController,
      this.startValue = ""});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      initialValue: startValue,
      cursorColor: Colors.grey,
      onChanged: (value) {
        onChanged(value);
      },
      validator: (value) {
        validation(value);
      },
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(color: AppColor.PrimaryColor),
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
