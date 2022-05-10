abstract class ApiHelperCore {
  static const String crumb = 'crumb';
  static const String crumbRequestField = 'crumbRequestField';
  static const String jenkinsCrumb = 'Jenkins-Crumb';
  static const String baseUrl = "http://jenkins-mobile.moneyman.ru/";
  static const String pathUrl = "/api/json?pretty=true";
  static const String pathToken = "/api/json";
  static const String job = "/job/";
  static const tokenKey = 'token';
  static const loginName = 'login';
  static const passwordName = 'password';
  static const post = 'post';
  static String urlCrumbIssuer =
      'http://jenkins-mobile.moneyman.ru/crumbIssuer/api/json';

  static String urlBuildToPost(String viewName, String jobName) =>
      '/view/$viewName/job/$jobName/buildWithParameters/api/json?pretty=true';
}
