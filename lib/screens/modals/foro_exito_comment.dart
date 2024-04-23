import 'package:flutter/material.dart';

// Función para mostrar el diálogo emergente
void modalColorError(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('SE CREO TU COMENTARIO'),
        content: const Text('Ya puedes verlo!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              
            },
            child: const Text('Verlo ahora!'),
          ),
        ],
      );
    },
  );
}