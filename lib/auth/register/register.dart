import 'package:aprende_a_decirlo/screens/main_screen.dart';
import 'package:aprende_a_decirlo/widgets/input_form.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left_outlined),
            iconSize: 50,
            color: const Color.fromRGBO(255, 118, 154, 1),
          ),
          title: const Text('REGISTRO'),
          centerTitle: true,
          titleTextStyle: const TextStyle(
              color: Color.fromRGBO(255, 118, 154, 1),
              fontSize: 40,
              fontWeight: FontWeight.w900),
          toolbarHeight: 100,
          backgroundColor: const Color.fromRGBO(255, 234, 151, 1),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          actions: [
            Container(
              width: 50,
              margin: const EdgeInsets.only(right: 20),
              color: Colors.white,
              child: const Image(image: AssetImage('assets/logo.png')),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: ListView(
              children:  <Widget>[
                 const SizedBox(
                  height: 130,
                  child: Image(image: AssetImage('assets/banner_logo.png')),
                 ),
                const InputForm(hintText: "NOMBRE"),
                const SizedBox(height: 25,),
                const InputForm(hintText: "APELLIDOS"),
                const SizedBox(height: 25,),
                const InputForm(hintText: "TELEFONO"),
                const SizedBox(height: 25,),
                const InputForm(hintText: "CORREO"),
                const SizedBox(height: 25,),
                const InputForm(hintText: "CONTRASEÑA"),
                const SizedBox(height: 25,),
                const InputForm(hintText: "CONFIRMAR CONTRASEÑA"),
                const SizedBox(height: 30),
                const Text('Al hacer clic en "REGISTRARSE" aceptas nuestros', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                const Text('Términos y Condiciones', style: TextStyle(color: Color.fromRGBO(255, 118, 154, 1), fontSize: 18, fontWeight: FontWeight.w500),),
                const SizedBox(height: 30),

                GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const VideosScreen()));
                      },
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15),
                              bottom: Radius.circular(15)),
                          color: Color.fromRGBO(255, 118, 154, 1),
                        ),
                        child: const Center(
                          child: Text(
                            'REGISTRARSE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                 
              ],
          ),
        )
        ),
      
    );
  }
}
