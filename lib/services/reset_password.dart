import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:aprende_a_decirlo/widgets/input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(titleCustom: 'Recuperación'),
      body: GestureDetector(
        onTap: () =>FocusScope.of(context).unfocus(),
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          color: Colors.transparent,
          child: Column(
            children: [

              InputForm(hintText: "Escribre tu Correo Electronico", useHidePassword: false, iconCustom: Icons.email,)

            ],
          ),
        ),
      ),
    );
  }
}
