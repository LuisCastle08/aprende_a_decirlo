import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final String hintText;
  final IconData? iconCustom;
  final Color colorBGCustom;
  final Color colorTextCustom;

  const InputForm(
      {super.key,
      required this.hintText,
      this.iconCustom,
      this.colorTextCustom = Colors.grey, 
      this.colorBGCustom = const Color.fromARGB(176, 239, 235, 235)});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      decoration:  BoxDecoration(
        color: colorBGCustom,
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(15), bottom: Radius.circular(15)),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            icon: Icon(iconCustom),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 20, color: colorTextCustom),
            border: InputBorder.none),
      ),
    );
  }
}
