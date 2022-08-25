import 'package:domain/mapper/base_mapper.dart';
import 'package:domain/model/propery/parametrs_def.dart';

class ParameterDefinitionsMapper
    implements IMapper<List<dynamic>, List<ParameterDefinitions>> {
  static const String _classWithParameters =
      'hudson.model.ParametersDefinitionProperty';
  static const String _parametersKey = 'parameterDefinitions';

  @override
  List<ParameterDefinitions> call(List<dynamic> property) {
    final List<dynamic> parameterDefinitions = property.firstWhere(
        (item) => item['_class'] == _classWithParameters)[_parametersKey];

    return parameterDefinitions
        .map(
          (params) => ParameterDefinitions.fromJson(params),
        )
        .toList();
  }
}
