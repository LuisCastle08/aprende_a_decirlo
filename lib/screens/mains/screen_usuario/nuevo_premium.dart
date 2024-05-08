import 'package:aprende_a_decirlo/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NuevoUsuarioPremium extends StatefulWidget {
  const NuevoUsuarioPremium({super.key});

  @override
  State<NuevoUsuarioPremium> createState() => _NuevoUsuarioPremiumState();
}

class _NuevoUsuarioPremiumState extends State<NuevoUsuarioPremium> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'ADMIN USUARIOS',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.amber,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: FutureBuilder(
            future: getAllUsuarios(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final nombre = snapshot.data![index]['nombre'];
                    final usuario = snapshot.data![index]['usuario'];
                    final correo = snapshot.data![index]['correo'];
                    final genero = snapshot.data![index]['genero'];
                    final estado = snapshot.data![index]['estado'];
                    final membresia = snapshot.data![index]['membresia'];
                    final img = snapshot.data![index]['img'];
                    final uid = snapshot.data![index]['id'];

                    return Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      height: 200,
                      color: Color.fromARGB(255, 208, 169, 228),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  img,
                                  fit: BoxFit.cover,
                                  height: 70,
                                  width: 70,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                children: [
                                  Text(
                                    '$nombre | $usuario',
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '$correo',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    '$genero',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    '$estado',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    membresia != "0" ? 'Premium' : 'Publica',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    _mostrarConfirmacionEliminar('$uid');
                                  },
                                  child: const Text('Eliminar Usuario')),
                              ElevatedButton(
                                onPressed: () {
                                  _toggleMembresia(uid, membresia);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: membresia != "0"
                                      ? const Color.fromARGB(255, 255, 96, 84)
                                      : const Color.fromARGB(255, 67, 160, 38),
                                ),
                                child: Text(
                                  '${membresia != "0" ? 'Quitar' : 'Convertir'} Premium ',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }

  void _toggleMembresia(String uid, String membresia) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Modificar Membresia'),
        content: const Text('¿Estás seguro cambiar la membresia?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              final nuevoEstado = membresia != "0" ? '0' : '1';
              updateUsuario(uid, nuevoEstado);
              setState(() {}); 
              Navigator.of(context).pop(); // Cerrar el diálogo
            },
            child: const Text('Sí'),
          ),
        ],
      );
    },
  );



  }

  void _mostrarConfirmacionEliminar(String uid) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Confirmar eliminación'),
        content: const Text('¿Estás seguro de que deseas eliminar este usuario?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              eliminarDocumento(uid);
              Navigator.of(context).pop(); // Cerrar el diálogo
            },
            child: const Text('Sí'),
          ),
        ],
      );
    },
  );
}
}

/* ACTUALIZAR UN REGISTRO EN LA BASE DE DATOS */
Future<void> updateUsuario(String idUsuario, String valorMembresia) async {
  final docRef = db.collection('usuario').doc(idUsuario);

  await docRef.update({"membresia": valorMembresia});
}

Future<void> eliminarDocumento(String idDocumento) async {
  try {
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(idDocumento)
        .delete();
    print('Documento eliminado correctamente');
  } catch (e) {
    print('Error al eliminar documento: $e');
  }
}
