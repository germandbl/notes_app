import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController titleController = TextEditingController();
  final FocusNode titleFocusNode = FocusNode();
  final TextEditingController descriptionController = TextEditingController();
  final FocusNode descriptionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Nota'),
        ),
        body: Form(
          child: SingleChildScrollView(
            child: SizedBox(
              height:
                  (MediaQuery.of(context).size.height - kToolbarHeight) * 0.95,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  children: [
                    TextFormField(
                      maxLength: 34,
                      onTapOutside: (event) {
                        titleFocusNode.unfocus();
                      },
                      focusNode: titleFocusNode,
                      controller: titleController,
                      decoration: InputDecoration(
                          labelText: 'Título...',
                          counterText: "",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      onTapOutside: (event) {
                        descriptionFocusNode.unfocus();
                      },
                      focusNode: descriptionFocusNode,
                      controller: descriptionController,
                      maxLines: 15,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          labelText: 'Descripción...',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text('Guardar cambios')),
                        const SizedBox(width: 15),
                        FilledButton(
                            onPressed: () {
                              context.pop();
                            },
                            style: FilledButton.styleFrom(
                                backgroundColor: colors.error,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text('Cancelar')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
