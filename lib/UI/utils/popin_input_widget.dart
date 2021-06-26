import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liste_de_course/constants/colorConstant.dart';

class PopinInputWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final Function addOrEdit;
  final String okButton;
  final String listeTitle;

  const PopinInputWidget(
      {required this.title,
      required this.hintText,
      required this.addOrEdit,
      required this.okButton,
      this.listeTitle = ''});

  @override
  Widget build(BuildContext context) {
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
            controller: TextEditingController(text: listeTitle),
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
              this.addOrEdit(_value!.trim());
            }
            Navigator.of(context).pop();
          },
          child: Text(okButton),
        ),
      ],
    );
  }
}
