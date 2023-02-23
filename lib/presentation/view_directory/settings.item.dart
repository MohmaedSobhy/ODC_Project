import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultSettingItem extends StatelessWidget {
  DefaultSettingItem({super.key, required this.text, required this.function});
  final String text;
  var function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: function,
      title: Text(text),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
