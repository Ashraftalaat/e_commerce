import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String texthint;
  final String textlabel;
  final IconData iconData;
  const CustomTextFormAuth({super.key, required this.texthint, required this.textlabel, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: texthint,
        hintStyle: const TextStyle(fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
        suffixIcon:  Icon(iconData),
        label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child:  Text(textlabel)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
