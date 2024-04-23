import 'package:aprende_a_decirlo/entities/palabra_entities_dictionary.dart';
import 'package:aprende_a_decirlo/services/firebase_service.dart';
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
                useHidePassword: false,
                  hintText: 'Busca una Palabra con ${title.toUpperCase()}'),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: FutureBuilder(
                future: getA(title),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        
                        final palabra = snapshot.data![index]['dic_palabra'];
                        return PalabraDictionaryEntitie(palabra: palabra);

                      },
                    );
                  } else {
                    // Manejar el caso en que no haya datos disponibles
                    return const Center(
                        child:
                            CircularProgressIndicator()); // o cualquier otro indicador de carga
                  }
                },
              )),
            ],
          )),
    );
  }
}
