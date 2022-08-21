import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/pages/single_note.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  int bgMain = 0xffF8EEE2;
  int noteMain = 0xffFFFDFA;
  int appBarTextCOLOR = 0XFF403B36;
  int whiteColor = 0xff000000;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/note');
          },
        ),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(bgMain),
          actions: [
            IconButton(onPressed: () {},
                icon: Icon(
                  Icons.search_outlined,
                  color: Color(appBarTextCOLOR),
                )
            )
          ],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(appBarTextCOLOR),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          title: Text(
            'Add Note',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w900,
              color: Color(appBarTextCOLOR),
              fontSize: 14,
            ),
          ),
        ),
        backgroundColor: Color(bgMain),
        body: Center(
          child: Note(),
        ),
      ),
    );
  }
}
