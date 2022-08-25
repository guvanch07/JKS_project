abstract class ApiHelperCore {
  static const String crumbPath = 'crumbIssuer/api/json';

  static const String jenkinsCrumb = 'Jenkins-Crumb';
  static const String baseUrl = "http://jenkins-mobile.moneyman.ru/";
  static const String dataPath = "/api/json?pretty=true";
  static const String apiJson = "/api/json";
  static const String job = "/job/";

  static const post = 'post';

  static String getJobDataPath(String viewName) =>
      'view/' '$viewName/' + dataPath;
  static String getBuildDataPath(String url) => url + apiJson;

  static String getBuildJobUrl(
          {required String viewName, required String jobName}) =>
      '/view/$viewName/job/$jobName/buildWithParameters/api/json';
}
