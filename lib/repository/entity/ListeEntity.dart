import 'package:liste_de_course/data/db/moor_database.dart';

class ListeEntity {
  int? id;
  String title;
  List<Element> elements = [];

  ListeEntity({this.id, required this.title, required this.elements});
  ListeEntity.withoutElement({this.id, required this.title});

  ListeEntity fromDb(Liste liste) {
    return ListeEntity(title: liste.title, id: liste.id, elements: []);
  }
}
