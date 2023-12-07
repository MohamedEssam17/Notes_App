import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/edit_view_notebody.dart';

class EditNoteview extends StatelessWidget {
  const EditNoteview({super.key, required this.note});
  final NoteAppModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(
        note: note,
      ),
    );
  }
}
