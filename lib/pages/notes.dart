import 'dart:ui';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/model/local_storage.dart';
import 'package:task_manager/pages/single_note.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red,
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
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 400,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
              child: MasonryGridView.count(
                physics: const AlwaysScrollableScrollPhysics(),
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                crossAxisSpacing: 12,
                mainAxisSpacing: 8,
                itemCount: products.length + 1,
                itemBuilder: (BuildContext context1, int index) {
                  if (index < products.length) {
                    return Note(context, products[index], index);
                  }
                  return const SizedBox(
                    height: 50,
                  );
                },
              ),
            ),
          )
      ),
    );
  }
}