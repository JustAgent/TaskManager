import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/database/crud.dart';
import 'package:task_manager/model/local_storage.dart';
import 'package:task_manager/model/model.dart';
import 'package:task_manager/pages/single_note.dart';
import 'dart:math';


class AddNote extends StatefulWidget {
  const AddNote(this.callbackFunc, {Key? key}) : super(key: key);
  final Function callbackFunc;

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  getColor() {
    return noteColor;
  }

  String title = '';
  String desc = '';
  int noteColor = noteMain;

  callbackColor(color) {
    setState(() {
      noteColor = color;
    });
  }

  void close() {
    if (title != '') {
      var tempId = UniqueKey();
      products.add(Product(title: title, desc: desc, color: noteColor, id: tempId));
      print('START REQUEST');
      Request().createNote(title, desc, noteColor, tempId);
      print('END REQUEST');
      widget.callbackFunc();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            close();
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
              Icons.check,
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
                  Icons.more_vert,
                  color: Color(appBarTextColor),
                )
            )
          ],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(appBarTextColor),
            ),
            onPressed: () {
              close();
            },
          ),
          title: Text(
            'Add Note',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w900,
              color: Color(appBarTextColor),
              fontSize: 14,
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Color(bgMain),
            boxShadow: const [BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 8,
            ),],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) => ColorSelector(btnColors[index], callbackColor)),
          ),
        ),
        backgroundColor: Color(bgMain),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                onChanged: (text) {
                  title = text;
                },
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
                    onChanged: (text) {
                      desc = text;
                    },
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
    );
  }
}

class ColorSelector extends StatefulWidget {
  ColorSelector(this.color, this.callback, {Key? key}) : super(key: key);
  final int color;
  final Function callback;
  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()  {
        widget.callback(widget.color);
      },
      child: Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.fromLTRB(10, 5, 5, 10),
              decoration: BoxDecoration(
                color: Color(widget.color),
                borderRadius: BorderRadius.circular(16),
              //   boxShadow: [
              // BoxShadow(
              //   offset: Offset(0.0, 3.75),
              //   color: Color(btnBgMain),
              //   spreadRadius: 1,
              //   blurRadius: 10,
              // )]
          )
      ),
      //color: Colors.red,
        );
  }
}
