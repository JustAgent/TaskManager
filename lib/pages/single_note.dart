import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/model/local_storage.dart';
import 'package:task_manager/model/model.dart';
import 'package:task_manager/pages/edit_note.dart';

  Widget Note(context, product, index) {

    void deleteNote() {
      products.removeWhere((element) => element.id == index);
    }
    
    Future<bool> showDeleteDialog() async {
      return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
          content: GestureDetector(
              onTap: () {
                deleteNote();
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: const Text('Delete')),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14))
            ),
            contentTextStyle: GoogleFonts.nunito(
              fontWeight: FontWeight.w900,
              color: Color(appBarTextCOLOR),
              fontSize: 18,
              letterSpacing: 1.5,
            backgroundColor: Color(noteMain),
            ),
          )
      );
    }

    return InkWell(
      onTap: () async {
         Navigator.of(context).push(MaterialPageRoute(builder:
             (context) => EditNote(index, product.title, product.desc)));
        // Navigator.pushReplacementNamed(context, '/editNote', arguments: {index, product.title, product.desc} );
         },
      onLongPress: () => showDeleteDialog(),

        child: Container(
          decoration: BoxDecoration(
              color: Color(product.color),
              borderRadius: BorderRadius.circular(9)
          ),
          padding: const EdgeInsets.all(16),
          width: 160,
          child: ConstrainedBox(
            //color: Colors.red,
            constraints: const BoxConstraints(
              minHeight: 50,
            ),
            child: Stack(
                children:  [

                  //  Padding(
                  //   padding: EdgeInsets.fromLTRB(118, 0, 0, 0),
                  //     child: GestureDetector(
                  //       onTap: () {
                  //         return showDialog(context: context, builder: builder)
                  //       },
                  //       child: Icon(
                  //           Icons.close,
                  //       ),
                  //     )
                  // ),
                  Text(product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      color: Color(appBarTextCOLOR),
                      fontSize: 16,),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 42, 0, 0),
                    child: Text(
                      product.desc,
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
        ));  }


