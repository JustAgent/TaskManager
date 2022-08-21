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
  int enterNameColor = 0xff403B36;
  int writeSomethingColor = 0xff595550;
  var w900 = FontWeight.w900;
  var w700 = FontWeight.w700;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(bgMain),
          actions: [
            IconButton(onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
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
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                maxLength: 30,
                maxLines: 2,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter name...',
                  counterText: '',
                  hintStyle: GoogleFonts.nunito(
                    color: Color(enterNameColor),
                    fontSize: 24,
                    fontWeight: w900,
                  )
                ),
                style: GoogleFonts.nunito(
                  fontSize: 24,
                  fontWeight: w900,
                  color: Color(enterNameColor)
                ),
              ),
              Expanded(
                child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write something...',
                  hintStyle: GoogleFonts.nunito(
                    color: Color(writeSomethingColor),
                    fontSize: 18,
                    fontWeight: w700,
                  )
                ),
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: w700,
                  color: Color(writeSomethingColor),
                ),
              ))
            ],
          ),
        )
      ),
    );
  }
}
//TODO
//CLASS = NOTE
// id title text smth
// create class
// add him to list
