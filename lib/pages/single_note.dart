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
        child: ConstrainedBox(
          //color: Colors.red,
          constraints: const BoxConstraints(
            minHeight: 130,
          ),
          child: Stack(
            children: [
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                'Cerebral palsy sport',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w900,
                  color: Color(appBarTextCOLOR),
                  fontSize: 14,),
          ),



              Padding(
                padding: const EdgeInsets.fromLTRB(0, 42, 0, 0),
                child: Text(
                  'Cerebral palsy sport classification is a classification '
                      'system used by sports that include people with cerebral'
                      ' palsy (CP) with different degrees of severity to compete '
                      'fairly against each...',
                maxLines: 9,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w700,
                    color: Color(appBarTextCOLOR),
                    fontSize: 14,),
            ),
              ),
          ]),
      ),
    ));
  }
}
