import 'dart:developer';

import 'package:data/datasource/locally_data/models/struct_of_db.dart';
import 'package:domain/core/exception/exceptions.dart';
import 'package:domain/model/propery/property.dart';
import 'package:domain/repository/local_db_repository.dart';
import 'package:sqflite/sqflite.dart';

class LocalDBRepository implements ILocalDBRepository {
  final Database db;
  LocalDBRepository(
    this.db,
  );

  @override
  Future<void> deleteLocalDBProperty(String nameJob) async {
    try {
      await db.delete(
        'propertyOFJobs',
        where: 'nameJob = ?',
        whereArgs: [nameJob],
      );
    } catch (error) {
      log(error.toString());
      throw CacheException(message: error.toString());
    }
  }

  @override
  Future<List<Property>?> getBuildResponseFromDB(String property) async {
    try {
      final _listLocalProperties = await getLocalBuildResponse(property);
      final List<Map<String, dynamic>> emptyListToAddProperties = [];
      for (var element in _listLocalProperties) {
        final mapLocalProperty = Map.of(element);
        if (mapLocalProperty["choices"] != null) {
          mapLocalProperty["choices"] =
              mapLocalProperty['choices'].split(',') as List<String>;
        }
        emptyListToAddProperties.add(mapLocalProperty);
      }
      return emptyListToAddProperties.map((e) => Property.fromJson(e)).toList();
    } catch (e) {
      log(e.toString());
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getLocalBuildResponse(
      String property) async {
    try {
      return await db.rawQuery(LocalDBStructure.queryGetCacheJob(property));
    } catch (e) {
      log(e.toString());
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> setLocalDBProperties(
      String name, List<Property> listProperisResponse) async {
    try {
      final localProperty = await getLocalBuildResponse(name);
      if (localProperty.isNotEmpty) {
        await deleteLocalDBProperty(name);
      }
      final batch = db.batch();
      final Map<String, Object?> values =
          Map.fromIterable(listProperisResponse);
      values.addAll({'nameJob': name});

      final listProperty = values["choices"] as List;

      values.remove("choices");
      final idRow = await db.insert("propertyJobs", values);

      for (var element in listProperty) {
        batch.insert(
          "propertyOfJobs",
          {'idDetailsJob': idRow, 'variant': element},
        );
      }

      await batch.commit();
    } catch (e) {
      log(e.toString());
      throw CacheException(message: e.toString());
    }
  }
}
