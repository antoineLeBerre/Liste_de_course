import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liste_de_course/constants/colorConstant.dart';
import 'package:liste_de_course/data/dao/ListeDao.dart';
import 'package:provider/provider.dart';

class PopinTextWidget extends StatelessWidget {
  final String title;
  final String texte;
  final String okButton;
  final dynamic elementToDelete;

  const PopinTextWidget(
      {required this.title,
      required this.texte,
      required this.okButton,
      required this.elementToDelete});

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<ListeDao>(context);
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
          Text(texte),
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
            dao.deleteListe(elementToDelete);
            Navigator.of(context).pop();
          },
          child: Text(okButton),
        ),
      ],
    );
  }
}
