import 'package:domain/usecase/home_usecase.dart';
import 'package:domain/core/extension/string_extention.dart';
import 'package:presentation/base/bloc_base.dart';
import 'package:presentation/base/bloc_base_impl.dart';
import 'package:presentation/screen/build_screen/ui/main_build_sc.dart';
import 'package:presentation/screen/home/bloc/home_data.dart';

abstract class HomeBloc extends BaseBloc {
  factory HomeBloc(HomeUseCase useCase) => _HomeBloc(useCase);

  void getJobsByView(String? view);
  void navigateToBuildScreeen(int index);
}

class _HomeBloc extends BaseBlocImpl implements HomeBloc {
  final HomeUseCase _homeUseCase;
  final _screenData = HomeData.init();

  _HomeBloc(this._homeUseCase);

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  @override
  void getJobsByView(String? view) async {
    _screenData.jobs = await _homeUseCase(view.orEmpty);
    _updateData();
  }

  void _updateData() {
    super.handleData(
      isLoading: isLoading,
      data: _screenData.copy(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _homeUseCase.dispose();
  }

  @override
  void navigateToBuildScreeen(int index) {
    appNavigator
        .popAndPush(BuildScreen.page(tittle: _screenData.jobs?[index].name));
  }
}
