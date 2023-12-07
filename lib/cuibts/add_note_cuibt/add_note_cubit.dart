import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/contsans.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = const Color(0xFFac3931);
  addNote(NoteAppModel note) async {
    note.color = color.value;
    emit(AddNoteLoading());
    try {
      var notebox = Hive.box<NoteAppModel>(kNotesBox);
      await notebox.add(note);
      emit(AddNoteSucess());
    } catch (e) {
      emit(AddNoteFauiler(e.toString()));
    }
  }
}
