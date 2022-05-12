import 'package:domain/model/propery/property.dart';

abstract class ILocalDBRepository {
  Future<List<Map<String, dynamic>>> getLocalBuildResponse(String job);
  Future<List<Property>?> getBuildResponseFromDB(String property);

  Future<void> setLocalDBProperties(
    String property,
    List<Property> listProperisResponse,
  );

  Future<void> deleteLocalDBProperty(String nameJob);
}
