import 'package:domain/model/propery/api_build_models.dart';
import 'package:domain/repository/base_repository.dart';

abstract class ILocalRepository implements BaseRepository {
  Future<String?> getToken();
  Future<String?> getCrumb();
  Future<String?> getCookie();

  Future<void> saveToken(String token);
  Future<void> saveCrumb(String crumb);
  Future<void> saveCookie(String cookie);

  Future<void> deleteToken();

  Future<ApiBuildDataModel> updateSqfData(ApiBuildDataModel buildDataModel);
  Future<ApiBuildDataModel?> readSqfData(String screenName);
  Future<ApiBuildDataModel> createSqfData(ApiBuildDataModel buildDataModel);
}
