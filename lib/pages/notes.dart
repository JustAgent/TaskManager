import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/model/local_storage.dart';
import 'package:task_manager/pages/add_note.dart';
import 'package:task_manager/pages/single_note.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/model.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);
  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {

  bool isVisible = false;
  late int localProducts;


  callback() {
    setState(() {
      localProducts = 0;
      if (products.isNotEmpty) {
        isVisible = true;
      }
      else {
        isVisible = false;
      }
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: isVisible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder:
                (context) => AddNote(callback)));
          },
          elevation: 20,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(begin: Alignment.bottomRight,end: Alignment.topLeft, colors: btnGradient),
            ),
            child: const Icon(
              Icons.add_outlined,
              size: 30,
            ),
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
                color: Color(appBarTextColor),
              )
          )
        ],
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Color(appBarTextColor),
          ),
          onPressed: () {  },
        ),
        title: Text(
          'All Notes',
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w900,
            color: Color(appBarTextColor),
            fontSize: 14,
          ),
        ),
      ),
      backgroundColor: Color(bgMain),
      body: isVisible
      ? Padding(
        padding: EdgeInsets.fromLTRB(0, 29, 0, 0),
        child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 400,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
                child: MasonryGridView.count(
                  physics: const AlwaysScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 8,
                  itemCount: products.length + 1,
                  itemBuilder: (BuildContext context1, int index) {
                    if (index < products.length) {
                      return note(context, products[index], index, callback);
                    }
                    return const SizedBox(
                      height: 50,
                    );
                  },
                ),
              ),
            ),
        ),
      )
      : Padding(
        padding: /**/const EdgeInsets.fromLTRB(31, 70, 31, 0),
        child: Center(
          child: Column(
            children: [
              const Image(
                  image: AssetImage(
                    'assets/create.png'
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  'Create Your First Note',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      color: Color(appBarTextColor),
                      fontSize: 24)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                    'Add a note about anything (your thoughts on climate change, or your history essay) and share it witht the world.',
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w700,
                        color: Color(appBarTextColor),
                        fontSize: 16)
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder:
                          (context) => AddNote(callback)));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(btnBgMain),
                      padding: const EdgeInsets.symmetric(horizontal: 86, vertical: 26),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                    child: Text(
                      'Create A Note',
                        maxLines: 1,
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w900,
                            color: Color(btnColor),
                            fontSize: 20)
                    ),
                  ),
              ),
            ],
          ),
         ),
      ),
    );
  }
}