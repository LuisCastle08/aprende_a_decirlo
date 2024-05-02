import 'package:aprende_a_decirlo/screens/mains/screen_games/extends/game_memorama.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BoxGameEntities extends StatelessWidget {
  final String nameGameCustom;
  final int? levelGameCustom;

  const BoxGameEntities({
    super.key,
    required this.nameGameCustom,
    required this.levelGameCustom,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (_) => const GameMemorama()));
            },
            child: Container(
              width: double
                  .infinity, // Esto hace que el contenedor ocupe todo el ancho disponible
              height: 140,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 146, 197, 83),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    nameGameCustom.toUpperCase(),
                    style: const TextStyle(
                      color: Color.fromRGBO(245, 243, 243, 1),
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'Nivel $levelGameCustom',
                    style: const TextStyle(
                      color: Color.fromRGBO(245, 243, 243, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
