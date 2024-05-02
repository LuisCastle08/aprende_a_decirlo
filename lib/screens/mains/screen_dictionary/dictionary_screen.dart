import 'package:aprende_a_decirlo/entities/dicc_entities_card.dart';
import 'package:aprende_a_decirlo/screens/mains/screen_dictionary/extends/traductor_palabra.dart';
import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:aprende_a_decirlo/entities/shared/asset_local_abc.dart'; // Import the map

class PageDictionaryScreen extends StatefulWidget {
  const PageDictionaryScreen({super.key});

  @override
  State<PageDictionaryScreen> createState() => _PageDictionaryScreenState();
}

class _PageDictionaryScreenState extends State<PageDictionaryScreen> {
  @override
  Widget build(BuildContext context) {
    int tamanoABD = alfabetoRutas.length; // Get map length

    return Scaffold(
      appBar: const AppBarWidget(titleCustom: 'DICCIONARIO'),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: tamanoABD,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            // Get the letter key from the map at the current index
            String letra = alfabetoRutas.keys.elementAt(index);

            // Access the image path using the letter key
            String imagePath = '${alfabetoRutas[letra]}';

            return LetraDiccEntitie(
              letra: letra, // Pass the letter for potential display
              imagePath: imagePath, // Pass the image path for the Image widget
            );
          },
        ),
      ),
      floatingActionButton: SizedBox(
        width: 150,
        height: 60,
        child: FloatingActionButton(
          enableFeedback: true,
          /* shape: const StadiumBorder(), */ //BORDER RADIUS A CIRCULO
          onPressed: () {
            setState(() {
              
            });
            Navigator.push(context,MaterialPageRoute(builder: (_) =>  const TraductoPalabra()));
            
          },
          backgroundColor: const Color.fromRGBO(255, 118, 154, 1),
          child: const Text('TRADUCTOR', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),)
        ),
      ),
    );
  }
}