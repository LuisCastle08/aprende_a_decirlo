import 'dart:ffi';
import 'dart:io';
import 'package:aprende_a_decirlo/screens/mains/screen_dictionary/dictionary_screen.dart';
import 'package:aprende_a_decirlo/services/firebase_service.dart';
import 'package:aprende_a_decirlo/services/select_image.dart';
import 'package:aprende_a_decirlo/services/upload_image.dart';
import 'package:aprende_a_decirlo/widgets/input_form.dart';
import 'package:flutter/material.dart';

class SubirPalabraInterface extends StatefulWidget {
  const SubirPalabraInterface({super.key});

  @override
  State<SubirPalabraInterface> createState() => _SubirPalabraInterfaceState();
}

class _SubirPalabraInterfaceState extends State<SubirPalabraInterface> {
  final palabraControler = TextEditingController();
  final instruccionesControler = TextEditingController();
  final significadoControler = TextEditingController();
  final tipoControler = TextEditingController();

  File? imagen_to_upload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SUBIR PALABRA',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.amber,
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PageDictionaryScreen()));
              },
              child: const Text('Ver Palabras'))
        ],
      ),
      body: Expanded(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              InputForm(
                hintText: "PALABRA EJEMPLO: AMIGO",
                iconCustom: Icons.abc,
                textController: palabraControler,
              ),
              const SizedBox(height: 25),
              InputForm(
                hintText: "INSTRUCCIONES",
                iconCustom: Icons.mood,
                textController: instruccionesControler,
                alturaInput: 130,
                maxLines: 5,
              ),
              const SizedBox(height: 25),
              InputForm(
                hintText: "SIGNIFICADO",
                iconCustom: Icons.phone,
                textController: significadoControler,
                alturaInput: 80,
                maxLines: 2,
              ),
              const SizedBox(height: 25),
              ListOptionInput(
                hintText: "Selecciona un tipo",
                icon: Icons.merge_type,
                options: [
                  OptionItem(text: "SALUDO"),
                  OptionItem(text: "PREGUNTA"),
                  OptionItem(text: "DESPEDIDA"),
                  OptionItem(text: "ACCION"),
                  OptionItem(text: "COMUN"),
                  OptionItem(text: "ANIMAL"),

                ],
                textController: tipoControler,
              ),
              const Text(
                  'Si vas a escribir un nuevo tipo, que sea en mayusculas sin acentos'),
              const SizedBox(height: 30),
              imagen_to_upload != null
                  ? Image.file(imagen_to_upload!)
                  : const ClipOval(
                      child: Image(
                        height: 100,
                        image: AssetImage('assets/img_profile2.png'),
                      ),
                    ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    final imagen = await getImage();
                    if (imagen != null) {
                      setState(() {
                        imagen_to_upload = File(imagen.path);
                      });
                    } else {
                      setState(() {
                        imagen_to_upload = null;
                      });
                    }
                  },
                  child: const Text("Subir una imagen")),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  String primeraLetra = palabraControler.text.isNotEmpty
                      ? palabraControler.text[0]
                      : '';

                  if (imagen_to_upload == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Te falto subir img o video')));
                  } else {
                    print('Se subio $primeraLetra');
                    final imageUrl = await uploadImage(
                        primeraLetra.toUpperCase(), imagen_to_upload!);

                    if (primeraLetra.isEmpty ||
                        palabraControler.text.isEmpty ||
                        instruccionesControler.text.isEmpty ||
                        significadoControler.text.isEmpty ||
                        tipoControler.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Tienes vacio algo')));
                    } else {
                      addPalabra(
                          primeraLetra,
                          palabraControler.text,
                          instruccionesControler.text,
                          significadoControler.text,
                          tipoControler.text,
                          imageUrl.toString());

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('SE AGREGO CORRECTAMENTE')));

                      setState(() {
                        palabraControler.text = '';
                        instruccionesControler.text = '';
                        significadoControler.text = '';
                        tipoControler.text = '';
                        imagen_to_upload = null;
                      });
                    }
                  }
                },
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15), bottom: Radius.circular(15)),
                    color: Color.fromRGBO(255, 118, 154, 1),
                  ),
                  child: const Center(
                    child: Text(
                      'REGISTRARSE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
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

class OptionItem {
  final String text;

  OptionItem({required this.text});
}

class ListOptionInput extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final List<OptionItem> options;
  final TextEditingController textController;

  const ListOptionInput({
    super.key,
    required this.hintText,
    required this.icon,
    required this.options,
    required this.textController,
  });

  @override
  _ListOptionInputState createState() => _ListOptionInputState();
}

class _ListOptionInputState extends State<ListOptionInput> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        icon: Icon(widget.icon),
        suffixIcon: PopupMenuButton<OptionItem>(
          itemBuilder: (BuildContext context) {
            return widget.options.map((option) {
              return PopupMenuItem<OptionItem>(
                value: option,
                child: Text(option.text),
              );
            }).toList();
          },
          onSelected: (OptionItem option) {
            setState(() {
              selectedOption = option.text;
              widget.textController.text = selectedOption!;
            });
          },
        ),
      ),
    );
  }
}

/************************** */

