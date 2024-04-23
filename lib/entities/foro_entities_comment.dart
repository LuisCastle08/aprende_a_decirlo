import 'package:aprende_a_decirlo/widgets/input_form.dart';
import 'package:flutter/material.dart';

class CommentForo extends StatelessWidget {
  final String textoCard;
  final String usuarioName;
  final int customContenedor;
  final String userID;
  const CommentForo(
      {super.key,
      required this.textoCard,
      required this.usuarioName,
      required this.customContenedor, required this.userID});

  @override
  Widget build(BuildContext context) {
    Color colorContenedor;
    if (customContenedor == 1) {
      colorContenedor = const Color.fromRGBO(255, 118, 154, 1);
    } else if (customContenedor == 2) {
      colorContenedor = const Color.fromARGB(255, 177, 219, 122);
    } else {
      colorContenedor = const Color.fromRGBO(255, 234, 151, 1);
    }

    return Column(
      children: [
        Container(
          height: 260,
          decoration: BoxDecoration(
              color: colorContenedor,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  //PARTE IZQUIERDA DEL COMENTARIO DONDE SE ENCUENTRA EL PERFIL Y NOMBRE
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.person,
                        size: 100,
                      ),
                      Text(
                        usuarioName,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(userID),
                      const Text('Hace 3 dias'),
                    ],
                  ),
                ),

                //PARTE DERECHA DEL COMENTARIO DONDE SE ENCUENTRA EL COMENTARIO Y NOMBRE
                Expanded(
                    flex: 6,
                    child: SizedBox.expand(
                        child: Column(
                      children: [
                        Expanded(
                            flex: 8,
                            child: SingleChildScrollView(
                              child: Text(
                                textoCard,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            )),
                        const Expanded(
                            flex: 2,
                            child: InputForm(
                              hintText: "comentar",
                              colorTextCustom: Colors.black,
                              useHidePassword: false,
                              colorBGCustom: Color.fromRGBO(255, 255, 255, 1),
                            ))
                      ],
                    ))),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
