//Mark Neil G. Autriz
//CMSC 23 - U2L - Exercise # 4

/* This code serves as the entry point of the application and defines the main app widget, SlamBookApp, which sets up 
the MaterialApp with a dark theme and sets SlamBookForm as the home screen. */

import 'package:flutter/material.dart';
import 'slam_book_form.dart'; // Importing the SlamBookForm widget

// Main entry point of the application
void main() {
  runApp(SlamBookApp()); // Running the SlamBookApp widget
}

// Top-level widget representing the Slam Book application
class SlamBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slam Book', // Title of the application
      theme: ThemeData.dark(), // Setting the theme to dark mode
      home: SlamBookForm(), // Setting SlamBookForm as the home screen
    );
  }
}
