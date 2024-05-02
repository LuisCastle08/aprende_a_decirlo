import 'package:aprende_a_decirlo/auth/login/login.dart';
import 'package:aprende_a_decirlo/entities/shared/asset_local_perfil.dart';
import 'package:aprende_a_decirlo/entities/shared/estados_mexico.dart';
import 'package:aprende_a_decirlo/entities/shared/generos_registro.dart';
import 'package:aprende_a_decirlo/widgets/input_form.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final usuarioController = TextEditingController();
  final nombreController = TextEditingController();

  final correoController = TextEditingController();
  final contrasenaController = TextEditingController();
  final confirmarContrasenaController = TextEditingController();

  String rutaImgProfile = '';
  String estado = '';
  String genero = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: const EdgeInsets.only(left: 50, bottom: 50, right: 50),
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(176, 239, 235, 235),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15), bottom: Radius.circular(15)),
                ),
                child: DropdownButtonFormField(
                  hint: const Text('Selecciona tú Estado'),
                  items: estadosMexico.map((name) {
                    return DropdownMenuItem(
                      value: name,
                      child: Text(name[0].toUpperCase() +
                          name.substring(1)), // Capitaliza la primera letra
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      estado = '$value';
                    });
                    print(value);
                  },
                ),
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
              
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(176, 239, 235, 235),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15), bottom: Radius.circular(15)),
                ),
                child: DropdownButtonFormField(
                  hint: const Text('Selecciona tú Genero'),
                  items: generos.map((name) {
                    return DropdownMenuItem(
                      value: name,
                      child: Text(name[0].toUpperCase() +
                          name.substring(1)), // Capitaliza la primera letra
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      genero = '$value';
                    });
                    print(value);
                  },
                ),
              ),

              const SizedBox(height: 30),
              rutaImgProfile == ''
                  ? const ClipOval(
                      child: Image(
                        height: 120,
                        image: AssetImage('assets/img_profile2.png'),
                      ),
                    )
                  : ClipOval(
                      child: Image(
                        height: 120,
                        image: AssetImage(rutaImgProfile),
                      ),
                    ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(176, 239, 235, 235),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15), bottom: Radius.circular(15)),
                ),
                child: DropdownButtonFormField(
                  hint: const Text('Selecciona un Avatar de Perfil'),
                  items: perfilRutas.map((name) {
                    return DropdownMenuItem(
                      value: name,
                      child: Text(name[0].toUpperCase() +
                          name.substring(1)), // Capitaliza la primera letra
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      rutaImgProfile = 'assets/perfiles/$value.png';
                    });
                    print(value);
                  },
                ),
              ),
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
                  String imageUrl = rutaImgProfile;
                  if (rutaImgProfile == '') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'Debes seleccionar una Imagen de Perfil',
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Color.fromARGB(255, 244, 212, 54),
                    ));
                  } else {
                    if (nombreController.text.isEmpty ||
                        usuarioController.text.isEmpty ||
                        estado == '' ||
                        genero == '' ||
                        correoController.text.isEmpty ||
                        contrasenaController.text.isEmpty ||
                        confirmarContrasenaController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          'Debes rellenar Todos los Campos',
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Color.fromARGB(255, 244, 212, 54),
                      ));
                    } else {
                      if (contrasenaController.text !=
                          confirmarContrasenaController.text) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Las Contraseñas deben Coincidir',
                            style: TextStyle(color: Colors.black),
                          ),
                          backgroundColor: Color.fromARGB(255, 244, 212, 54),
                        ));
                      } else {
                        addUser(
                            context,
                            usuarioController.text,
                            nombreController.text,
                            contrasenaController.text,
                            estado,
                            genero,
                            correoController.text,
                            imageUrl);
                      }
                    }
                  }
                },
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15), bottom: Radius.circular(15)),
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
        ));
  }
}

Future<void> addUser(
  BuildContext context,
  String usuario,
  String nombre,
  String contrasena,
  String estado,
  String genero,
  String correo,
  String img,
) async {
  final userCollection = db.collection("usuario");

  // Consultar si el usuario ya existe
  final existeUsuario =
      await userCollection.where("usuario", isEqualTo: usuario).get();

  // Consultar si el correo ya existe
  final existeCorreo =
      await userCollection.where("correo", isEqualTo: correo).get();

  // Verificar si ya existe un usuario o correo electrónico
  if (existeUsuario.docs.isNotEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ya Existe el Usuario $usuario'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  if (existeCorreo.docs.isNotEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ya Existe el Correo $correo'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  // Agregar el nuevo usuario a la base de datos
  await userCollection.add({
    "usuario": usuario,
    "nombre": nombre,
    "contrasena": contrasena,
    "estado": estado,
    "genero": genero,
    "correo": correo,
    "membresia": '0',
    "img": img,
  });

  showDialog(
    context: context,
    builder: (BuildContext dialogContext) => AlertDialog(
      backgroundColor: Colors.green, // Fondo verde
      content: const Column(
        mainAxisSize: MainAxisSize.min, // Ajustar el tamaño del contenido
        children: <Widget>[
          Text(
            'Registro exitoso',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Texto en color blanco
            ),
          ),
          SizedBox(height: 10), // Espacio entre el título y el texto
          Text(
            '¡El usuario ha sido registrado exitosamente!',
            style: TextStyle(
              fontSize: 16,
              color:
                  Color.fromARGB(255, 250, 250, 250), // Texto en color blanco
            ),
            textAlign: TextAlign.center, // Texto centrado
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(dialogContext).pop();
            // Redirigir al usuario a la pantalla de inicio de sesión
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const Login()));
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
