import 'package:data/datasource/locally_data/init/database_sql.dart';
import 'package:domain/model/propery/api_build_models.dart';
import 'package:domain/model/propery/parametrs_def.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDatabase {
  final Database db;
  static const String _jobTableName = JenkinsDatabaseConstants.jobTableName;
  static const String _parametersbTableName =
      JenkinsDatabaseConstants.parametersbTableName;

  SqfliteDatabase({required this.db});

  Future<ApiBuildDataModel> create(ApiBuildDataModel apiBuildDataModel) async {
    final uniqueScreenId = await db.insert(
      _jobTableName,
      apiBuildDataModel.toSqfJson(),
    );

    await _updateBuildDataModel(
      apiBuildDataModel.copy(
        screenId: uniqueScreenId,
      ),
    );

    for (var parameter in apiBuildDataModel.buildData) {
      parameter.screenId = uniqueScreenId;

      final unicParamID = await db.insert(
        _parametersbTableName,
        parameter.toSqfJson(),
      );

      parameter.id = unicParamID;

      await db.update(
        _parametersbTableName,
        parameter.toSqfJson(),
        where: '${ParameterDefinitionsFields.name} = ?',
        whereArgs: [parameter.name],
      );
    }

    return apiBuildDataModel;
  }

  Future<ApiBuildDataModel?> readDatabase(String displayName) async {
    final listWithApiBuildDataMap = await db.query(
      _jobTableName,
      columns: ApiBuildDataFields.fields,
      where: '${ApiBuildDataFields.displayName} = ?',
      whereArgs: [displayName],
    );

    if (listWithApiBuildDataMap.isEmpty) {
      return null;
    }

    final ApiBuildDataModel apiBuildDataModel =
        ApiBuildDataModel.fromSqfJson(listWithApiBuildDataMap.first);

    final int? unicScreenID = apiBuildDataModel.screenId;

    final listWithParameterMap = await db.query(
      _parametersbTableName,
      columns: ParameterDefinitionsFields.fields,
      where: '${ParameterDefinitionsFields.screenId} = ?',
      whereArgs: [unicScreenID],
    );

    final List<ParameterDefinitions> paramsList =
        listWithParameterMap.map((json) {
      return ParameterDefinitions.fromSqfJson(json);
    }).toList();

    return apiBuildDataModel.copy(buildData: paramsList);
  }

  Future<ApiBuildDataModel> update(ApiBuildDataModel apiBuildData) async {
    try {
      await _updateBuildDataModel(apiBuildData);

      await _updateParameterDefinitions(
        apiBuildData.screenId,
        apiBuildData.buildData,
      );

      return apiBuildData;
    } catch (e) {
      return apiBuildData;
    }
  }

  Future<void> delete(ApiBuildDataModel apiBuildDataModel) async {
    await db.delete(
      _jobTableName,
      where: '${ParameterDefinitionsFields.screenId} = ?',
      whereArgs: [apiBuildDataModel.screenId],
    );

    await db.delete(
      _parametersbTableName,
      where: '${ParameterDefinitionsFields.screenId} = ?',
      whereArgs: [apiBuildDataModel.screenId],
    );
  }

  Future<int?> _updateBuildDataModel(
      ApiBuildDataModel apiBuildDataModel) async {
    return await db.update(
      _jobTableName,
      apiBuildDataModel.toSqfJson(),
      where: '${ParameterDefinitionsFields.screenId} = ?',
      whereArgs: [apiBuildDataModel.screenId],
    );
  }

  Future<void> _updateParameterDefinitions(
    int? screenId,
    List<ParameterDefinitions> parameterDefinitions,
  ) async {
    for (var parameter in parameterDefinitions) {
      await db.update(
        _parametersbTableName,
        parameter.toSqfJson(),
        where: '${ParameterDefinitionsFields.id} = ?',
        whereArgs: [parameter.id],
      );
    }
  }
}
