import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  final String hintText;
  final IconData? iconCustom;
  final Color colorBGCustom;
  final Color colorTextCustom;
  final TextEditingController? textController;
  final bool obscureText;
  final bool useHidePassword;

  const InputForm({
    Key? key,
    required this.hintText,
    this.iconCustom,
    this.colorTextCustom = Colors.grey,
    this.colorBGCustom = const Color.fromARGB(176, 239, 235, 235),
    this.textController,
    this.obscureText = true,
    this.useHidePassword = true,
  }) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    // Si useHidePassword es false, siempre mostramos el texto
    _obscureText = widget.useHidePassword ? _obscureText : false;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      decoration: BoxDecoration(
        color: widget.colorBGCustom,
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(15), bottom: Radius.circular(15)),
      ),
      child: Center(
        child: TextFormField(
          textAlign: TextAlign.justify,
          controller: widget.textController,
          obscureText: _obscureText,
          decoration: InputDecoration(
            icon: Icon(widget.iconCustom),
            hintText: widget.hintText,
            hintStyle: TextStyle( fontSize: 20, color: widget.colorTextCustom),
            border: InputBorder.none,
            // Mostramos el icono para ocultar/mostrar la contraseña solo si useHidePassword es true
            suffixIcon: widget.useHidePassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
