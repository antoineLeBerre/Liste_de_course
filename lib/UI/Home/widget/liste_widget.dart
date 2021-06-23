import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListeWidget extends StatelessWidget {
  final String title;
  final String index;

  ListeWidget({required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        this.index,
        style: TextStyle(
          fontSize: 30.0,
        ),
      ),
      title: Text(
        this.title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Text(
        "10 éléments",
        style: TextStyle(
          fontWeight: FontWeight.w200,
        ),
      ),
      horizontalTitleGap: 25.0,
      contentPadding: EdgeInsets.fromLTRB(25.0, 10.0, 5.0, 10.0),
      trailing: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.edit,
              size: 30.0,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Edit Message"),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete_sharp,
              color: Color(0xFFFF0000),
              size: 30.0,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Delete Message"),
                ),
              );
            },
          ),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Tap Message"),
          ),
        );
      },
    );
  }
}
