import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Note extends StatefulWidget {

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
      ),
      );
  }
}
