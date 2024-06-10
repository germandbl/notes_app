import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis notas"),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => const CustomCard(),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push('/create-note');
          },
          child: const Icon(Icons.add_rounded)),
    );
  }
}
