import 'package:aprende_a_decirlo/screens/main_screen.dart';
import 'package:aprende_a_decirlo/auth/register/register.dart';
import 'package:aprende_a_decirlo/widgets/input_form.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usuario = TextEditingController(text: "");
    TextEditingController password = TextEditingController(text: "");
  
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
                      child: InputForm(
                        iconCustom: Icons.person,
                        hintText: 'USUARIO',
                        textController: usuario,
                        useHidePassword: false ,
                      ),
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
                      child: InputForm(
                        useHidePassword: true,
                        iconCustom: Icons.key,
                        hintText: 'CONTRASEÑA',
                        textController: password,
                      ),
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
                        /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const VideosScreen())); */

                        if (usuario.text == "" || password.text == "") {
                          showDialog(
                            builder: (BuildContext context) {
                              return Center(
                                child: AlertDialog(
                                  title: const Text('ERROR'),
                                  content: const Text(
                                      'Alguno de los campos esta VACIO'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            context: context,
                          );
                        }else{
                          validarCredenciales(context, usuario.text, password.text);
                        }
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

Future<void> validarCredenciales(
    BuildContext context, String nombreUsuario, String contrasena) async {
  // Referencia a la colección 'usuario' en Firestore
  CollectionReference collectionReferenceUsuario = db.collection('usuario');

  // Consulta Firestore para buscar documentos con el campo 'nombre' igual al nombre de usuario especificado
  QuerySnapshot queryUsuario = await collectionReferenceUsuario
      .where('usuario', isEqualTo: nombreUsuario)
      .where('contrasena', isEqualTo: contrasena)
      .get();

  // Verificar si se encontraron documentos que coinciden con el nombre de usuario y contraseña
  if (queryUsuario.docs.isNotEmpty) {
    // Obtener el primer documento encontrado (asumiendo que solo hay uno)
    QueryDocumentSnapshot usuarioDoc = queryUsuario.docs.first;
    // Obtener la ID del documento
    String userId = usuarioDoc.id;
    // Obtener el tipo de membresía del usuario
    String membresia = usuarioDoc.get('membresia') ?? 'membresia_no_definida';

    // Si las credenciales son válidas, redirige a la nueva ventana
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => VideosScreen(
          userId: userId,
          nombreUser: nombreUsuario,
          membresia: membresia, // Pasar la membresía a VideosScreen
        ),
      ),
    );
  } else {
    // Si las credenciales no son válidas, muestra un mensaje de error o toma otra acción
    showDialog(
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error de inicio de sesión'),
          content: const Text(
              'Credenciales incorrectas. Por favor, inténtalo de nuevo.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
      context: context,
    );
  }
}
