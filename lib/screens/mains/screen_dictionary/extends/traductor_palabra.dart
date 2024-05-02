
import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:aprende_a_decirlo/entities/shared/asset_local_traductor.dart';

class TraductoPalabra extends StatefulWidget {
  const TraductoPalabra({super.key});

  @override
  State<TraductoPalabra> createState() => _TraductoPalabraState();
}

class _TraductoPalabraState extends State<TraductoPalabra> {
  List<Map<String, String>> resultado = [];
  String cantidadTxt = '';
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(titleCustom: 'TRADUCTOR'),
      body: Container(
        padding: const EdgeInsets.all(10),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              ElevatedButton(
                onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Recomendaciones'),
                          content: const SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Aquí puedes ver algunas recomendaciones:'),
                                SizedBox(height: 10),
                                // Replace with your actual recommendations
                                ListTile(
                                  leading: Icon(Icons.favorite),
                                  title: Text('Recomendación 1'),
                                  subtitle: Text('Está es la Version de Deletreo, trata de usar palabras que puedan ser deletreadas y evitar preguntas o signos de exclamación'),
                                ),
                                ListTile(
                                  leading: Icon(Icons.lightbulb),
                                  title: Text('Recomendación 2'),
                                  subtitle: Text('Se recomienda evitar llegar al limite para que el texto sea completo'),
                                ),
                                ListTile(
                                  leading: Icon(Icons.add_circle),
                                  title: Text('Recomendación 3'),
                                  subtitle: Text('Se buscara entre las palabras existentes en la app, en caso de no encontrarlas se Deletreara'),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: const Text('Cerrar'),
                            ),
                          ],
                        );
                      },
                    );
                },
                child: const Text('Mostrar recomendaciones'),
              ),
              const SizedBox(height: 10),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5), // Adjust padding for SingleChildScrollView
                height: 50,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(176, 239, 235, 235),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                    bottom: Radius.circular(15),
                  ),
                ),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: TextFormField(
                        controller: textController,
                        maxLines: null, // Allow unlimited lines
                        decoration: const InputDecoration(
                          hintText: 'Escribe algo',
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 123, 123, 123),
                            fontWeight: FontWeight.w600,
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (String value) {
                          setState(() {
                            cantidadTxt = value;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            cantidadTxt = '';
                            textController.clear();
                          });
                        },
                        icon: const Icon(Icons.close_outlined),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: Text(
                        "${cantidadTxt.length}/50",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 5,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, // Define el número de elementos por fila
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemCount: resultado.length,
                itemBuilder: (context, index) {
                  final imagen = resultado[index].values.first;
                  return Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                imagen,
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 150,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            // Almacenar el resultado de la función traductor en resultado
            setState(() {
              resultado = traductor(textController.text);
            });
          },
          backgroundColor: const Color.fromRGBO(255, 234, 151, 1),
          child: const Text(
            'TRADUCIR',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(35, 35, 35, 1),
            ),
          ),
        ),
      ),
    );
  }
}
