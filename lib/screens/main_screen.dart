import 'package:aprende_a_decirlo/entities/shared/global_variables.dart';
import 'package:aprende_a_decirlo/screens/mains/screen_dictionary/dictionary_screen.dart';
import 'package:aprende_a_decirlo/screens/mains/screen_foro/foro_screen.dart';
import 'package:aprende_a_decirlo/screens/mains/screen_games/games_screen.dart';
import 'package:aprende_a_decirlo/screens/mains/screen_profile/profile_screen.dart';
import 'package:aprende_a_decirlo/screens/mains/screens_videos/videos_screen.dart';
import 'package:flutter/material.dart';

void asignarNombre(String nuevoNombre, String usuarioID, String membresiaU) {
  nombre = nuevoNombre;
  idUsuario = usuarioID;
  membresia = membresiaU;
}

class VideosScreen extends StatefulWidget {
  final String userId;
  final String nombreUser;
  final String membresia;
  const VideosScreen(
      {super.key,
      required this.userId,
      required this.nombreUser,
      required this.membresia});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> paginas = [
      PageVideosScreen(
        membresia: widget.membresia,
      ),
      const PageGameScreen(),
      PageProfileScreen(userId: widget.userId), // Usar widget.userId aquí
      PageForoScreen(nombreCustom: widget.nombreUser),
      const PageDictionaryScreen(),
    ];

    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children: [
          paginas[currentPage],
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: currentPage,
          onTap: (index) {
            currentPage = index;
            setState(() {
              asignarNombre(widget.nombreUser, widget.userId, widget.membresia);
            });
          },

          backgroundColor: const Color.fromRGBO(255, 234, 151, 1),
          selectedItemColor: const Color.fromRGBO(234, 46, 52, 0.671),
          unselectedItemColor: const Color.fromRGBO(142, 179, 97, 1),
          type: BottomNavigationBarType.fixed, // Explicitly set for 5 icons
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.ondemand_video_rounded),
              label: "VIDEOS",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.videogame_asset_rounded),
              label: "JUEGOS",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_rounded),
              label: "PERFIL",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.textsms_rounded),
              label: "FORO",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_rounded),
              label: "DICCIONARIO",
            ),
          ],
          iconSize: 40.0,
        ),
      ),
    );
  }
}
