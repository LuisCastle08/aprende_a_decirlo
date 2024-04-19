import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: const AppBarWidget(titleCustom: 'PREMIUM'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child:  Expanded(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.center,
              children: [
                const Image(image: AssetImage('assets/banner_logo.png'), width: 400,),
                const SizedBox(height: 10,),
                const Text('¿POR QUÉ UNIRTE A PREMIUM?', textAlign: TextAlign.center, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color.fromRGBO(255, 118, 154, 1)),),
                const SizedBox(height: 30,),
                const Text('A SOLO ${99.99} AL MES', textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromRGBO(255, 118, 154, 1)),),
                const SizedBox(height: 30,),
                const Row(
                  children: [
                    Expanded(flex: 3, child: Icon(Icons.check, color: Color.fromRGBO(255, 118, 154, 1), size: 50,),),
                    Expanded(flex: 7,  child: Text('Consulta tus dudas con los interpretes certificados personalmente mediante chat', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),))
                  ],
                ),
                const SizedBox(height: 10,),
                const Row(
                  children: [
                    Expanded(flex: 3, child: Icon(Icons.check, color: Color.fromRGBO(255, 118, 154, 1), size: 50,),),
                    Expanded(flex: 7,  child: Text('Accede a videos exclusivos para usuarios premium', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),))
                  ],
                ),
                const SizedBox(height: 10,),
                const Row(
                  children: [
                    Expanded(flex: 3, child: Icon(Icons.check, color: Color.fromRGBO(255, 118, 154, 1), size: 50,),),
                    Expanded(flex: 7,  child: Text('Comenta en las publicaciones de los expertos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),))
                  ],
                ),
                const SizedBox(height: 10,),
                const Row(
                  children: [
                    Expanded(flex: 3, child: Icon(Icons.check, color: Color.fromRGBO(255, 118, 154, 1), size: 50,),),
                    Expanded(flex: 7,  child: Text('Traductor de español a Lenguaje de Señas Mexicano (LSM)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),))
                  ],
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.all(2),
                  width: 200,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 118, 154, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: const Text('ÚNETE YA',textAlign: TextAlign.center, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white ),),
                )

              ],
            )
          ),
        ),
      ),
    );
  }
}
