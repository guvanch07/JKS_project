abstract class IMapper<From, To> {
  To call(From params);
}

class ListToStringMapper implements IMapper<List, String> {
  @override
  String call(List list) => list.join(',');
}

class StringToListMapper implements IMapper<String, List<String>> {
  @override
  List<String> call(String string) => string.split(',');
}
