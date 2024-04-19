import 'package:aprende_a_decirlo/entities/foro_entities_comment.dart';
import 'package:aprende_a_decirlo/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class PageForoScreen extends StatelessWidget {
  const PageForoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(titleCustom: 'FORO'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemCount: 2, // Assuming you have 4 comments. Replace with your actual data source in the future.
          separatorBuilder: (context, index) => const SizedBox(height: 16.0), // Adjust spacing height
          itemBuilder: (context, index) => const CommentForo(textoCard: 'Dolor dolore et aliqua officia dolor reprehenderit. Reprehenderit adipisicing in adipisicing labore laboris exercitation mollit sint minim. Laborum id consequat quis velit ipsum dolore exercitation ad pariatur.',),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          enableFeedback: true,
          /* shape: const StadiumBorder(), */ //BORDER RADIUS A CIRCULO
          onPressed: () {},
          backgroundColor: const Color.fromRGBO(255, 118, 154, 1),
          child: const Icon(
            Icons.add_box,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}
