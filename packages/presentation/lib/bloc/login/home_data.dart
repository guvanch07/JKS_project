import 'package:domain/usecase/login/get_login_usecase.dart';
import 'package:domain/usecase/login/send_register_usecase.dart';
import 'package:presentation/bloc/login/home_bloc.dart';
import 'package:presentation/bloc/login/view_mapper.dart';
import 'package:presentation/core/bloc/base_bloc.dart';

abstract class HomeBloc extends BaseBloc {
  factory HomeBloc(
    GetRegistrationStepUseCase getRegistrationStepUseCase,
    SendRegistrationStepUseCase sendRegistrationStepUseCase,
    HomeViewMapper homeViewMapper,
  ) =>
      _HomeBloc(
        getRegistrationStepUseCase,
        sendRegistrationStepUseCase,
        homeViewMapper,
      );

  void getRegistration();

  void sendRegistration();

  void onEmailChanged(String email);

  void onPasswordChanged(String password);
}

class _HomeBloc extends BlocImmpl implements HomeBloc {
  final GetRegistrationStepUseCase _getRegistrationStepUseCase;
  final SendRegistrationStepUseCase _sendRegistrationStepUseCase;
  final HomeViewMapper _viewMapper;
  _HomeBloc(
    this._getRegistrationStepUseCase,
    this._sendRegistrationStepUseCase,
    this._viewMapper,
  );
  final _screenData = HomeData.init();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  @override
  void getRegistration() async {
    _isLoading = true;
    _screenData.registrationStep = "Loading";
    _updateData();

    _screenData.registrationStep = await _getRegistrationStepUseCase();

    _isLoading = false;
    _updateData();
  }

  @override
  void onEmailChanged(String email) {
    _screenData.registrationStep = email;
  }

  @override
  void onPasswordChanged(String password) {
    _screenData.password = password;
  }

  @override
  void sendRegistration() async {
    _screenData.registrationStep = "loading";
    _updateData();
    final request = _viewMapper.mapScreenDataToRequest(_screenData);
    await _sendRegistrationStepUseCase(request);
    _screenData.registrationStep = "Succses";
    _updateData();
  }

  @override
  void dispose() {
    _getRegistrationStepUseCase.dispose();
    super.dispose();
  }

  void _updateData() {
    super.handleData(
      isLoading: _isLoading,
      data: _screenData.copy(),
    );
  }
}
