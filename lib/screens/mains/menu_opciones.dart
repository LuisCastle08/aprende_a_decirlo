import 'package:aprende_a_decirlo/screens/mains/screen_usuario/nuevo_premium.dart';
import 'package:aprende_a_decirlo/subirPalabra/subir_palabra_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuOpciones extends StatelessWidget {
  const MenuOpciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MENÚ ADMINISTRADOR',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25,),
                const Icon(Icons.person_add, size: 100,),
                const Text('VER TODOS LOS USUARIOS', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                const SizedBox(height: 20,),
                // ignore: sized_box_for_whitespace
                Container(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (_) =>  const NuevoUsuarioPremium()));
                    
                  }, child:const Text('VER USUARIOS')),
                ),
                const SizedBox(height: 25,),
                const Icon(Icons.add_box, size: 100,),
                const Text('AÑADIR UN NUEVA PALABRA', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                const SizedBox(height: 20,),
                // ignore: sized_box_for_whitespace
                Container(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (_) =>  const SubirPalabraInterface()));

                  }, child:const Text('AGREGAR NUEVA PALABRA')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
