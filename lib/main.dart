import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/pages/add_note.dart';
import 'package:task_manager/pages/edit_note.dart';
import 'package:task_manager/pages/landing_page.dart';
import 'package:task_manager/pages/notes.dart';
import 'package:task_manager/pages/sign_up_page.dart';
import 'package:task_manager/pages/single_note.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    home: LandingPage(),
  )
  );
}