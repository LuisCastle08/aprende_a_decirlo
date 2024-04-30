import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class UsePalabraDictionary extends StatelessWidget {
  final String title;
  final String palabra;
  final String img;
  final String instrucciones;
  final String significado;

  const UsePalabraDictionary({
    super.key,
    required this.title,
    required this.palabra,
    required this.img,
    required this.instrucciones,
    required this.significado,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(titleCustom: '${title.toUpperCase()}$title'),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 500,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(181, 220, 134, 1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox.expand(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            palabra,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Stack(
                        children: [
                          SizedBox.expand(
                            child: Image.network(
                              img,
                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child; // Imagen cargada, muestra la imagen
                                } else {
                                  return Center(child: CircularProgressIndicator()); // Mientras carga, muestra el CircularProgressIndicator
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            instrucciones,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(181, 220, 134, 1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox.expand(
                    child: SingleChildScrollView(
                      child: Text(
                        significado,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
