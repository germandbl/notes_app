import 'package:notes_app/domain/entities/note.dart';
import 'package:notes_app/domain/repositories/notes_repository.dart';

class NotesRepositoryImpl extends NotesRepository {
  @override
  Future<Note> getNoteById(int noteId) {
    // TODO: implement getNoteById
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> getNotes() {
    // TODO: implement getNotes
    throw UnimplementedError();
  }
  
  @override
  Future<Note> createNote(Note note) {
    // TODO: implement createNote
    throw UnimplementedError();
  }
  
  @override
  Future deleteNoteById(int id) {
    // TODO: implement deleteNoteById
    throw UnimplementedError();
  }
  
  @override
  Future<Note> updateNote(Note note) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }

}