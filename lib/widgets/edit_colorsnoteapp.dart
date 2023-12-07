import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_listview.dart';
import 'package:notes_app/widgets/contsans.dart';

class EditNoteColor extends StatefulWidget {
  const EditNoteColor({super.key, required this.note});
  final NoteAppModel note;

  @override
  State<EditNoteColor> createState() => _EditNoteColorState();
}

class _EditNoteColorState extends State<EditNoteColor> {
  late int currentindex;
  @override
  void initState() {
    currentindex = kcolor.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 3,
      child: ListView.builder(
          itemCount: kcolor.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () {
                  currentindex = index;
                  widget.note.color = kcolor[index].value;
                  setState(() {});
                },
                child: ColorItem(
                  color: kcolor[index],
                  isAactivie: currentindex == index,
                ),
              ),
            );
          }),
    );
  }
}
