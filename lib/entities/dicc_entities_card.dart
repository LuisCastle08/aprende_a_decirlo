import 'package:aprende_a_decirlo/screens/mains/screen_dictionary/extends/palabras_dictionary.dart';
import 'package:flutter/material.dart';

class LetraDiccEntitie extends StatelessWidget {
  final String letra;
  final String imagePath; // Add the `imagePath` parameter

  const LetraDiccEntitie(
      {super.key,
      required this.letra,
      required this.imagePath}); // Pass both parameters in the constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 180,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(244, 244, 244, 0.725),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: GestureDetector(
        onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (_) =>  PalabrasDictionary(title: letra,)));
        },
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 0,
                left: 10,
                child: Text(
                  letra.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(255, 77, 72, 72),
                      fontWeight: FontWeight.bold),
                )),
            Positioned(
              height: 120,
              width: 120,
              child: Image(
                // Use the `imagePath` parameter for the image source
                image: AssetImage(imagePath),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 10,
                child: Text(
                  letra.toLowerCase(),
                  style: const TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(255, 77, 77, 72),
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
