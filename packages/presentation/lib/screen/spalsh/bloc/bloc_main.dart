import 'package:domain/usecase/token_usecase.dart';
import 'package:presentation/base/base_bloc.dart';
import 'package:presentation/base/impl_base_bloc.dart';
import 'package:presentation/internal/service/analitic_event.dart';
import 'package:presentation/internal/service/analitic_service.dart';
import 'package:presentation/screen/home/main_tab_bar.dart';
import 'package:presentation/screen/login/main_login.dart';

abstract class SplashBloc extends BaseBloc {
  factory SplashBloc(
    AnalyticsService analyticsService,
    TokenUseCase tokenUseCase,
  ) =>
      _SplashBloc(analyticsService, tokenUseCase);

  void navigateToMainPage();
  void navigateToLoginPage();
}

class _SplashBloc extends BlocImpl implements SplashBloc {
  final AnalyticsService _analyticsService;
  final TokenUseCase _getTokenUseCase;
  _SplashBloc(
    this._analyticsService,
    this._getTokenUseCase,
  );

  @override
  void initState() async {
    super.initState();

    final isAuthorized = await _getTokenUseCase();

    if (isAuthorized) {
      _analyticsService.trackCustomEvent(
        event: AnalyticsEvent.mainScreenOpenedEvent,
      );
      navigateToMainPage();
    }
    _analyticsService.trackCustomEvent(
        event: AnalyticsEvent.loginScreenOpenedEvent);
    navigateToLoginPage();
  }

  @override
  void navigateToLoginPage() {
    appNavigator.popAndPush(LoginPage.page());
  }

  @override
  void navigateToMainPage() {
    appNavigator.popAndPush(MainTab.page());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
