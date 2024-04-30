import 'package:aprende_a_decirlo/screens/mains/screen_dictionary/extends/use_palabra_dictionary.dart';
import 'package:flutter/material.dart';

class PalabraDictionaryEntitie extends StatelessWidget {
  final String letra;
  final String palabra;
  final String img;
  final String instrucciones;
  final String significado;
  const PalabraDictionaryEntitie(
      {super.key, this.letra = 'a', required this.palabra, required this.img, required this.instrucciones, required this.significado});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => UsePalabraDictionary(
                          palabra: palabra,
                          title: letra,
                          img:img,
                          instrucciones: instrucciones,
                          significado: significado,

                        )));
          },
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(172, 215, 120, 1),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: SizedBox.expand(
                child: Text(
                  palabra.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
