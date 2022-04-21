import 'package:domain/model/job.dart';

class AuthorizationResponseCache {
  List<Job>? jobs;
  List<JenkinsView>? views;
  late JenkinsView primaryView;
}
