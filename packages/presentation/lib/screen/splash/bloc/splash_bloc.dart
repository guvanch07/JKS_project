import 'package:domain/usecase/token_usecase.dart';
import 'package:presentation/base/bloc_base.dart';
import 'package:presentation/base/bloc_base_impl.dart';
import 'package:presentation/internal/analytics_event.dart';
import 'package:presentation/internal/analytics_service.dart';
import 'package:presentation/screen/login/login_main.dart';
import 'package:presentation/screen/main/main.dart';

abstract class SplashBloc extends BaseBloc {
  factory SplashBloc(
    AnalyticsService analyticsService,
    TokenUseCase getTokenUseCase,
  ) =>
      _SplashBloc(
        analyticsService,
        getTokenUseCase,
      );

  void navigateToMainPage();

  void navigateToLoginPage();
}

class _SplashBloc extends BaseBlocImpl implements SplashBloc {
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
    } else {
      _analyticsService.trackCustomEvent(
        event: AnalyticsEvent.loginScreenOpenedEvent,
      );
      navigateToLoginPage();
    }
  }

  @override
  void navigateToLoginPage() {
    appNavigator.popAndPush(
      LoginPage.page(),
    );
  }

  @override
  void navigateToMainPage() {
    appNavigator.popAndPush(
      MainPage.page(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
