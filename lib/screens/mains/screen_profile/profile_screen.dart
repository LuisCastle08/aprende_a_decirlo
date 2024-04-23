import 'package:aprende_a_decirlo/auth/login/login.dart';
import 'package:aprende_a_decirlo/services/firebase_service.dart';
import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:aprende_a_decirlo/widgets/input_profile.dart';
import 'package:flutter/material.dart';

class PageProfileScreen extends StatelessWidget {
  final String userId;
  const PageProfileScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    TextEditingController estadoText = TextEditingController(text: "");
    TextEditingController telefonoText = TextEditingController(text: "");
    TextEditingController correoText = TextEditingController(text: "");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarWidget(
        titleCustom: 'PERFIL',
        borderCustom: 0,
      ),
      body: FutureBuilder(
        future: getUsuario(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final id = snapshot.data!['id'];
            final usuario = snapshot.data!['usuario'];
            final nombre = snapshot.data!['nombre'];
            final correo = snapshot.data!['correo'];
            final estado = snapshot.data!['estado'];

            estadoText.text = estado;
            telefonoText.text = "telefono";
            correoText.text = correo;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height: 250,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 234, 151, 1),
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(30)),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.perm_identity_outlined,
                            size: 120,
                          ),
                          Text(
                            usuario,
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                color: Color.fromARGB(255, 83, 59, 22)),
                          ),
                          Text(
                            nombre,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Color.fromARGB(255, 83, 59, 22)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "#${1} $estado",
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800,
                                    color: Color.fromARGB(255, 83, 59, 22)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(Icons.remove_red_eye,
                                  color: Color.fromARGB(255, 114, 113, 113))
                            ],
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "INFORMACION Y",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Color.fromRGBO(255, 118, 154, 1),
                          ),
                        ),
                        const Text(
                          "SEGURIDAD",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Color.fromRGBO(255, 118, 154, 1),
                          ),
                        ),
                        InputProfileCustom(
                          customController: estadoText,
                          hintText: "Estado",
                          iconCustom: Icons.airline_seat_individual_suite_sharp,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputProfileCustom(
                          customController: telefonoText,
                          hintText: "Telefono Celular",
                          iconCustom: Icons.phone,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputProfileCustom(
                          customController: correoText,
                          hintText: "Correo@gmail.com",
                          iconCustom: Icons.attach_email_rounded,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            updateUsuario(id, usuario , nombre,estadoText.text,
                                correoText.text);
                          },
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15),
                                    bottom: Radius.circular(15)),
                                color: Color.fromRGBO(151, 187, 121, 1)),
                            child: const Center(
                              child: Text(
                                'ACTUALIZAR DATOS',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const Login()));
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
                                'CERRAR SESIÓN',
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
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
