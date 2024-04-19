import 'package:aprende_a_decirlo/entities/palabra_entities_dictionary.dart';
import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:aprende_a_decirlo/widgets/input_form.dart';
import 'package:flutter/material.dart';

class PalabrasDictionary extends StatelessWidget {
  final String title;

  const PalabrasDictionary({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(titleCustom: title.toUpperCase() + title),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              InputForm(
                iconCustom: Icons.search,
                hintText: 'Busca una Palabra con ${title.toUpperCase()}'
                ),
              const SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return  PalabraDictionaryEntitie(letra: title);
                  },
                ),
              ),
            ],
          )),

    
    );

  }
}
