import 'package:go_router/go_router.dart';
import 'package:notes_app/screens/home_screen.dart';
import 'package:notes_app/screens/create_note_screen.dart';
import 'package:notes_app/screens/note_screen.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen(), routes: [
    GoRoute(
        path: 'create-note',
        builder: (context, state) {
          return const CreateNoteScreen();
        }),
        GoRoute(
        path: 'note/:id',
        builder: (context, state) {
          final String id = state.pathParameters['id']!;
          return NoteScreen(noteId: id);
        }),
  ]),
]);
