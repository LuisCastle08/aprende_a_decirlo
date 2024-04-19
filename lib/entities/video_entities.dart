import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoEntities extends StatelessWidget {
  final String nameVideo;
  final String nameAutor;
  final int viewsVideo;
  final int? fechaVideo;

  const VideoEntities(
      {super.key,
      required this.nameVideo,
      required this.nameAutor,
      required this.viewsVideo,
      this.fechaVideo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 170,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(238, 238, 238, 1),
            ),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {
                    // ignore: deprecated_member_use
                    launch(
                        "https://www.youtube.com/watch?v=q-juc7-tByU&pp=ygUGc2XDsWFz");
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    size: 100,
                  ),

                  /*  const Icon(
                      Icons.play_arrow,
                      size: 100,
                    ),
                  ], */
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(nameVideo,
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
          Text(
              '$nameAutor - $viewsVideo Vistas - Hace $fechaVideo ${fechaVideo == 1 ? "dia" : "dias"} ',
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
