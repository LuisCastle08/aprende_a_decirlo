import 'package:aprende_a_decirlo/entities/video_entities.dart';
import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:aprende_a_decirlo/widgets/input_form.dart';
import 'package:flutter/material.dart';

class PageVideosScreen extends StatelessWidget {
  const PageVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: const AppBarWidget(titleCustom: 'VIDEOS'),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
        child: ListView(
          children: const <Widget>[
            InputForm(
              hintText: 'Buscar',
              iconCustom: Icons.search,
            ),
            SizedBox(
              height: 20,
            ),
            VideoEntities(nameVideo: 'PALABRAS BASICAS #1', nameAutor: 'Luis Castillo', viewsVideo: 10000, fechaVideo: 20,),
            VideoEntities(nameVideo: 'Familiares #2', nameAutor: 'Skids United', viewsVideo: 2003, fechaVideo: 8,),
            VideoEntities(nameVideo: 'Objetos #3', nameAutor: 'Castle King', viewsVideo: 1004, fechaVideo: 1,),
            VideoEntities(nameVideo: 'Objetos #4', nameAutor: 'Cumbia', viewsVideo: 104, fechaVideo: 9,),

          ],
        ),
      ),
    );
  }
}