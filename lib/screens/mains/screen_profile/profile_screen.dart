import 'package:aprende_a_decirlo/main.dart';
import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:aprende_a_decirlo/widgets/input_profile.dart';
import 'package:flutter/material.dart';

class PageProfileScreen extends StatelessWidget {
  const PageProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarWidget(titleCustom: 'PERFIL', borderCustom: 0,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 234, 151, 1),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              
                  child:  const Column(
                    
                    children: [
        
                      Icon(Icons.perm_identity_outlined, size: 120,),
                      Text("Skids", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 83, 59, 22)),),
                      Text("Luis Castillo", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 83, 59, 22)),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text("#${1} Tabasco", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 83, 59, 22)),),
                            SizedBox(width: 10,),
                            Icon(Icons.remove_red_eye, color: Color.fromARGB(255, 114, 113, 113))
                        ],
                      ),
                    ],
                  )
            ),
            const SizedBox(height: 10,),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                    
                    const Text("INFORMACION Y", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: Color.fromRGBO(255, 118, 154, 1), ),),const Text("SEGURIDAD", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: Color.fromRGBO(255, 118, 154, 1), ),),
              
                    const InputProfileCustom(hintText: "Estado"  , iconCustom: Icons.airline_seat_individual_suite_sharp, valueInputInitial: "Tabasco",),
                    const SizedBox(height: 15,),
                    const InputProfileCustom(hintText: "Telefono Celular", iconCustom: Icons.phone, valueInputInitial: "9934253847",),
                    const SizedBox(height: 15,),
                    const InputProfileCustom(hintText: "Correo@gmail.com", iconCustom: Icons.attach_email_rounded, valueInputInitial: "skids_08@gmail.com", ),
                    const SizedBox(height: 70,),
                    GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const MainApp()));
                          },
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15),
                                  bottom: Radius.circular(15)),
                                  color: Color.fromRGBO(255, 118, 154, 1),
                            ),
                            child: const Center(
                              child: Text(
                                'CERRAR SESIÓN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                 ],
              ),
            )
          ],
        ),
      ),
    );
  }
}