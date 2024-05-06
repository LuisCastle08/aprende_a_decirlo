import 'package:aprende_a_decirlo/widgets/input_form.dart';
import 'package:flutter/material.dart';

class NuevoUsuarioPremium extends StatelessWidget {
  const NuevoUsuarioPremium({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: const Text(
          'AÑADIR USUARIO PREMIUM',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.amber,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const InputForm(hintText: 'INGRESAR USUARIO', iconCustom: Icons.person,),
            const SizedBox(height: 30,),
            const InputForm(hintText: 'INGRESA ID DEL USUARIO', iconCustom: Icons.person,),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: (){}, child: const Text('CREAR'))
          ],
        ),
      )
    );
  }
}
