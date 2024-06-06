class Note {
  final int? noteId;
  final String title;
  final String? description;
  final bool important;
  final String state;
  final DateTime createdAt;

  Note(
      {required this.noteId,
      required this.title,
      required this.description,
      required this.important,
      required this.state,
      required this.createdAt});
}