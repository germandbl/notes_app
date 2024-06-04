import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/presentation/widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis notas"),
        centerTitle: false,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              CustomCard(),
              CustomCard(),
              CustomCard(),
              CustomCard(),
              CustomCard(),
              CustomCard(),
              CustomCard(),
              CustomCard(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push('/note/2');
          }, child: const Icon(Icons.add_rounded)),
    );
  }
}

