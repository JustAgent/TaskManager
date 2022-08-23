import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/model/model.dart';
import 'package:task_manager/pages/edit_note.dart';

  Widget Note(context, product, index) {


    return InkWell(
      onTap: () async {
         Navigator.pushReplacementNamed(context, '/editNote', arguments: {index, product.title, product.desc} );
         },

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
                children: [
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


