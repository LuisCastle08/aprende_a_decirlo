import 'package:aprende_a_decirlo/screens/modals/foro_comment_empty.dart';
import 'package:aprende_a_decirlo/screens/modals/foro_seleccionar_color.dart';
import 'package:aprende_a_decirlo/services/firebase_service.dart';
import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(const WriteCommentUser());

class WriteCommentUser extends StatefulWidget {
  const WriteCommentUser({super.key});

  @override
  State<WriteCommentUser> createState() => _WriteCommentUserState();
}

class _WriteCommentUserState extends State<WriteCommentUser> {
  TextEditingController comentarioController = TextEditingController(text: "");
  Color colorContenedor = const Color.fromARGB(255, 243, 238, 238);
  Color colorText = const Color.fromARGB(255, 124, 120, 120);
  int tipoComentario = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(titleCustom: 'FORO'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              colorContenedor =
                                  const Color.fromRGBO(255, 118, 154, 1);
                              colorText = Colors.white;
                              tipoComentario = 1;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                color: Colors.pink, shape: BoxShape.circle),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              colorContenedor =
                                  Color.fromARGB(255, 177, 219, 122);
                              colorText = Colors.black;
                              tipoComentario = 2;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              colorContenedor =
                                  const Color.fromRGBO(255, 234, 151, 1);

                              tipoComentario = 3;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                color: Colors.yellow, shape: BoxShape.circle),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    )),
                GestureDetector(
                  onTap: () async {
                    if (tipoComentario == 0) {
                      // Mostrar la ventana emergente
                      modalColorError(context);
                    } else {
                      if (comentarioController.text.trim().isEmpty) {
                        modalCommentError(context);
                      } else {
                        await addComentario(comentarioController.text, 'pedro', tipoComentario).then((_) => {
                          Navigator.pop(context) // Cerrar el diálogo
                        });
                        comentarioController.clear();
                      }
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                          bottom: Radius.circular(15)),
                      color: Color.fromRGBO(255, 118, 154, 1),
                    ),
                    child: const Center(
                      child: Text(
                        'PUBLICAR',
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
            const SizedBox(
              height: 20,
            ),

            /* APARTADO DE INPUT MENSAGE */
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: colorContenedor,
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15), bottom: Radius.circular(15)),
                ),
                child: TextFormField(
                  controller: comentarioController,
                  maxLines: 5,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      hintText: 'ESCRIBE ALGO PARA LA COMUNIDAD',
                      hintStyle: TextStyle(fontSize: 20, color: colorText),
                      border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 3,
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(173, 191, 191, 191),
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15), bottom: Radius.circular(15)),
                  ),
                  child: const SizedBox.expand(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NOTA:\nEl color verde es para comentario normal\nEl color rosa es para errores\nEl color yellow  es para ayuda normal',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 19),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
