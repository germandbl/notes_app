import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/notes_service.dart';

class NotesProvider extends ChangeNotifier {
  final notesService = NotesService();
  List<Note> notes = [];

  Future<void> getNotes() async {
    final allNotes = await notesService.getNotes();

    notes.addAll(allNotes);
    notifyListeners();
  }

  Future<void> create(Note note) async {
    await notesService.create(note);
    notes.add(note);
    notifyListeners();
  }

  Future<void> update(Note note) async {
    await notesService.updateNote(note);
    notes[notes.indexWhere((note) => note.noteId == note.noteId)] = note;
    notifyListeners();
  }

  Future<void> delete(String noteId) async {
    await notesService.deleteNoteById(noteId);
    notes.removeWhere((note) => note.noteId == noteId);
    notifyListeners();
  }
}
