import 'package:flutter/material.dart';
import 'package:liste_de_course/UI/Home/home_page.dart';
import 'package:liste_de_course/data/db/moor_database.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ListeDeCourse());
}

class ListeDeCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AppDatabase(),
      child: MaterialApp(
        home: HomePage(),
        theme: ThemeData(fontFamily: 'Quicksand'),
      ),
    );
  }
}
