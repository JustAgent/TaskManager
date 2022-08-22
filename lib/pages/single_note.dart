import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/constants/colors.dart';


class Note extends StatefulWidget {

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            color: Color(noteMain),
            borderRadius: BorderRadius.circular(9)
        ),
        padding: const EdgeInsets.all(16),
        width: 160,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
                textAlign: TextAlign.left,
                'Cerebral palassd s',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w900,
                  color: Color(appBarTextCOLOR),
                  fontSize: 16,)),
            Text(
              textAlign: TextAlign.left,
                'Recent Notadskmslkadmklasmdklasmdklasmkdamskdlmsalkmdklasmdklasmdlkamdlklsamdlksamdlkasmdlsamksamdlkasmdlkasmdlmslmksdmaksmdkasmdss',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w700,
                  color: Color(appBarTextCOLOR),
                  fontSize: 14,))
          ],
        ),
      ),
    );
  }
}
