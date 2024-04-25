import 'package:aprende_a_decirlo/entities/video_entities.dart';
import 'package:aprende_a_decirlo/services/firebase_service.dart';
import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';

import 'package:flutter/material.dart';

class PageVideosScreen extends StatefulWidget {
  
  const PageVideosScreen({super.key});

  @override
  State<PageVideosScreen> createState() => _PageVideosScreenState();
}

class _PageVideosScreenState extends State<PageVideosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(titleCustom: 'VIDEOS'),
      body: Padding(
          padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
          child: FutureBuilder(
              future: getVideos(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      // Verificar si snapshot.data[index]['usuario'] no es nulo antes de intentar acceder a él
                      final id = snapshot.data![index]['uid'];
                      final titulo = snapshot.data![index]['titulo'];
                      final autor = snapshot.data![index]['autor'];
                      final fecha = snapshot.data![index]['fecha'];
                      final nivel = snapshot.data![index]['nivel'];
                      final idvideo = snapshot.data![index]['id'];

                      return VideoEntities(
                          nameVideo: titulo,
                          nameAutor: autor,
                          fechaVideo: fecha.toString(),

                          videoId: idvideo);

                      /* Text(usuario != null ? usuario.toString() : 'Usuario no disponible'); */
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
      ),
    );
  }
}
