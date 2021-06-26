import 'package:flutter/material.dart';
import 'package:liste_de_course/UI/utils/popin_input_widget.dart';
import 'package:liste_de_course/UI/utils/popin_text_widget.dart';

class UtilsService {
  Future<void> showInputDialog(
      {required BuildContext context,
      required String titre,
      required String hintText,
      required Function dialogFunction,
      required String okButton,
      String listeTitle = ''}) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => PopinInputWidget(
        title: titre,
        hintText: hintText,
        addOrEdit: dialogFunction,
        okButton: okButton,
        listeTitle: listeTitle,
      ),
    );
  }

  Future<void> showTextDialog(
      {required BuildContext context,
      required String titre,
      required String texte,
      required Function dialogFunction,
      required String okButton}) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => PopinTextWidget(
        title: titre,
        texte: texte,
        okFunction: dialogFunction,
        okButton: okButton,
      ),
    );
  }
}
