import 'package:flutter/material.dart';
import 'package:task_manager/pages/add_note.dart';
import 'package:task_manager/pages/edit_note.dart';
import 'package:task_manager/pages/notes.dart';
import 'package:task_manager/pages/sign_up_page.dart';
import 'package:task_manager/pages/single_note.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  debugShowCheckedModeBanner: false,
  routes: {
    '/signup': (context) => SignUp(),
    '/': (context) =>  Notes(),
    '/addNote': (context) =>  AddNote(),
    //'/editNote': (context) =>  EditNote(1,'213','2132'),
  },
));