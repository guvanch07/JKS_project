import 'package:collection/collection.dart';
import 'package:domain/mapper/property_mapper.dart';
import 'package:domain/model/base/property_base_response.dart';
import 'package:get_it/get_it.dart';

class ApiPropertyResponse implements PropertyBaseResponse {
  ApiPropertyResponse(
    this.jobProperty,
  );

  @override
  final List<dynamic>? jobProperty;

  static ApiPropertyResponse? fromJson(dynamic data) {
    if (data == null || data.isEmpty) {
      return null;
    }

    final List property = data['property'];
    final Map parameterDefinitions = property.firstWhereOrNull(
      (element) => element.containsKey('parameterDefinitions'),
    );

    final List listParameterDefinitions =
        parameterDefinitions['parameterDefinitions'];

    GetIt.I
        .get<PropertyApiMapper>()
        .listConverterToMap(listParameterDefinitions);

    //! in ststic method i didnt cant pass PropertyApiMapper from constructor
    //!instance member cannot be accessed from static method

    return null;
  }
}
