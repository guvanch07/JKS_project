import 'package:domain/model/job/job_model.dart';

class HomeData {
  List<Job>? jobs;

  HomeData(this.jobs);

  factory HomeData.init() => HomeData(null);

  HomeData copy() => HomeData(jobs);
}
