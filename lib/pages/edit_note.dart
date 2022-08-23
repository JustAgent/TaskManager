import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/model/local_storage.dart';
import 'package:task_manager/model/model.dart';
import 'package:task_manager/pages/single_note.dart';

class EditNote extends StatefulWidget {
  const EditNote(this.id, this.oldTitle, this.oldDesc, {Key? key}) : super(key: key);
  final int id;
  final String oldTitle;
  final String oldDesc;
  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {


  String title = '';
  String desc = '';

  void close() {
    if (title != '') {
      products[widget.id].title = title;
      products[widget.id].desc = desc;
      Navigator.pushReplacementNamed(context, '/');
    }
    //Navigator.pushReplacementNamed(context, '/');
  }


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
                close();
              },
            ),
            title: Text(
              'Edit Note',
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
                TextFormField(
                  onChanged: (text) {
                    title = text;
                  },
                  maxLength: 30,
                  maxLines: 2,
                  initialValue: widget.oldTitle,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      //hintText: widget.oldTitle,
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
                    child: TextFormField(
                      onChanged: (text) {
                        desc = text;
                      },
                      initialValue: widget.oldDesc,
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
//VALUES FROM MAIN > CONStructor
//разобраться с передачей данных
//придумать как работать с айди
//поменять текст на старый