import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cuibts/notes_cuibts/notes_cubit.dart';
import 'package:notes_app/views/serach_note.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/notes_listview.dart';

class NotesAppViewBody extends StatefulWidget {
  const NotesAppViewBody({super.key});

  @override
  State<NotesAppViewBody> createState() => _NotesAppViewBodyState();
}

class _NotesAppViewBodyState extends State<NotesAppViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Column(
        children: [
          const SizedBox(
            height: 22,
          ),
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
            onPressed: () {
              //go to search view to search notes
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchNote();
                  },
                ),
              );
            },
          ),
          const Expanded(
            child: NotesListview(),
          ),
        ],
      ),
    );
  }
}
