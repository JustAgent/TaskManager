import 'package:flutter/material.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/model/model.dart';

List<Product> products = [
  Product(title: 'title0', desc: 'desc2', color: noteGreen, id: UniqueKey()),
  Product(title: 'title1', desc: 'desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2', color: noteMain, id: UniqueKey()),
  Product(title: 'title2', desc: 'desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2', color: noteBlue, id: UniqueKey()),
  Product(title: 'title3', desc: 'desc2', color: noteRed,  id: UniqueKey()),
  Product(title: 'title4', desc: 'desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2desc2', color: noteYellow, id:UniqueKey()),

  ];

String userEmail = '';