import 'package:app_spacex/core/model/launch.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DatabaseManager {
  static const launchStore = "launch-store";
  static DatabaseManager instance = DatabaseManager._internal();

  factory DatabaseManager() => instance;

  late Database _db;

  final StoreRef<int, Map<String, dynamic>> _launchStore =
      intMapStoreFactory.store(launchStore);

  DatabaseManager._internal();

  Future<void> init() async {
    String dataDirectoryPath = (await getApplicationDocumentsDirectory()).path;
    _db = await databaseFactoryIo
        .openDatabase("$dataDirectoryPath/spacex_launches.db");
  }

  /*Future<void> toggleFavorite(bool isFavorite, Launch launch) =>
      isFavorite ? removeLaunch(launch.id) : insertLaunch(launch);

  Future<void> insertLaunch(Launch launch) async =>
      await _db.transaction((transaction) async => await _launchStore
          .record(launch.id)
          .put(transaction, launch.toJson()));

  Future<void> removeLaunch(String launchId) async =>
      await _launchStore.record(launchId).delete(_db);

  Future<bool> isFavorite(String launchId) async =>
      await _launchStore.record(launchId).exists(_db);*/

  Future<List<Launch>> getFavoriteLaunches() async =>
      await _launchStore.find(_db).then((records) =>
          records.map((record) => Launch.fromJson(record.value)).toList());
}
