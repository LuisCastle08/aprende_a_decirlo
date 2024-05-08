import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;


// ********* DICCIONARIO *********

/* FILTRADO DE PALABRAS */
Future<List> getA(String letter) async {
  List palabra = [];
  CollectionReference collectionReferenceLetter = db.collection('palabra');
  QuerySnapshot queryLetter =
      await collectionReferenceLetter.where('letra', isEqualTo: letter.toUpperCase()).get();
  for (var documento in queryLetter.docs) {
    palabra.add(documento.data());
  }
  return palabra;
}

// ********* FIN DICCIONARIO *********


/* AÑADIR NUEVOS COMENTARIOS */
Future<void> addPalabra(
    String letra, String palabra, String instrucciones, String significado, String tipo ,String img) async {
  await db.collection("palabra").add({
    "letra": letra,
    "palabra": palabra,
    "instrucciones": instrucciones,
    "significado": significado,
    "tipo": tipo,
    "img":img
  });
}




/* TODOS LOS USUARIOS */

Future<List<Map<String, dynamic>>> getAllUsuarios() async {
  QuerySnapshot queryUsuarios = await db.collection('usuario').get();
  List<Map<String, dynamic>> usuariosList = [];
  for (var doc in queryUsuarios.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final Map<String, dynamic> user = {
      "id": doc.id,
      "usuario": data['usuario'],
      "nombre": data['nombre'],
      "correo": data['correo'],
      "membresia": data['membresia'],
      "estado": data['estado'],
      "genero": data['genero'],
      "img" : data['img']
    };
    usuariosList.add(user);
  }
  return usuariosList;
}
