import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

// Moor works by source gen. This file will all the generated code.
part 'moor_database.g.dart';

class Listes extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 1, max: 50)();
}

@UseMoor(tables: [Listes])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;

  Future<List<Liste>> getAllListe() => select(listes).get();

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<Liste>> watchAllListe() => select(listes).watch();

  Future insertListe(ListesCompanion liste) => into(listes).insert(liste);

  // Updates a Task with a matching primary key
  Future updateListe(Liste liste) => update(listes).replace(liste);

  Future deleteListe(Liste liste) => delete(listes).delete(liste);
}
