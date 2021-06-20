import 'package:flutter/material.dart';
import 'package:liste_de_course/UI/Home/home_page.dart';

void main() {
  runApp(ListeDeCourse());
}

class ListeDeCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(fontFamily: 'Quicksand'),
    );
  }
}
