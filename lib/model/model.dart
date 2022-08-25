import 'package:flutter/material.dart';

class Product {
  String title, desc;
  int color;
  UniqueKey id;

  Product({
    required this.title,
    required this.desc,
    required this.color,
    required this.id,
});

}