import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
// ********* FIN USUARIOS *********
/* LEER LOS REGISTROS DE USUARIO */
Future<Map<String, dynamic>> getUsuario(String userId) async {
  /* String userId = 'g135Ifd07xnJBFHUEWiX';  */
  QuerySnapshot queryUsuario = await db
      .collection('usuario')
      .where(FieldPath.documentId, isEqualTo: userId)
      .get();
  if (queryUsuario.docs.isEmpty) {
    return {}; // Return empty map if no document found
  }
  final doc = queryUsuario.docs[0];
  final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  final Map<String, dynamic> user = {
    "id": doc.id,
    "usuario": data['usuario'],
    "nombre": data['nombre'],
    "apellidos": data['apellidos'],
    "correo": data['correo'],
    "telefono": data['telefono'],
    "estado": data['estado']
  };

  return user; // Return user data map
}

/* ACTUALIZAR UN REGISTRO EN LA BASE DE DATOS */
Future<void> updateUsuario(String idUsuario, String usuario, String nombre,
    String estado, String correo) async {
  final docRef = db.collection('usuario').doc(idUsuario);

  await docRef.update({
    "usuario": usuario,
    "nombre": nombre,
    "estado": estado,
    "correo": correo,
  });
}

// ********* FIN USUARIOS *********

// ********* VIDEOS *********
/* obtenemos los videos */

Future<List<Map<String, dynamic>>> getVideos() async {
  String filterType = "ball";
  List<Map<String, dynamic>> videos = [];
  CollectionReference collectionReferenceVideo = db.collection('video');
  QuerySnapshot queryVideo = await collectionReferenceVideo.get();
  for (var doc in queryVideo.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    // Verificar si se debe aplicar el filtro por nivel
    if (filterType == 'ball' && data['nivel'] != '1') {
      continue; // Saltar este video si el filtro es 'ball' y el nivel no es 0
    }
    final video = {
      "titulo": data['titulo'],
      "autor": data['autor'],
      "fecha": data['fecha'],
      "id": data['id'],
      "nivel": data['nivel'],
      "uid": doc.id,
    };
    videos.add(video);
  }
  // Ordenar los videos por título
  videos.sort((a, b) => a['titulo'].compareTo(b['titulo']));
  return videos;
}

// ********* FIN VIDEO *********

// ********* FIN COMENTARIOOS *********

/* TENER TODOS LOS COMENTARIOS */
Future<List> getComentario() async {
  
  List comentario = [];
  CollectionReference collectionReferenceUsuario = db.collection('comentario');
  QuerySnapshot queryComentario = await collectionReferenceUsuario.get();
  for (var doc in queryComentario.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final comentarios = {
      "nombre": data['nombre'],
      "comentario": data['comentario'],
      "tipoComentario": data['tipoComentario'],
      "uid": doc.id,
    };
    comentario.add(comentarios);
  }
  return comentario;
}

/* AÑADIR NUEVOS COMENTARIOS */
Future<void> addComentario(
    String comentario, String name, int tipoComentario) async {
  await db.collection("comentario").add({
    "comentario": comentario,
    "nombre": name,
    "tipoComentario": tipoComentario
  });
}

// ********* FIN COMENTARIOOS *********

// ********* DICCIONARIO *********

/* FILTRADO DE PALABRAS */
Future<List> getA(String letter) async {
  List palabra = [];
  CollectionReference collectionReferenceLetter = db.collection('palabra');
  QuerySnapshot queryLetter =
      await collectionReferenceLetter.where('letra', isEqualTo: letter).get();
  for (var documento in queryLetter.docs) {
    palabra.add(documento.data());
  }
  return palabra;
}

// ********* FIN DICCIONARIO *********

/* ACTUALIZAR UN REGISTRO EN LA BASE DE DATOS */
Future<void> updateComentario(String uid, String newName) async {
  await db
      .collection('usuario')
      .doc(uid)
      .set({"nombre": newName, "comentario": 'HOLA SOY LUIS'});
}
