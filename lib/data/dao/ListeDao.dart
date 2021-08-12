import 'package:liste_de_course/data/db/moor_database.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'ListeDao.g.dart';

@UseDao(tables: [Listes])
class ListeDao extends DatabaseAccessor<AppDatabase> with _$ListeDaoMixin {
  final AppDatabase db;

  ListeDao(this.db) : super(db);

  Future<List<Liste>> getAllListe() => select(listes).get();
  Future<Liste> getListe(int id) {
    return (select(listes)..where((t) => t.id.equals(id))).getSingle();
  }

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<Liste>> watchAllListe() => select(listes).watch();

  Future insertListe(ListesCompanion liste) => into(listes).insert(liste);

  // Updates a Task with a matching primary key
  Future updateListe(Liste liste) => update(listes).replace(liste);

  Future deleteListe(Liste liste) => delete(listes).delete(liste);
}
