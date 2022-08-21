import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/pages/single_note.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {

  int bgMain = 0xffF8EEE2;
  int btnBgMain = 0xffD9614C;
  int noteMain = 0xffFFFDFA;
  int appBarTextCOLOR = 0XFF403B36;
  int whiteColor = 0xff000000;
  var btnGradient = <Color>[
  Color(0xff1f005c),
  Color(0xff5b0060),
  Color(0xff870160),
  Color(0xffac255e),
  Color(0xffca485c),
  Color(0xffe16b5c),
  Color(0xfff39060),
  Color(0xffffb56b),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/addNote');
          },
          elevation: 20,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(begin: Alignment.bottomRight,end: Alignment.topLeft, colors: btnGradient),
            ),
            child: Icon(
              Icons.add_outlined,
              size: 30,
            ),
          ),
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
              Icons.menu,
              color: Color(appBarTextCOLOR),
            ),
            onPressed: () {  },
          ),
          title: Text(
            'Recent Notes',
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
