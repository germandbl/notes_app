import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/models/note.dart';

class NotesService {
  final notesInstance = FirebaseFirestore.instance.collection('note');

  Future<Note> getNoteById(String noteId) async {
    final snapshot = await notesInstance.get();

    final note = snapshot.docs
        .where((document) => document.id == noteId)
        .map((document) => Note(
            noteId: document.id,
            title: document.data()['title'],
            description: document.data()['description'],
            important: document.data()['important'],
            state: document.data()['state'],
            createdAt: document.data()['createdAt']))
        .single;

    return note;
  }

  Future<List<Note>> getNotes() async {
    List<Note> notes = [];

    final snapshot = await notesInstance.get();

    notes = snapshot.docs.map((doc) {
      return Note(
          noteId: doc.id,
          title: doc.data()['title'],
          description: doc.data()['description'],
          important: doc.data()['important'],
          state: doc.data()['state'],
          createdAt: (doc.data()['createdAt'] as Timestamp).toDate());
    }).toList();

    return notes;
  }

  Future<DocumentReference> create(Note note) {
    return notesInstance.add(<String, dynamic>{
      'title': note.title,
      'description': note.description,
      'state': note.state,
      'important': note.important,
      'createdAt': note.createdAt
    });
  }

  Future deleteNoteById(int id) {
    // TODO: implement deleteNoteById
    throw UnimplementedError();
  }

  Future<Note> updateNote(Note note) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
