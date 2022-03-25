import 'package:presentation/core/base_bloc/base_bloc.dart';
import 'package:domain/core/extension/title_extension.dart';
import 'package:domain/usecase/home_usecase.dart';
import 'package:presentation/core/base_bloc/bloc_state.dart';
import 'package:presentation/core/base_bloc/impl_base_bloc.dart';
import 'package:presentation/screen/home/bloc/home_data.dart';

abstract class HomeBloc extends BaseBloc {
  void initJobs(TitleOfTabBar title);
  factory HomeBloc(HomeUseCase useCase) => _HomeBloc(useCase);
}

class _HomeBloc extends BlocImpl implements HomeBloc {
  final HomeUseCase _homeUseCase;
  final _screenData = HomeData.init();
  bool _isLoading = false;

  _HomeBloc(this._homeUseCase);

  @override
  void initState() {
    super.initState();
    updateData();
  }

  void updateData() {
    super.handleData(
      isLoading: _isLoading,
      data: _screenData.copy(),
    );
  }

  @override
  void initJobs(TitleOfTabBar title) {
    _screenData.jobs = _homeUseCase(title);
  }

  @override
  void dispose() {
    super.dispose();
    _homeUseCase.dispose();
  }
}
