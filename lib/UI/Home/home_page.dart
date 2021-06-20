import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liste_de_course/UI/Home/Layout/liste_layout.dart';
import 'package:liste_de_course/constants/colorConstant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _liste = ['Liste 1', 'Liste 2', 'Liste 3', 'Liste 4'];
  final test = List<String>.generate(1000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mes listes',
          style: TextStyle(
            color: kBlack,
            fontSize: 30.0,
            fontWeight: FontWeight.w200,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
            child: IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Add Message"),
                  ),
                );
              },
              icon: Icon(
                Icons.add,
                size: 40.0,
                color: kBlack,
              ),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: kAzur,
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: _liste.length,
              itemBuilder: (context, index) {
                return ListeLayout(
                  title: '${_liste[index]}',
                  index: '${index + 1}',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
