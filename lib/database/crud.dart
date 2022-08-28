import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager/model/local_storage.dart';
import 'package:task_manager/model/model.dart';
import 'package:firebase_core/firebase_core.dart';

class Request extends StatelessWidget {
  const Request({Key? key}) : super(key: key);



  Future createNote(title, desc, color, id) async {
    final docNote = FirebaseFirestore.instance.collection('users').doc('1@mail.ru').snapshots().;
    // final data = {
    //   'color': color,
    //   'id': 3,
    //   'desc': desc,
    //   'title': title,
    // };
    print('START');
    print(docNote);
    //await docNote.add(data);
    print('END');
  }

  Future createUser(email, username) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(email);
    final json = {
      'products': [

      ],
      'email': email,
    };
    await docUser.set(json);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }



}
