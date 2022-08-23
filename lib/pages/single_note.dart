import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/model/model.dart';


Widget Note(Function() onTap, product) {
  return InkWell(
    child: Container(
      decoration: BoxDecoration(
          color: Color(noteMain),
          borderRadius: BorderRadius.circular(9)
      ),
      padding: const EdgeInsets.all(16),
      width: 160,
      child: ConstrainedBox(
        //color: Colors.red,
        constraints: const BoxConstraints(
          minHeight: 130,
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
  ));
}

