import 'package:aprende_a_decirlo/screens/mains/premium_screen.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String titleCustom;
  final double borderCustom;
  const AppBarWidget(
      {super.key, required this.titleCustom, this.borderCustom = 30});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.chevron_left_outlined),
        iconSize: 50,
        color: const Color.fromRGBO(255, 118, 154, 1),
      ),
      title: Text(
        titleCustom,
        style: const TextStyle(
          color: Color.fromRGBO(255, 118, 154, 1),
          fontSize: 30,
          fontWeight: FontWeight.w900,
        ),
      ),
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(255, 234, 151, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(borderCustom),
        ),
        side: BorderSide(color: const Color.fromRGBO(255, 234, 151, 1), width: 1), // Aquí defines el color y el ancho del borde
      ),
      actions: [
        GestureDetector(
          onTap: () { 
            if (titleCustom == 'PREMIUM') {
            } else {
             Navigator.push( context, MaterialPageRoute(builder: (_) => const PremiumScreen()));
            }
          },
          child: Container(
            width: 50,
            margin: const EdgeInsets.only(right: 20),
            color: Colors.white,
            child: const Image(image: AssetImage('assets/logo.png')),
          ),
        ),
      ],
    );
  }
}
