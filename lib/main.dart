import 'package:flutter/material.dart';
import 'slam_book_form.dart';

void main() {
  runApp(SlamBookApp());
}

class SlamBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slam Book',
      theme: ThemeData.dark(),
      home: SlamBookForm(),
    );
  }
}
