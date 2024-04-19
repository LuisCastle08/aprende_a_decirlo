import 'package:flutter/material.dart';

class BoxGameEntities extends StatelessWidget {
  final String nameGameCustom;
  final int? levelGameCustom;
  final double progresGameCustom;

  const BoxGameEntities({super.key, required this.nameGameCustom, required this.levelGameCustom, required this.progresGameCustom});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 140,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(185, 218, 145, 1),
                borderRadius: BorderRadius.circular(25)),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  nameGameCustom.toUpperCase(),
                  style: const TextStyle(
                      color: Color.fromRGBO(245, 243, 243, 1),
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  'Nivel $levelGameCustom',
                  style: const TextStyle(
                      color: Color.fromRGBO(245, 243, 243, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                const LinearProgressIndicator(
                  value: 0.1,
                  backgroundColor: Color.fromARGB(255, 197, 197, 197),
                  minHeight: 10,
                ),
                Text('${(progresGameCustom * 100).round()}%'),
                
              ],
            )),
            const SizedBox(height: 15,),
      ],
    );
  }
}
