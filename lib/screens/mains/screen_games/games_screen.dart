import 'package:aprende_a_decirlo/entities/games_entities.dart';
import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';


class PageGameScreen extends StatelessWidget {
  const PageGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: const AppBarWidget(titleCustom: 'VIDEOS'),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
        child: ListView(
          children: const [
              BoxGameEntities(nameGameCustom: 'MEMORAMA', levelGameCustom: 1),
        
          ],
        ),
      ),
    );
  }
}