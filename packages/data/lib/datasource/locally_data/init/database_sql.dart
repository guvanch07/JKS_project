import 'package:data/datasource/locally_data/models/struct_of_db.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalDBInit {
  factory LocalDBInit({required int version, required String nameDB}) =>
      _LocalDBInit(
        version: version,
        nameDB: nameDB,
      );
  Future<Database> get db;
  Future<Database> initLocalDB();
  Future<void> openTable(Database db);
  Future<void> createTables(Database db);
}

class _LocalDBInit implements LocalDBInit {
  final int version;
  final String nameDB;
  Database? _db;

  _LocalDBInit({
    required this.version,
    required this.nameDB,
  });
  @override
  Future<Database> get db async {
    if (_db != null) return _db!;

    _db = await initLocalDB();
    return _db!;
  }

  @override
  Future<Database> initLocalDB() async {
    final databasesPath = await getDatabasesPath();
    String path = LocalDBStructure.getPath(databasesPath, nameDB);

    return await openDatabase(path,
        version: version,
        onOpen: (db) async => await openTable(db),
        onCreate: (Database db, int version) async => await createTables(db));
  }

  @override
  Future<void> openTable(Database db) async {
    await db.execute(LocalDBStructure.queryForeignKeysOn());
  }

  @override
  Future<void> createTables(Database db) async {
    await db.execute(LocalDBStructure.queryForeignKeysOn());
    await db.execute(LocalDBStructure.queryCreatePropertyJobs());
  }
}
