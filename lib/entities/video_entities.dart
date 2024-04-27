import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoEntities extends StatefulWidget {
  final String nameVideo;
  final String nameAutor;

  final String? fechaVideo;
  final String videoId;

  const VideoEntities(
      {super.key,
      required this.nameVideo,
      required this.nameAutor,
      this.fechaVideo,
      required this.videoId});

  @override
  State<VideoEntities> createState() => _VideoEntitiesState();
}

class _VideoEntitiesState extends State<VideoEntities> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: widget.videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ))
      ..addListener(_onPlayerStateChange);
  }

  void _onPlayerStateChange() {
    if (_controller.value.playerState == PlayerState.playing) {}
  }

  @override
  Widget build(BuildContext context) {
    String? fecha = widget.fechaVideo;
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
              children: [YoutubePlayer(controller: _controller)],
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(widget.nameVideo,
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
          Text(
              '${widget.nameAutor}  $fecha ${fecha == '1'? 'Dia' : 'Dias' }',
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
