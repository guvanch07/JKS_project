import 'package:domain/model/job.dart';

class HomeData {
  List<Job>? jobs;

  HomeData(this.jobs);

  factory HomeData.init() => HomeData(null);

  HomeData copy() => HomeData(jobs);
}
