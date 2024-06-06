import 'package:notes_app/domain/entities/note.dart';

abstract class NotesService {
  Future<List<Note>> getNotes();
  Future<Note> getNoteById(int noteId);
  Future<Note> createNote(Note note);
  Future<Note> updateNote(Note note);
  Future deleteNoteById(int id);
}