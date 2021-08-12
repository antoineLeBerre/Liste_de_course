import 'package:liste_de_course/Locator.dart';
import 'package:liste_de_course/data/db/moor_database.dart';
import 'package:liste_de_course/repository/entity/ListeEntity.dart';

class ListeService {
  final listeDao = locator.get<AppDatabase>().listeDao;

  Future<ListeEntity> getListe(int id) async {
    var test = await listeDao.getListe(id);
    return test;
  }
}
