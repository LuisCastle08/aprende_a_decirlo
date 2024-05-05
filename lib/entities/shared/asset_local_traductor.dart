import 'dart:io';
// Función para quitar acentos y comas de un texto

List<Map<String, String>> traductor(String palabra) {
  // Aplicar la función quitarAcentosYComas a la palabra
  palabra = quitarAcentosYComas(palabra);
  // Convertir la palabra en una lista de letras, manteniendo las letras repetidas
  List<String> letras = palabra.toUpperCase().split('');

  // Lista para almacenar los resultados
  List<Map<String, String>> palabraTraducida = [];

  for (var i = 0; i < letras.length; i++) {
    Map<String, String>? letraEncontrada = array.firstWhere(
      (element) => element['case'] == letras[i],
      orElse: () => {
        'case': '',
        'imagen': ''
      }, // Valor predeterminado si no se encuentra la letra
    );

    // Verificar si se encontró la letra
    if (letraEncontrada['case'] != '') {
      // Agregar la letra y la ruta de la imagen a la lista de resultados
      palabraTraducida.add({letras[i]: letraEncontrada['imagen']!});
    }
  }
  return palabraTraducida;
}

String quitarAcentosYComas(String texto) {
  final Map<String, String> caracteresEspeciales = {
    'á': 'a', 'é': 'e', 'í': 'i', 'ó': 'o', 'ú': 'u',
    'Á': 'A', 'É': 'E', 'Í': 'I', 'Ó': 'O', 'Ú': 'U',
    'ü': 'u', 'Ü': 'U', 'Ñ': 'N', 'ñ': 'n',
    ',': '', // Elimina comas
  };

  caracteresEspeciales.forEach((key, value) {
    texto = texto.replaceAll(key, value);
  });

  return texto;
}

final List<Map<String, String>> array = [
  {'case': ' ', 'imagen': 'assets/letras/ESPACIO.PNG'},
  {'case': 'A', 'imagen': 'assets/letras/A.PNG'},
  {'case': 'B', 'imagen': 'assets/letras/B.PNG'},
  {'case': 'C', 'imagen': 'assets/letras/C.PNG'},
  {'case': 'D', 'imagen': 'assets/letras/D.PNG'},
  {'case': 'E', 'imagen': 'assets/letras/E.PNG'},
  {'case': 'F', 'imagen': 'assets/letras/F.PNG'},
  {'case': 'G', 'imagen': 'assets/letras/G.PNG'},
  {'case': 'H', 'imagen': 'assets/letras/H.PNG'},
  {'case': 'I', 'imagen': 'assets/letras/I.PNG'},
  {'case': 'J', 'imagen': 'assets/letras/J.PNG'},
  {'case': 'K', 'imagen': 'assets/letras/K.PNG'},
  {'case': 'L', 'imagen': 'assets/letras/L.PNG'},
  {'case': 'M', 'imagen': 'assets/letras/M.PNG'},
  {'case': 'N', 'imagen': 'assets/letras/N.PNG'},
  {'case': 'O', 'imagen': 'assets/letras/O.PNG'},
  {'case': 'P', 'imagen': 'assets/letras/P.PNG'},
  {'case': 'Q', 'imagen': 'assets/letras/Q.PNG'},
  {'case': 'R', 'imagen': 'assets/letras/R.PNG'},
  {'case': 'S', 'imagen': 'assets/letras/S.PNG'},
  {'case': 'T', 'imagen': 'assets/letras/T.PNG'},
  {'case': 'U', 'imagen': 'assets/letras/U.PNG'},
  {'case': 'V', 'imagen': 'assets/letras/V.PNG'},
  {'case': 'W', 'imagen': 'assets/letras/W.PNG'},
  {'case': 'X', 'imagen': 'assets/letras/X.PNG'},
  {'case': 'Y', 'imagen': 'assets/letras/Y.PNG'},
  {'case': 'Z', 'imagen': 'assets/letras/Z.PNG'}
];
