import 'package:liste_de_course/data/dao/ElementDao.dart';
import 'package:liste_de_course/data/dao/ListeDao.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

// Moor works by source gen. This file will all the generated code.
part 'moor_database.g.dart';

class Listes extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 1, max: 50)();
}

class Elements extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idListe => integer()();

  TextColumn get title => text().withLength(min: 1, max: 50)();
  BoolColumn get checked => boolean().withDefault(Constant(false))();
}

@UseMoor(tables: [Listes, Elements], daos: [ListeDao, ElementDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;
}
