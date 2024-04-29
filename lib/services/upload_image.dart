import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

Future<String?> uploadImage(File image) async {
  print('----------------------------');
  print(image.path);
  final String nameFile = image.path.split("/").last;
  print(nameFile);

  Reference ref = storage.ref().child("images").child(nameFile);

  final UploadTask uploadTask = ref.putFile(image);

  print(uploadTask);

  final TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);
  print(snapshot);

  final String url = await snapshot.ref.getDownloadURL();
  print(url);

  if (snapshot.state == TaskState.success) {
    return url;
  } else {
    return null;
  }
}
