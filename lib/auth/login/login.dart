import 'package:aprende_a_decirlo/screens/main_screen.dart';
import 'package:aprende_a_decirlo/auth/register/register.dart';
import 'package:aprende_a_decirlo/widgets/input_form.dart';
import 'package:flutter/material.dart';



class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    child: Image(image: AssetImage('assets/logo.png')),
                  ),
                  Text(
                    'INICIAR SESIÓN',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 118, 154, 1),
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 234, 151, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                            bottom: Radius.circular(15)),
                      ),
                      child: const InputForm(
                          iconCustom: Icons.person, hintText: 'USUARIO'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                            bottom: Radius.circular(15)),
                      ),
                      child: const InputForm(
                          iconCustom: Icons.key, hintText: 'CONTRASEÑA'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'He olvidado mi contraseña',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(150, 58, 82, 1),
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
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
                            'ENTRAR',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    const Text(
                      '¿Todavia no tienes cuenta?',
                      style: TextStyle(
                          color: Color.fromRGBO(150, 58, 82, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const Register()));
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
              ),
            ))
          ],
        ),
      ),
    );
  }
}
