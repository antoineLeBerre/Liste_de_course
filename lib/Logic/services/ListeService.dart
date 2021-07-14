import 'package:liste_de_course/Logic/models/Liste.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ListeService {
  Future<Database>? database;

  ListeService() {
    this.database = openDb();
  }

  Future<Database> openDb() async => openDatabase(
        join(await getDatabasesPath(), 'listes_database.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE listes(id INTEGER PRIMARY KEY AUTOINCREMENT, titre TEXT)',
          );
        },
        version: 1,
      );

  Future<void> insertListe(Liste liste) async {
    final db = await this.database;

    await db!.insert(
      'listes',
      liste.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Liste>> getListes() async {
    final db = await this.database;

    final List<Map<String, dynamic>> maps = await db!.query('listes');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Liste(maps[i]['id'], maps[i]['titre']);
    });
  }
}
