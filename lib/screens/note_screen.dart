import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key, required this.note});

  final Note note;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final FocusNode titleFocusNode = FocusNode();
  final TextEditingController descriptionController = TextEditingController();
  final FocusNode descriptionFocusNode = FocusNode();
  String? selectedState;
  bool important = false;

  @override
  void initState() {
    super.initState();
    titleController.text = widget.note.title;
    descriptionController.text = widget.note.description!;
    selectedState = widget.note.state;
    important = widget.note.important;
  }

  @override
  Widget build(BuildContext context) {

    final notesProvider = context.read<NotesProvider>();

    final colors = Theme.of(context).colorScheme;
    List<DropdownMenuItem<String>> states = const [
      DropdownMenuItem(value: 'Creado', child: Text('Creado')),
      DropdownMenuItem(value: 'Por hacer', child: Text('Por hacer')),
      DropdownMenuItem(value: 'Trabajando', child: Text('Trabajando')),
      DropdownMenuItem(value: 'Finalizado', child: Text('Finalizado')),
    ];

    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: IconButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    notesProvider.update(Note(
                        noteId: widget.note.noteId,
                        title: titleController.text,
                        description: descriptionController.text,
                        state: selectedState!,
                        important: important,
                        createdAt: DateTime.now()));
                    context.pop();
                  }
                },
                icon: Icon(Icons.save, color: colors.primary),
                style: IconButton.styleFrom(
                    iconSize: 30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: IconButton(
                onPressed: () {
                  notesProvider.delete(widget.note.noteId!);
                  context.pop();
                },
                icon: Icon(Icons.delete_rounded, color: colors.error),
                style: IconButton.styleFrom(
                    iconSize: 30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
          ],
          title: const Text('Nota'),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: [
                  CustomTextFormField(
                    inputFocusNode: titleFocusNode,
                    inputController: titleController,
                    alignLabelWithHint: false,
                    labelText: 'Titulo...',
                    maxLength: 34,
                    maxLines: 1,
                    textInputType: TextInputType.text,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor ingresa un titulo";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    inputFocusNode: descriptionFocusNode,
                    inputController: descriptionController,
                    alignLabelWithHint: true,
                    labelText: 'Descripcion...',
                    maxLength: 50000,
                    maxLines: 15,
                    textInputType: TextInputType.multiline,
                    validator: (String? value) {
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  DropdownButtonFormField(
                      value: selectedState,
                      items: states,
                      onChanged: (value) {
                        selectedState = value;
                      },
                      decoration: InputDecoration(
                          hintText: 'Elige el estado de la nota',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ))),
                  const SizedBox(height: 30),
                  CheckboxListTile(
                      value: important,
                      onChanged: (value) {
                        setState(() {
                          
                          important = !important;
                          print(important);
                        });
                      },
                      title: const Text('Es importante')),
                ],
              ),
            ),
          ),
        ));
  }
}
