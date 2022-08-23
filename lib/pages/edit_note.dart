import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/model/local_storage.dart';
import 'package:task_manager/model/model.dart';
import 'package:task_manager/pages/single_note.dart';

class EditNote extends StatefulWidget {
  const EditNote({Key? key}) : super(key: key);

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {

  String title = '';
  String desc = '';

  @override
  void dispose() {
    super.dispose();
    if (title != '') {
      products.add(Product(title: title, desc: desc, color: noteBlue, id: 2));
    }

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
      ),
    );
  }
}
//TODO
//CLASS = NOTE
// id title text smth
// create class
// add him to list