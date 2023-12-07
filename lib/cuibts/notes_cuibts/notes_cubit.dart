import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/contsans.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteAppModel>? notes;
  List<NoteAppModel>? filteredNoteList;
  fetchAllNotes() async {
    var notebox = Hive.box<NoteAppModel>(kNotesBox);
    notes = notebox.values.toList();
    emit(NotesSuccess());
  }

  searchNote(String search) {
    filteredNoteList = notes!.where((s) => s.title!.contains(search)).toList();
    emit(NotesSuccess());
  }
}
