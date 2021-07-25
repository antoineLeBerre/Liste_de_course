import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liste_de_course/constants/colorConstant.dart';
import 'package:liste_de_course/data/db/moor_database.dart';
import 'package:moor_flutter/moor_flutter.dart' as moor;
import 'package:provider/provider.dart';

class PopinInputWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final String okButton;
  final Liste? elementToUpdate;

  const PopinInputWidget(
      {required this.title,
      required this.hintText,
      required this.okButton,
      this.elementToUpdate});

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    String? _value;

    return AlertDialog(
      title: Text(
        this.title,
        style: TextStyle(
          color: kAzur,
        ),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: TextEditingController(text: elementToUpdate?.title),
            decoration: InputDecoration(
              hintText: hintText,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kAzur),
              ),
            ),
            autofocus: true,
            autocorrect: false,
            cursorColor: kAzur,
            onChanged: (text) {
              _value = text;
            },
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Fermer'),
        ),
        TextButton(
          onPressed: () {
            if (_value != null && _value!.isNotEmpty) {
              if (elementToUpdate == null) {
                database
                    .insertListe(ListesCompanion(title: moor.Value(_value!)));
              } else {
                database.updateListe(elementToUpdate!.copyWith(title: _value));
              }
            }
            Navigator.of(context).pop();
          },
          child: Text(okButton),
        ),
      ],
    );
  }
}
