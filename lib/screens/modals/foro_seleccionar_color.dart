import 'package:flutter/material.dart';

// Función para mostrar el diálogo emergente
void modalColorError(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('CAMBIAR COLOR'),
        content: const Text('Debes cambiar de color en Flutter.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
            },
            child: const Text('Aceptar'),
          ),
        ],
      );
    },
  );
}