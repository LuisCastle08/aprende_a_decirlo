import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:aprende_a_decirlo/entities/shared/global_variables.dart';

class PagoPremium extends StatefulWidget {
  const PagoPremium({Key? key}) : super(key: key);

  @override
  _PagoPremiumState createState() => _PagoPremiumState();
}

class _PagoPremiumState extends State<PagoPremium> {
  String? opcionSeleccionada;

  Widget? _buildSelectedOptionWidget() {
    switch (opcionSeleccionada) {
      case 'whatsapp':
        return const Column(
          children: [
            Text(
              'FORMA DE PAGO: CONTACTO POR WHATSAPP',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Información: Este metodo consiste en contactar un uno de nuestro asesores y platicar acerca de las ventajas que tiene ser premium y de igual forma que te guien en el procedimiento de pago y seas validado enseguida sin esperar horas.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ), textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: openWhatsapp,
                child: Icon(
                  FontAwesomeIcons.whatsapp,
                  size: 50,
                ))
          ],
        );
      case 'transferencia':
        return const Column(
          children: [
            Text(
              'FORMA DE PAGO: TRANSFERENCIA',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Información: Este metodo consiste en transferir directamente a cualquier hora disponible, posteriormente en un labso de horas habiles seras validado, para ello luego de haber transferido, deberas enviar el Comprobante de Transferencia',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ), textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20,),
            Image(image: AssetImage('assets/card.png')),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: openWhatsapp,
                child: Text('Enviar comprobante de Pago')
          )
          ],
        );
      case 'oxxo':
        return const Text(
          'PROXIMAMENTE',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        );
      case 'practicaja':
        return const Text(
          'PROXIMAMENTE',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(titleCustom: 'PREMIUM'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'FORMAS DE PAGO',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(255, 118, 154, 1),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Opciones Disponibles:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(109, 106, 107, 1),
                ),
              ),
              const Text(
                'Seleccione uno para obtener más información',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(109, 106, 107, 1),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RadioListTile<String>(
                title: const Text(
                  'Contacto por Whatsapp',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(109, 106, 107, 1),
                  ),
                ),
                value: 'whatsapp',
                groupValue: opcionSeleccionada,
                onChanged: (value) {
                  setState(() {
                    opcionSeleccionada = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text(
                  'Transferencia',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(109, 106, 107, 1),
                  ),
                ),
                value: 'transferencia',
                groupValue: opcionSeleccionada,
                onChanged: (value) {
                  setState(() {
                    opcionSeleccionada = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text(
                  'Pago En Oxxo (Proximamente)',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(109, 106, 107, 1),
                  ),
                ),
                value: 'oxxo',
                groupValue: opcionSeleccionada,
                onChanged: (value) {
                  setState(() {
                    opcionSeleccionada = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text(
                  'Pago a Practicaja (Proximamente)',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(109, 106, 107, 1),
                  ),
                ),
                value: 'practicaja',
                groupValue: opcionSeleccionada,
                onChanged: (value) {
                  setState(() {
                    opcionSeleccionada = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: opcionSeleccionada != null
                      ? const Color.fromARGB(255, 66, 143, 46)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _buildSelectedOptionWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void openWhatsapp() async {
  String phoneNumber = '9934253847';
  var url = 'https://wa.me/$phoneNumber?text=Hola,Aprende a Decirlo%20me%20gustaría%20convertirme%20en%20*Miembro Premium*,%20deseo%20información%20del%20método%20de%20pago,%20mis%20datos%20son:%0A*ID USUARIO:*%0A${idUsuario}%0A*USUARIO:*%0A${nombre}%0A*TIPO DE MIEMBRO*%0A${membresia != 0 ? 'PREMIUM' : 'PUBLICA'}';
  await launch(url);
}
