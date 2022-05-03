import 'package:domain/model/propery/property.dart';

class BuildData {
  List<Property>? property;

  BuildData(this.property);

  factory BuildData.init() => BuildData(null);

  BuildData copy() => BuildData(property);
}
