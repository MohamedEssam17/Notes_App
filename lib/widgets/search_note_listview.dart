import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cuibts/notes_cuibts/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

class SearchNotesListView extends StatelessWidget {
  const SearchNotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          //fetch filtered notes list
          List<NoteAppModel> filteredNoteList =
              BlocProvider.of<NotesCubit>(context).filteredNoteList!;
          return Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 4),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: filteredNoteList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: NoteItems(
                    notes: filteredNoteList[index],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
