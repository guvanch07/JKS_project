import 'package:data/core/api_key.dart';
import 'package:data/core/local_helper.dart';
import 'package:data/datasource/locally_data/db/data_base.dart';
import 'package:domain/model/propery/api_build_models.dart';
import 'package:domain/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository implements ILocalRepository {
  final SharedPreferences _prefs;
  final SqfliteDatabase _sqf;

  LocalRepository(
    this._prefs,
    this._sqf,
  );

  //** SharedPreferences repository */

  //** GET  */
  @override
  Future<String?> getToken() async => _prefs.getString(
        SharedPreferencesConstants.tokenKey,
      );

  @override
  Future<String?> getCrumb() async => _prefs.getString(
        SharedPreferencesConstants.crumbKey,
      );

  @override
  Future<String?> getCookie() async => _prefs.getString(
        SharedPreferencesConstants.cookieKey,
      );

  //** SAVE  */
  @override
  Future<void> saveToken(String token) async => _prefs.setString(
        SharedPreferencesConstants.tokenKey,
        token,
      );

  @override
  Future<void> saveCrumb(String crumb) async => _prefs.setString(
        SharedPreferencesConstants.crumbKey,
        crumb,
      );

  @override
  Future<void> saveCookie(String cookie) async => _prefs.setString(
        SharedPreferencesConstants.cookieKey,
        cookie,
      );

  //** DELETE  */
  @override
  Future<void> deleteToken() async => _prefs.remove(
        SharedPreferencesConstants.tokenKey,
      );

  //** Sqflite repository */

  @override
  Future<ApiBuildDataModel> updateSqfData(
    ApiBuildDataModel apiBuildDataModel,
  ) async {
    final updatedModel = await _sqf.update(apiBuildDataModel);

    return updatedModel;
  }

  @override
  Future<ApiBuildDataModel?> readSqfData(
    String screenName,
  ) async =>
      _sqf.readDatabase(screenName);

  @override
  Future<ApiBuildDataModel> createSqfData(
    ApiBuildDataModel apiBuildDataModel,
  ) async =>
      _sqf.create(apiBuildDataModel);

  @override
  void dispose() {}
}
