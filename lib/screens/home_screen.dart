import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:notes_app/widgets/custom_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notesProvider = context.watch<NotesProvider>();

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
              itemCount: notesProvider.notes.length,
              itemBuilder: (context, index) =>
                  CustomCard(note: notesProvider.notes[index]),
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
