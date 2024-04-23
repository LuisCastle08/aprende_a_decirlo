import 'package:aprende_a_decirlo/screens/mains/screen_dictionary/extends/use_palabra_dictionary.dart';
import 'package:flutter/material.dart';

class PalabraDictionaryEntitie extends StatelessWidget {
  final String letra;
  final String palabra;
  const PalabraDictionaryEntitie({super.key,  this.letra='a', required this.palabra});

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
                      fontSize: 45,
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
