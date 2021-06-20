import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liste_de_course/constants/colorConstant.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Test");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("Destroy");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Paramètre',
          style: TextStyle(color: kBlack),
        ),
        backgroundColor: kAzur,
      ),
    );
  }
}
