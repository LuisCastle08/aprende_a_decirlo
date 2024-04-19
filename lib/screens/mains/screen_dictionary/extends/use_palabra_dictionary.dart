import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UsePalabraDictionary extends StatelessWidget {
  final String title;
  final String palabra;
  const UsePalabraDictionary({super.key, required this.title, required this.palabra});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(titleCustom: '${title.toUpperCase()}$title'),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 500,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(181, 220, 134, 1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: SizedBox.expand(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Text(palabra,textAlign:TextAlign.center, style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),),
                          )
                        )),
                    const Expanded(flex: 4,
                        child: SizedBox.expand(
                          child: Image(image: AssetImage('assets/palabra/amigo.png')),
                        )
                    ),
                    Expanded(
                        flex: 3,
                        child: SingleChildScrollView(
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              child: const Text('Se coloca la palma de la mano sobre el dorso de la otra.', textAlign: TextAlign.justify, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 255, 255, 255)),),
                          ),
                        )
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(181, 220, 134, 1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: const SizedBox.expand(
                  
                    child: Text('Persona con quien se mantiene una amistad.',textAlign: TextAlign.justify, style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
