import 'package:flutter/material.dart';

// Función para mostrar el diálogo emergente
void modalCommentError(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Comentario Vacio'),
        content: const Text('El Comentario debe ser superior a 5 letras'),
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