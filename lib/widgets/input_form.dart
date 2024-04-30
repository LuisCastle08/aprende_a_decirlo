import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  final String hintText;
  final IconData? iconCustom;
  final Color colorBGCustom;
  final Color colorTextCustom;
  final TextEditingController? textController;

  final double? alturaInput;
  final int? maxLines;

  const InputForm({
    super.key,
    required this.hintText,
    this.iconCustom,
    this.colorTextCustom = Colors.grey,
    this.colorBGCustom = const Color.fromARGB(176, 239, 235, 235),
    this.textController,
    this.alturaInput = 50, this.maxLines = 1,
  });

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: widget.alturaInput,
      decoration: BoxDecoration(
        color: widget.colorBGCustom,
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(15), bottom: Radius.circular(15)),
      ),
      child: Center(
        
        child: TextFormField(
          maxLines: widget.maxLines,
          textAlign: TextAlign.justify,
          controller: widget.textController,
          
          decoration: InputDecoration(
            icon: Icon(widget.iconCustom),
            hintText: widget.hintText,
            hintStyle: TextStyle(fontSize: 20, color: widget.colorTextCustom),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
