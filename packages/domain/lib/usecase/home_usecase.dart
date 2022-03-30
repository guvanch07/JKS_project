import 'package:domain/core/extension/title_exctention.dart';
import 'package:domain/model/job.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:domain/usecase/base_usecase.dart';

class HomeUseCase implements UseCaseParams<TitleOfTabBar, List<Job>?> {
  final INetworkRepository _repository;

  HomeUseCase(this._repository);

  @override
  List<Job>? call(TitleOfTabBar project) => _repository.getdata?.data
      ?.map((element) => Job.fromJson(element))
      .where((job) => job.name!.contains(TitleExt(project).projectName))
      .toList();

  @override
  void dispose() {
    _repository.dispose();
  }
}
