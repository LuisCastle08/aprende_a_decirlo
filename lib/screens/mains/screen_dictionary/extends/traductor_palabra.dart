import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class TraductoPalabra extends StatefulWidget {
  const TraductoPalabra({super.key});

  @override
  State<TraductoPalabra> createState() => _TraductoPalabraState();
}

class _TraductoPalabraState extends State<TraductoPalabra> {
  String cantidadTxt = '';
   final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(titleCustom: 'TRADUCTOR'),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(176, 239, 235, 235),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                    bottom: Radius.circular(15),
                  ),
                ),
                child: Stack(
                  children: [
                    TextFormField(
                      controller: _textController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        
                        hintText: 'Escribe algo',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 123, 123, 123),
                          fontWeight: FontWeight.w600,
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (String value) {
                        setState(() {
                          cantidadTxt = value;
                        });
                      },
                    ),
                    Positioned(
                        right: 0,
                        top: 0,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                cantidadTxt = '';
                                _textController.clear(); 
                              });
                            },
                            icon: const Icon(Icons.close_outlined))),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: Text(
                        "${cantidadTxt.length}/250",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Expanded(flex: 6, child: SizedBox.expand(child: Placeholder())),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 150,
        height: 60,
        child: FloatingActionButton(
          enableFeedback: true,
          /* shape: const StadiumBorder(), */ //BORDER RADIUS A CIRCULO
          onPressed: () {
            
          },
          backgroundColor: const Color.fromRGBO(255, 234, 151, 1),
          child: const Text('TRADUCIR', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromRGBO(35, 35, 35, 1)),)
        ),
      ),
    );
  }
}
