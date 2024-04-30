import 'package:aprende_a_decirlo/subirPalabra/subir_palabra_interface.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dilo En Señas',
/*         theme: ThemeData(
    brightness: Brightness.dark, 
    primarySwatch: Colors.pink,
  ), */
      debugShowCheckedModeBanner: false,
      home: const SubirPalabraInterface(),
    );
  }
}
