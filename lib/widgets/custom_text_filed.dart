import 'package:flutter/material.dart';
import 'package:notes_app/widgets/contsans.dart';

class CustomTextfiled extends StatelessWidget {
  const CustomTextfiled(
      {super.key,
      required this.hint,
      this.maxline = 1,
      this.onSaved,
      this.onChanged});
  final String hint;
  final int maxline;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "field is required";
        } else {
          return null;
        }
      },
      maxLines: maxline,
      cursorColor: kprimarycolor,
      decoration: InputDecoration(
          hintText: hint,
          border: builderborder(),
          enabledBorder: builderborder(),
          focusedBorder: builderborder(color: kprimarycolor)),
    );
  }

  OutlineInputBorder builderborder({color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
