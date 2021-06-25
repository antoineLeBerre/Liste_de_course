import 'package:flutter/material.dart';
import 'package:liste_de_course/UI/utils/popin_widget.dart';

class UtilsService {
  Future<void> createAlertDialog(
      {required BuildContext context,
      required String titre,
      required String hintText,
      required Function dialogFunction,
      required String okButton,
      String listeTitle = ''}) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => PopinWidget(
        title: titre,
        hintText: hintText,
        addOrEdit: dialogFunction,
        okButton: okButton,
        listeTitle: listeTitle,
      ),
    );
  }
}
