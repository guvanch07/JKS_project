import 'package:presentation/base/base_bloc.dart';
import 'package:domain/usecase/home_usecase.dart';
import 'package:presentation/base/impl_base_bloc.dart';
import 'package:presentation/screen/home/bloc/home_page/home_data.dart';
import 'package:presentation/core/utils/string_exctention.dart';

abstract class HomeBloc extends BaseBloc {
  void getJobs(String? view);
  factory HomeBloc(HomeUseCase useCase) => _HomeBloc(useCase);
}

class _HomeBloc extends BlocImpl implements HomeBloc {
  final HomeUseCase _homeUseCase;
  final _screenData = HomeData.init();

  _HomeBloc(this._homeUseCase);

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  void _updateData() {
    super.handleData(
      isLoading: isLoading,
      data: _screenData.copy(),
    );
  }

  @override
  void getJobs(String? view) async {
    _screenData.jobs = await _homeUseCase(view.orEmpty);
    _updateData();
  }

  @override
  void dispose() {
    super.dispose();
    _homeUseCase.dispose();
  }
}
