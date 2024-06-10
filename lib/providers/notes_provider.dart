import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/notes_service.dart';

class NotesProvider extends ChangeNotifier {
  final notesService = NotesService();
  List<Note> notes = [];

  Future<void> getNotes() async {
    final allNotes = await notesService.getNotes();
    notes = allNotes;
    notifyListeners();
  }

  Future<void> create(Note note) async {
    await notesService.create(note);
    await getNotes();
  }

  Future<void> update(Note note) async {
    notes = notes.map((n) => (n.noteId == note.noteId) ? note : n).toList();
    await notesService.updateNote(note);
    notifyListeners();
  }

  Future<void> delete(String noteId) async {
    await notesService.deleteNoteById(noteId);
    notes.removeWhere((note) => note.noteId == noteId);
    notifyListeners();
  }
}
