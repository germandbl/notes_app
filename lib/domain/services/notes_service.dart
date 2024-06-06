import 'package:notes_app/domain/entities/note.dart';

abstract class NotesService {
  Future<List<Note>> getNotes();
  Future<Note> getNoteById(int noteId);
}