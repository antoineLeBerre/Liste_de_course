import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liste_de_course/UI/utils/popin_input_widget.dart';
import 'package:liste_de_course/UI/utils/popin_text_widget.dart';
import 'package:liste_de_course/data/db/moor_database.dart';
import 'package:liste_de_course/constants/colorConstant.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) => PopinInputWidget(
                    title: 'Ajouter une liste',
                    hintText: 'Nom de la liste',
                    okButton: 'Ajouter',
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
            child: _buildTaskList(context, database),
          ),
        ],
      ),
    );
  }

  StreamBuilder<List<Liste>> _buildTaskList(
      BuildContext context, AppDatabase database) {
    return StreamBuilder(
      stream: database.watchAllListe(),
      builder: (context, AsyncSnapshot<List<Liste>> snapshot) {
        final listes = snapshot.data ?? [];

        return ListView.builder(
          itemCount: listes.length,
          itemBuilder: (_, index) {
            final itemListe = listes[index];
            return _buildListItem(itemListe, database, index);
          },
        );
      },
    );
  }

  Widget _buildListItem(Liste itemListe, AppDatabase database, int index) {
    return ListTile(
      leading: Text(
        (index + 1).toString(),
        style: TextStyle(
          fontSize: 30.0,
        ),
      ),
      title: Text(
        itemListe.title,
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
              showDialog(
                context: context,
                builder: (BuildContext context) => PopinInputWidget(
                  title: 'Modifier la liste',
                  hintText: 'Nom de la liste',
                  okButton: 'Modifier',
                  elementToUpdate: itemListe,
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
              showDialog(
                context: context,
                builder: (BuildContext context) => PopinTextWidget(
                  title: 'Supprimer la liste',
                  texte: 'Supprimer la liste : ${itemListe.title}',
                  okButton: 'Supprimer',
                  elementToDelete: itemListe,
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
