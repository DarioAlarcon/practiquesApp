import 'package:flutter/material.dart';
//import 'package:udemypractiques/src/pages/headers_page.dart';
//import 'package:udemypractiques/src/pages/animations_page.dart';
//import 'package:udemypractiques/src/challenge/animated_cuadrado_page.dart';
//import 'package:udemypractiques/src/labs/circular_progress_page.dart';
//import 'package:udemypractiques/src/pages/circular_graphics_page.dart';
import 'package:udemypractiques/src/pages/slideShow_page.dart'; 

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: SlideShowPage()
    );
  }
}