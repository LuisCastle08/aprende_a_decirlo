import 'package:aprende_a_decirlo/entities/games_entities.dart';
import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class PageGameScreen extends StatelessWidget {
  const PageGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(titleCustom: 'VIDEO'),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
        child: ListView(
          children: const <Widget>[
            BoxGameEntities(
              nameGameCustom: 'SOPA DE LETRAS',
              levelGameCustom: 1,
              progresGameCustom: 0.1,
            ),
            BoxGameEntities(
              nameGameCustom: 'CIRCULO DE PALABRAS',
              levelGameCustom: 1,
              progresGameCustom: 1,
            ),
            BoxGameEntities(
              nameGameCustom: 'QUIZ DE SEÑAS',
              levelGameCustom: 1,
              progresGameCustom: .5,
            ),
            BoxGameEntities(
              nameGameCustom: 'PROXIMAMENTE',
              levelGameCustom: 3,
              progresGameCustom: 0.0,
            ),
          ],
        ),
      ),
    );
  }
}
