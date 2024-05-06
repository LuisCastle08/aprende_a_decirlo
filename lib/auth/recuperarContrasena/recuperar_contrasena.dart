import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:aprende_a_decirlo/widgets/input_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class resetPassword extends StatefulWidget {
  const resetPassword({super.key});

  @override
  State<resetPassword> createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordResetEmail() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text(
                  'YA FUE ENVIADO EL ENLACE DE RECUPERACION'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text( e.message.toString() +
                  'NO EXISTE TU CORREO O ESTA MAL ESCRITO EL DOMINIO O NO TIENE EL @'),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(titleCustom: 'Recuperación'),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Image(image: AssetImage('assets/banner_logo.png')),
                const Text('RECUPERACIÓN DE CONTRASEÑA', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                SizedBox(height: 20,),
                InputForm(
                  hintText: 'Ingresa tu Correo Electronico',
                  iconCustom: Icons.email,
                  textController: emailController,
                  useHidePassword: false,
                ),
                const SizedBox(height: 10,),
                MaterialButton(
                  height: 70,
                  onPressed: passwordResetEmail,
                  color: Color.fromARGB(255, 225, 121, 35),
                  child: const Text('Recuperar Contraseña', style: TextStyle(color: Colors.white),),
                ),
                const SizedBox(height: 20,),
                const Text('Recomendaciones:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                const Text('- El correo debe ser verdadero para que te llegue el correo de recuperacion', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300), textAlign: TextAlign.justify,),
                const Text('- Debes añadir el simbolo de @ para que funcione correctamente', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300), textAlign: TextAlign.justify,),
                const Text('- En caso de haber creado tu cuenta recientemente, se debe esperar un apriximado de  12hrs en lo que es validado', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300), textAlign: TextAlign.justify,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
