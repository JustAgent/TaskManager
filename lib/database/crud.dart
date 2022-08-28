import 'dart:collection';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager/model/local_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task_manager/model/model.dart';

class Request extends StatelessWidget {

  String? userEmail = FirebaseAuth.instance.currentUser?.email;

  Future setProducts(callback) async {
    late Map<String,dynamic> result;
    await FirebaseFirestore.instance.collection('users')
        .doc(userEmail)
        .get()
        .then(
        (DocumentSnapshot doc) {
          result = doc.data() as Map<String,dynamic>;
        });
    products = result['products'];
    print(products);
    callback();
  }
  Future createNote(title, desc, color, id) async {
    DocumentReference docNote = FirebaseFirestore.instance.collection('users').doc(userEmail);
    final data = {
      'color': color,
      'id': id.toString(),
      'desc': desc,
      'title': title,
    };
    await docNote.update(
      {
        'products': FieldValue.arrayUnion([
          data
        ])
      }
    );
    print(userEmail);
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
