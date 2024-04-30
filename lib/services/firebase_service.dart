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