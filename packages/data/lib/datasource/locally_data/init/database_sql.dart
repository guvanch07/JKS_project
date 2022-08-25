import 'package:sqflite/sqflite.dart';
import 'package:domain/model/propery/parametrs_def.dart';
import 'package:domain/model/propery/api_build_models.dart';
import 'package:path/path.dart';

class InitDataBase {
  static const String _jobTableName = JenkinsDatabaseConstants.jobTableName;
  static const String _parametersbTableName =
      JenkinsDatabaseConstants.parametersbTableName;
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDataBase();

    return _database!;
  }

  Future<Database> _initDataBase() async {
    final dbPath = await getDatabasesPath();
    final path = join(
      dbPath,
      JenkinsDatabaseConstants.filePath,
    );

    return openDatabase(
      path,
      version: JenkinsDatabaseConstants.databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    const String idType = 'INTEGER PRIMARY KEY';
    const String integerType = 'INTEGER NOT NULL';
    const String textType = 'TEXT';
    const String jobTableId = ApiBuildDataFields.screenId;
    const String parametersTableId = "_id";

    await db.execute('''
      CREATE TABLE $_jobTableName(
        $jobTableId $idType,
        ${ApiBuildDataFields.description} $textType,
        ${ApiBuildDataFields.displayName} $textType
      )
    ''');

    await db.execute('''
      CREATE TABLE $_parametersbTableName(
        $jobTableId $integerType,
        $parametersTableId $idType,
        ${ParameterDefinitionsFields.type} $textType,
        ${ParameterDefinitionsFields.defaultValue} $textType,
        ${ParameterDefinitionsFields.description} $textType,
        ${ParameterDefinitionsFields.choices} $textType,
        ${ParameterDefinitionsFields.name} $textType,
        'FOREIGN KEY ($jobTableId) REFERENCES $_jobTableName($jobTableId)'
      )
    ''');
  }
}

abstract class JenkinsDatabaseConstants {
  static const String filePath = 'jenkins_database.db';
  static const int databaseVersion = 1;
  static const String jobTableName = 'JenkinsBuildData';
  static const String parametersbTableName = 'ParametersData';
}
