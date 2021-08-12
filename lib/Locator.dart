import 'package:get_it/get_it.dart';
import 'package:liste_de_course/data/db/moor_database.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<AppDatabase>(() => AppDatabase());
}
