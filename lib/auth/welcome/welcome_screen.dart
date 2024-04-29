import 'package:aprende_a_decirlo/auth/login/login.dart';
import 'package:aprende_a_decirlo/auth/register/register.dart';
import 'package:aprende_a_decirlo/auth/welcome/extends/background_video_welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackgroundVideo(),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(99, 0, 0, 0)
            ),
            child: Expanded(
              child: Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 70),
                      child: Text(
                        'APRENDE A DECIRLO',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromRGBO(224, 219, 221, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Image(
                      image: AssetImage('assets/logo.png'),
                      width: 250,
                      height: 250,
                    ),
                    const SizedBox(height: 150,),
                    const Text(
                      'BIENVENIDO',
                      style: TextStyle(
                          fontSize: 30,
                          color: Color.fromRGBO(255, 118, 154, 1),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Login()));
                      },
                      child: Container(
                        height: 53,
                        width: 320,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromRGBO(251, 250, 251, 1),
                          border: Border.all(
                              color: const Color.fromARGB(255, 255, 255, 255)),
                        ),
                        child: const Center(
                          child: Text(
                            'INICIAR SESIÓN',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 23, 22, 22)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Register()));
                      },
                      child: Container(
                        height: 53,
                        width: 320,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 118, 154, 1),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white),
                        ),
                        child: const Center(
                          child: Text(
                            'REGISTRATE',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 235, 232, 232)),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}