import 'dart:io';
import 'dart:typed_data'; // Importa el paquete 'typed_data'
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image/image.dart' as img;

final FirebaseStorage storage = FirebaseStorage.instance;

Future<String?> uploadImage(String letraPalabra, File image) async {
  print('----------------------------');
  print(image.path);
  final String nameFile = image.path.split("/").last;
  print(nameFile);

  // Lee la imagen
  List<int> imageBytes = await image.readAsBytes();

  // Convierte List<int> a Uint8List
  Uint8List uint8listImageBytes = Uint8List.fromList(imageBytes);

  img.Image? decodedImage = img.decodeImage(uint8listImageBytes);

  // Redimensiona la imagen (aquí puedes ajustar el tamaño según tus necesidades)
  img.Image resizedImage = img.copyResize(decodedImage!, width: 250);

  // Guarda la imagen redimensionada en un nuevo archivo temporal
  File resizedFile = File('${image.path}_resized.jpg');
  await resizedFile.writeAsBytes(img.encodeJpg(resizedImage));

  // Utiliza el nombre del archivo redimensionado para la referencia en Firebase Storage
  final String resizedFileName = resizedFile.path.split("/").last;

  Reference ref = storage.ref().child("traductor/palabra/$letraPalabra").child(resizedFileName);

  final UploadTask uploadTask = ref.putFile(resizedFile);

  print(uploadTask);

  final TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);
  print(snapshot);

  final String url = await snapshot.ref.getDownloadURL();
  print(url);

  // Elimina el archivo temporal redimensionado después de cargar la imagen
  await resizedFile.delete();

  if (snapshot.state == TaskState.success) {
    return url;
  } else {
    return null;
  }
}
