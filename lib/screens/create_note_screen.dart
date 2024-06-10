import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key, this.noteId});

  final int? noteId;

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final FocusNode titleFocusNode = FocusNode();
  final TextEditingController descriptionController = TextEditingController();
  final FocusNode descriptionFocusNode = FocusNode();
  String? selectedState;
  bool important = false;

  @override
  Widget build(BuildContext context) {
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
                    //TODO: Implementar creacion de nota
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
                      validator: (String? value) {
                        if (value == null) {
                          return "Por favor selecciona un estado";
                        }
                        return null;
                      },
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
                      onChanged: (bool? value) {
                        setState(() {
                          important = !important;
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
