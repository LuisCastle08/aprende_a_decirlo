import 'package:flutter/material.dart';

class InputProfileCustom extends StatelessWidget {
  final String hintText;
  final IconData? iconCustom;
  final String valueInputInitial;

  const InputProfileCustom(
      {super.key, required this.hintText, this.iconCustom, required this.valueInputInitial});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      decoration: const BoxDecoration(
        color: Color.fromARGB(176, 239, 235, 235),
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(15), bottom: Radius.circular(15)),
      ),
      child: TextFormField(
        initialValue: valueInputInitial,
        decoration: InputDecoration(
            icon: Icon(iconCustom),
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 20, color: Colors.grey),
            border: InputBorder.none),
      ),
    );
  }
}
