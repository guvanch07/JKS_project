import 'package:domain/model/job/job_model.dart';
import 'package:domain/model/views/views_model.dart';

class AuthorizationResponseCache {
  List<Job>? jobs;
  List<JenkinsView>? views;
  late JenkinsView primaryView;
}
