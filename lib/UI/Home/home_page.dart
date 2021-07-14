import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liste_de_course/Logic/models/Liste.dart';
import 'package:liste_de_course/Logic/services/ListeService.dart';
import 'package:liste_de_course/Logic/services/UtilsService.dart';
import 'package:liste_de_course/UI/Home/widget/liste_widget.dart';
import 'package:liste_de_course/constants/colorConstant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _liste = [];
  List<Liste> _listes = [];
  UtilsService utilsService = UtilsService();
  ListeService listeService = ListeService();

  void add(String titre) {
    _liste.add(titre);
  }

  void test() async {
    // listeService.insertListe(Liste.withoutId('Test'));
    // listeService.insertListe(Liste.withoutId('Test 2'));
    listeService.insertListe(Liste.withoutId('Test 4'));

    _listes = await listeService.getListes();
    _listes.forEach((element) {
      print(element.id);
      print(element.title);
    });
  }

  void edit(String titre, int index) {
    _liste[index] = titre;
    setState(() {});
  }

  void delete(int index) {
    String liste = _liste[index];
    _liste.remove(liste);
    setState(() {});
  }

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
                this.test();
                // utilsService
                //     .showInputDialog(
                //         context: context,
                //         titre: 'Ajouter une liste',
                //         hintText: 'Nom de la liste',
                //         dialogFunction: add,
                //         okButton: 'Ajouter')
                //     .then((_) => setState(() {}));
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
                return ListeWidget(
                  title: '${_liste[index]}',
                  index: index,
                  editFunction: edit,
                  deleteFunction: delete,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
