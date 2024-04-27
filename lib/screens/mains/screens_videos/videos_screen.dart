import 'package:aprende_a_decirlo/entities/video_entities.dart';
import 'package:aprende_a_decirlo/services/firebase_service.dart';
import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:aprende_a_decirlo/widgets/input_form.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageVideosScreen extends StatefulWidget {
  const PageVideosScreen({super.key});

  @override
  State<PageVideosScreen> createState() => _PageVideosScreenState();
}

class _PageVideosScreenState extends State<PageVideosScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
      length: 3,
      child: Scaffold(
        appBar: const AppBarWidget(titleCustom: 'VIDEOS'),
        body: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: Column(
          children: [
            const TabBar(
              labelStyle: TextStyle(fontSize: 20, fontWeight:FontWeight.w400),
              tabs: [
                Tab(text: 'INICIO',),
                Tab(text: 'PUBLICO',),
                Tab(text: 'PREMIUM',),
              ]
            ),

            Expanded(
              child: TabBarView(
                children:[

                  /* vide */
                  Expanded(child: Center( child: Text('HOLA ESTE ES EL APARTADO DE INICIO'),)),

                  Expanded(
                    child: FutureBuilder(future: getVideos(),
                    builder: (context, snapshot){
                     if (snapshot.hasData && snapshot.data != null) {
                                    return SizedBox(
                                      height: MediaQuery.of(context).size.height - kToolbarHeight - 20,
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
                                              fechaVideo: '${fechar.day == fechaActual.day ? 1 : fechaActual.day - fechar.day}',
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
                  
                  }
                  )),


                  /* videos premium */
                  Expanded(child: Center( child: Text('HOLA ESTE ES EL APARTADO DE PREMIUM'),)),
                ]
              ),
            )


            
          ],

        )
      )
      ),
    );
  }
}
