import 'package:notes_app/domain/entities/note.dart';

abstract class NotesRepository {
  Future<List<Note>> getNotes();
  Future<Note> getNoteById();
}