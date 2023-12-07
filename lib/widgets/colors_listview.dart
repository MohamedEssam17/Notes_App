import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cuibts/add_note_cuibt/add_note_cubit.dart';
import 'package:notes_app/widgets/contsans.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isAactivie, required this.color});
  final bool isAactivie;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isAactivie
        ? CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 36,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 36,
            backgroundColor: color,
          );
  }
}

class ColorLisview extends StatefulWidget {
  const ColorLisview({super.key});

  @override
  State<ColorLisview> createState() => _ColorLisviewState();
}

class _ColorLisviewState extends State<ColorLisview> {
  int currentindex = 0;

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
                  BlocProvider.of<AddNoteCubit>(context).color = kcolor[index];
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
