class PostRequestModel {
  String _jobView = '';
  String _jobName = '';
  final Map<String, dynamic> _queryParameters = {};

  set setJobView(String value) => _jobView = value;
  set setJobName(String value) => _jobName = value;

  String get jobView => _jobView;
  String get jobName => _jobName;
  Map<String, dynamic> get getQueryParameters => _queryParameters;

  void updateQueryParameters({
    required String key,
    required String value,
  }) {
    _queryParameters[key] = value;
  }

  void init() {
    _jobView = '';
    _jobName = '';
    _queryParameters.clear();
  }
}
