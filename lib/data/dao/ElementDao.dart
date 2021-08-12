import 'package:liste_de_course/data/db/moor_database.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'ElementDao.g.dart';

@UseDao(tables: [Elements])
class ElementDao extends DatabaseAccessor<AppDatabase> with _$ElementDaoMixin {
  final AppDatabase db;

  ElementDao(this.db) : super(db);

  Future<List<Element>> getAllElement() => select(elements).get();

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<Element>> watchAllElement() => select(elements).watch();

  Future insertElement(ElementsCompanion element) =>
      into(elements).insert(element);

  // Updates a Task with a matching primary key
  Future updateElement(Element element) => update(elements).replace(element);

  Future deleteElement(Element element) => delete(elements).delete(element);
}
