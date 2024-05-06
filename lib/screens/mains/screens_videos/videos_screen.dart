import 'package:aprende_a_decirlo/entities/foro_entities_comment.dart';
import 'package:aprende_a_decirlo/entities/video_entities.dart';
import 'package:aprende_a_decirlo/services/firebase_service.dart';
import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageVideosScreen extends StatefulWidget {
  final String membresia;
  const PageVideosScreen({super.key, required this.membresia});

  @override
  State<PageVideosScreen> createState() => _PageVideosScreenState();
}

class _PageVideosScreenState extends State<PageVideosScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar:  const AppBarWidget(titleCustom: 'VIDEOS'),
          body: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: [
                  const TabBar(
                      labelStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      tabs: [
                        Tab(
                          text: 'INICIO',
                        ),
                        Tab(
                          text: 'PUBLICO',
                        ),
                        Tab(
                          text: 'PREMIUM',
                        ),
                      ]),
                  Expanded(
                    child: TabBarView(children: [
                      /* video */
                      Expanded(
                          child: Center(
                        child: ListView(
                          children:[
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  const Text('EL VIDEO MÁS VISTO:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, ),),
                                  const SizedBox(height: 10,),
                                  VideoEntities(nameVideo: 'Nivel 1.1 Abecedario', nameAutor: 'APRENDE A DECIRLO', videoId: 'Jrl6cHWSmTA', fechaVideo: '${DateTime.now().day}',),
                                  const SizedBox(height: 10,),
                                  const Text('EL ULTIMO COMENTARIO:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, ),),
                                  const SizedBox(height: 10,),
                                  FutureBuilder(
                                    future: getUltimoComentario(),
                                    builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return const Center(child: CircularProgressIndicator());
                                      } else if (snapshot.hasError) {
                                        return Center(child: Text('Error: ${snapshot.error}'));
                                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                        return const Center(child: Text('No se encontraron comentarios'));
                                      } else {
                                        final comentarioData = snapshot.data!;
                                        final nombre = comentarioData['nombre'];
                                        final comentario = comentarioData['comentario'];
                                        final tipoComentario = comentarioData['tipoComentario'];
                                        final fecha = comentarioData['fecha'];
                                        final img = comentarioData['img'];

                                        DateTime fechar = fecha.toDate();

                                        return CommentForo(
                                          textoCard: comentario,
                                          usuarioName: nombre,
                                          customContenedor: tipoComentario,
                                          fecha: fechar,
                                          img: img,
                                        );
                                      }
                                    },
                                  )

                                ],
                              ),
                            )
                          ],
                        )


                      )),

                      Expanded(
                          child: FutureBuilder(
                              future: getVideos('0'),
                              builder: (context, snapshot) {
                                if (snapshot.hasData && snapshot.data != null) {
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        kToolbarHeight -
                                        20,
                                    child: ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        final titulo =
                                            snapshot.data![index]['titulo'];
                                        final autor =
                                            snapshot.data![index]['autor'];
                                        final fecha =
                                            snapshot.data![index]['fecha'];
                                        final idvideo =
                                            snapshot.data![index]['id'];

                                        if (titulo != null &&
                                            autor != null &&
                                            fecha != null &&
                                            idvideo != null) {
                                          DateTime fechar = fecha.toDate();
                                          DateTime fechaActual = DateTime.now();
                                          return VideoEntities(
                                            nameVideo: '$titulo',
                                            nameAutor: autor,
                                            fechaVideo:
                                                '${fechar.day == fechaActual.day 
                                                ? 'Hoy'
                                                 : fechar.day - fechaActual.day}',
                                            videoId: idvideo,
                                          );
                                        }
                                        return null;
                                      },
                                    ),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              })
                              
                        ),
                    Expanded(
                        child: widget.membresia == '1' // Verificar si la membresía es igual a 1
                            ? FutureBuilder(
                                future: getVideos('1'),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData && snapshot.data != null) {
                                    return SizedBox(
                                      height: MediaQuery.of(context).size.height -
                                          kToolbarHeight -
                                          20,
                                      child: ListView.builder(
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          final titulo = snapshot.data![index]['titulo'];
                                          final autor = snapshot.data![index]['autor'];
                                          final fecha = snapshot.data![index]['fecha'];
                                          final idvideo = snapshot.data![index]['id'];

                                          if (titulo != null &&
                                              autor != null &&
                                              fecha != null &&
                                              idvideo != null) {
                                            DateTime fechar = fecha.toDate();
                                            DateTime fechaActual = DateTime.now();
                                            return VideoEntities(
                                              nameVideo: '$titulo',
                                              nameAutor: autor,
                                              fechaVideo:
                                                  '${fechar.day == fechaActual.day ? 1 : fechaActual.day - fechar.day}',
                                              videoId: idvideo,
                                            );
                                          }
                                          return null;
                                        },
                                      ),
                                    );
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              )
                            : const Center(
                                child: Text('HOLA ESTE ES EL APARTADO DE PREMIUM'),
                              ),
                      )
                    ]),
                  )
                ],
              ))),
    );
  }
}

Future<Map<String, dynamic>> getUltimoComentario() async {
  CollectionReference collectionReferenceUsuario = db.collection('comentario');
  QuerySnapshot queryComentario = await collectionReferenceUsuario
      .orderBy('fecha', descending: true)
      .limit(1)
      .get();

  if (queryComentario.docs.isNotEmpty) {
    final doc = queryComentario.docs.first;
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final ultimoComentario = {
      "nombre": data['nombre'],
      "comentario": data['comentario'],
      "tipoComentario": data['tipoComentario'],
      "fecha": data['fecha'],
      "img": data['img'],
      "uid": doc.id,
    };
    return ultimoComentario;
  } else {
    // Si no hay ningún comentario, puedes devolver un mapa vacío o null según tu necesidad.
    return {};
  }
}
