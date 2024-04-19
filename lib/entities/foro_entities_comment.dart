import 'package:aprende_a_decirlo/widgets/input_form.dart';
import 'package:flutter/material.dart';

class CommentForo extends StatelessWidget {
  
  final String textoCard;


  const CommentForo({super.key, required this.textoCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(199, 235, 155, 1),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child:  Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const Expanded(
              //PARTE IZQUIERDA DEL COMENTARIO DONDE SE ENCUENTRA EL PERFIL Y NOMBRE
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 100,
                  ),
                  Text(
                    'Luis Castillo',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Hace 3 dias'),
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
                          colorBGCustom: Color.fromRGBO(255, 255, 255, 1),
                        ))
                  ],
                ))),
          ],
        ),
      ),
    );
  }
}
