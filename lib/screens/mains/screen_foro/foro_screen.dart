import 'package:aprende_a_decirlo/entities/foro_entities_comment.dart';
import 'package:aprende_a_decirlo/screens/mains/screen_foro/extends/write_comment.dart';
import 'package:aprende_a_decirlo/services/firebase_service.dart';
import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class PageForoScreen extends StatefulWidget {
  const PageForoScreen({super.key});

  @override
  State<PageForoScreen> createState() => _PageForoScreenState();
}

class _PageForoScreenState extends State<PageForoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(titleCustom: 'FORO'),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            future: getComentario(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    // Verificar si snapshot.data[index]['usuario'] no es nulo antes de intentar acceder a él
                    final id = snapshot.data![index]['uid'];
                    final usuario = snapshot.data![index]['nombre'];
                    final comentario = snapshot.data![index]['comentario'];
                    final tipo = snapshot.data![index]['tipoComentario'];

                    return CommentForo(
                      usuarioName:
                          usuario != null ? usuario.toString() : "Sin usuario",
                      textoCard: comentario != null
                          ? comentario.toString()
                          : 'Sin Comentarios',
                      customContenedor: tipo ?? 1,
                      userID: id ?? 'sin id',
                    );

                    /* Text(usuario != null ? usuario.toString() : 'Usuario no disponible'); */
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
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          enableFeedback: true,
          /* shape: const StadiumBorder(), */ //BORDER RADIUS A CIRCULO
          onPressed: () async {
            await Navigator.push(context,
                MaterialPageRoute(builder: (_) => const WriteCommentUser()));
            setState(() {
              
            });
          },
          backgroundColor: const Color.fromRGBO(255, 118, 154, 1),
          child: const Icon(
            Icons.add_box,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}
