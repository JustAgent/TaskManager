import 'package:flutter/material.dart';
import 'package:task_manager/pages/add_note.dart';
import 'package:task_manager/pages/notes.dart';
import 'package:task_manager/pages/single_note.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  debugShowCheckedModeBanner: false,
  routes: {
    '/': (context) =>  Notes(),
    '/addNote': (context) =>  AddNote(),
  },
));