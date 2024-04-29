import 'dart:io';

import 'package:aprende_a_decirlo/auth/login/login.dart';
import 'package:aprende_a_decirlo/services/select_image.dart';
import 'package:aprende_a_decirlo/services/upload_image.dart';
import 'package:aprende_a_decirlo/widgets/input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final usuarioController = TextEditingController();
  final nombreController = TextEditingController();
  final estadoController = TextEditingController();
  final correoController = TextEditingController();
  final contrasenaController = TextEditingController();
  final confirmarContrasenaController = TextEditingController();

  File? imagen_to_upload;

  
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
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
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
              children: <Widget>[
                const SizedBox(
                  height: 130,
                  child: Image(image: AssetImage('assets/banner_logo.png')),
                ),
                InputForm(
                  hintText: "USUARIO",
                  iconCustom: Icons.mood,
                  textController: usuarioController,
                  useHidePassword: false,
                ),
                const SizedBox(height: 25),
                InputForm(
                  hintText: "NOMBRE",
                  iconCustom: Icons.mood,
                  textController: nombreController,
                  useHidePassword: false,
                ),
                const SizedBox(height: 25),
                InputForm(
                  hintText: "ESTADO",
                  iconCustom: Icons.phone,
                  textController: estadoController,
                  useHidePassword: false,
                ),
                const SizedBox(height: 25),
                InputForm(
                  hintText: "CORREO",
                  iconCustom: Icons.mail,
                  textController: correoController,
                  useHidePassword: false,
                ),
                const SizedBox(height: 25),
                InputForm(
                  hintText: "CONTRASEÑA",
                  iconCustom: Icons.key,
                  textController: contrasenaController,
                  useHidePassword:
                      true, // Para la contraseña, podrías querer habilitar la opción de ocultar/mostrar
                ),
                const SizedBox(height: 25),
                InputForm(
                  hintText: "CONFIRMAR CONTRASEÑA",
                  iconCustom: Icons.key,
                  textController: confirmarContrasenaController,
                  useHidePassword:
                      true, // Lo mismo aquí, si es una confirmación de contraseña, podrías querer habilitar la opción de ocultar/mostrar
                ),
                const SizedBox(height: 30),
                imagen_to_upload != null
                    ? Image.file(imagen_to_upload!)
                    : const ClipOval(
                        child: Image(
                          height: 120,
                          image: AssetImage('assets/img_profile2.png'),
                        ),
                      ),
                const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () async {
                      final imagen = await getImage();
                      if (imagen != null) {
                        setState(() {
                          imagen_to_upload = File(imagen.path);
                        });
                      } else {
                        setState(() {
                          imagen_to_upload = null;
                        });
                      }
                    },
                    child: const Text("Subir una imagen")),
                const SizedBox(height: 30),
                const Text(
                  'Al hacer clic en "REGISTRARSE" aceptas nuestros',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const Text(
                  'Términos y Condiciones',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 118, 154, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () async {

                      if (imagen_to_upload == null) {
                         ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: 
                          Text('Debes subir una imagen')
                      ));
                      }else{
                        final imageUrl = await uploadImage(imagen_to_upload!);
                    if (imageUrl != null) {

                    if (nombreController.text.isEmpty ||
                        usuarioController.text.isEmpty ||
                        estadoController.text.isEmpty ||
                        correoController.text.isEmpty ||
                        contrasenaController.text.isEmpty ||
                        confirmarContrasenaController.text.isEmpty) {
                      // Realiza alguna acción si algún campo está vacío
                      print('Por favor, completa todos los campos.');
                    } else {
                      if (contrasenaController.text !=
                          confirmarContrasenaController.text) {
                        // La contraseña y la confirmación de contraseña no coinciden
                        print(
                            'La contraseña y la confirmación de contraseña no coinciden.');
                      } else {
                        addUser(
                            context,
                            usuarioController.text,
                            nombreController.text,
                            contrasenaController.text,
                            estadoController.text,
                            correoController.text,
                            imageUrl
                            );
                        // La contraseña y la confirmación de contraseña coinciden
                        print(
                            '¡Todos los campos están completos y la contraseña coincide!');
                      }
                    }
                    } else {
                      // Hubo un error al subir la imagen
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Error en subida de imagen')));
                    }
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
          )),
    );
  }
}

/* AÑADIR NUEVOS usuarios */
Future<void> addUser(BuildContext context, String usuario, String nombre,
    String contrasena, String estado, String correo, String img) async {
  // Consultar si el usuario ya existe
  var usuarioExistente =
      await db.collection("usuario").where("usuario", isEqualTo: usuario).get();
  // Consultar si el correo ya existe
  var correoExistente =
      await db.collection("usuario").where("correo", isEqualTo: correo).get();

  // Verificar si ya existe un documento con el mismo usuario o correo electrónico
  if (usuarioExistente.docs.isNotEmpty) {
    showDialog(
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: const Text('ERROR USUARIO YA EXISTE'),
            content: const Text(
                'Credenciales YA EXISTENTES. \nPor favor, inténtalo de nuevo.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
        context: context // No necesitas pasar context aquí

        );

    return;
  }

  if (correoExistente.docs.isNotEmpty) {
    showDialog(
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: const Text('ERROR CORREO YA EXISTE'),
            content: const Text(
                'Credenciales YA EXISTENTES. \nPor favor, inténtalo de nuevo.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
        context: context // No necesitas pasar context aquí

        );
    return;
  }

  // Si el usuario y el correo electrónico son únicos, agregar el nuevo usuario a la base de datos
  await db.collection("usuario").add({
    "usuario": usuario,
    "nombre": nombre,
    "contrasena": contrasena,
    "estado": estado,
    "correo": correo,
    "membresia": '0',
    "img": img
  });

  Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));

  print('¡Usuario agregado exitosamente!');
}
