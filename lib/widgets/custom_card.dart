import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/models/note.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
        elevation: 2,
        surfaceTintColor: colors.primary,
        margin: const EdgeInsets.only(bottom: 20),
        clipBehavior: ClipRRect(
          borderRadius: BorderRadius.circular(12),
        ).clipBehavior,
        child: InkWell(
          onTap: () {
            context.goNamed('note', extra: note);
          },
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        note.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert_rounded))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Importante:',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(' ${note.important ? "Sí" : "No"}'),
                      const SizedBox(width: 20),
                      const Text(
                        'Estado:',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(' ${note.state}')
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 120,
                    child: Text(note.description ?? ''),
                  ),
                ],
              )),
        ));
  }
}
