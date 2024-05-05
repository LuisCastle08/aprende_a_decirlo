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
    "estado": data['estado'],
    "genero": data['genero'],
    "img" : data['img']
  };

  return user; // Return user data map
}

/* ACTUALIZAR UN REGISTRO EN LA BASE DE DATOS */
Future<void> updateUsuario(String idUsuario, String usuario, String nombre,
    String genero, String correo) async {
  final docRef = db.collection('usuario').doc(idUsuario);

  await docRef.update({
    "usuario": usuario,
    "nombre": nombre,
    "genero": genero,
    "correo": correo,
  });
}

// ********* FIN USUARIOS *********

// ********* VIDEOS *********
/* obtenemos los videos */
Future<List<Map<String, dynamic>>> getVideos(String membresia) async {
  
  List<Map<String, dynamic>> video = [];
  CollectionReference collectionReferenceVideo = db.collection('video');
  QuerySnapshot queryVideo =
      await collectionReferenceVideo.where('nivel', isEqualTo: membresia).get();
  for (var doc in queryVideo.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final videos = {
      "titulo": data['titulo'],
      "autor": data['autor'],
      "fecha": data['fecha'],
      "id": data['id'],
      "nivel": data['nivel'],
      "uid": doc.id,
    };
    video.add(videos);
  }
  // Ordenar los videos por título
  video.sort((a, b) => a['titulo'].compareTo(b['titulo']));
  return video;
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
      "fecha": data['fecha'],
      "img" : data['img'],
      "uid": doc.id,
    };

    comentario.add(comentarios);
  }
  return comentario;
}

/* AÑADIR NUEVOS COMENTARIOS */
Future<void> addComentario(
    String comentario, String name, int tipoComentario, DateTime fecha, String img) async {
  await db.collection("comentario").add({
    "comentario": comentario,
    "nombre": name,
    "tipoComentario": tipoComentario,
    "fecha": fecha,
    "img":img
  });
}

// ********* FIN COMENTARIOOS *********

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

/* ACTUALIZAR UN REGISTRO EN LA BASE DE DATOS */
Future<void> updateComentario(String uid, String newName) async {
  await db
      .collection('usuario')
      .doc(uid)
      .set({"nombre": newName, "comentario": 'HOLA SOY LUIS'});
}
