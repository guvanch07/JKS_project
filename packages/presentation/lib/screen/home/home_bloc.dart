import 'package:domain/usecase/get_registration_use_case.dart';
import 'package:presentation/base/base_bloc.dart';
import 'package:presentation/screen/home/home_data.dart';

abstract class HomeBloc extends BaseBloc {
  factory HomeBloc(
    GetRegistrationStepUseCase getRegistrationStepUseCase,
  ) =>
      _HomeBloc(
        getRegistrationStepUseCase,
      );

  void getRegistration();
}

class _HomeBloc extends BlocImpl implements HomeBloc {
  final GetRegistrationStepUseCase _getRegistrationStepUseCase;

  final _screenData = HomeData.init();

  bool _isLoading = false;

  _HomeBloc(
    this._getRegistrationStepUseCase,
  );
  @override
  void initState() {
    super.initState();
    _updateData();
  }

  @override
  void getRegistration() async {
    _isLoading = true;
    _updateData();

    _screenData.fetchingData = await _getRegistrationStepUseCase();

    _isLoading = false;
    _updateData();
  }

  @override
  void dispose() {
    super.dispose();
    _getRegistrationStepUseCase.dispose();
  }

  void _updateData() {
    super.handleData(
      isLoading: _isLoading,
      data: _screenData.copy(),
    );
  }
}
