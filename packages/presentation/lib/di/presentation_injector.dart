import 'package:domain/usecase/get_primary_use_case.dart';
import 'package:domain/usecase/get_views_usecase.dart';
import 'package:domain/usecase/login_usecase.dart';
import 'package:domain/usecase/token_usecase.dart';
import 'package:domain/usecase/validation_usecase.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/internal/service/analitic_event.dart';
import 'package:presentation/internal/service/analitic_service.dart';
import 'package:presentation/navigator/app_navigator.dart';
import 'package:presentation/screen/app/bloc/app_bloc.dart';
import 'package:presentation/screen/home/bloc/home_page/home_bloc.dart';
import 'package:presentation/screen/home/bloc/main_tab_bar/main_tab_bloc.dart';
import 'package:presentation/screen/login/bloc/login_bloc.dart';
import 'package:presentation/screen/mapper/color_mapper.dart';
import 'package:presentation/screen/mapper/error_mapper.dart';
import 'package:presentation/screen/mapper/login_view_mapper.dart';
import 'package:domain/usecase/home_usecase.dart';
import 'package:presentation/screen/mapper/tab_bar_mapper.dart';
import 'package:presentation/screen/spalsh/bloc/bloc_main.dart';

Future<void> initPresentationModule() async {
  final sl = GetIt.I;

  //! ******************************************* mappers *********************************

  sl.registerSingleton<LoginViewMapper>(LoginViewMapper());

  sl.registerSingleton<ErrorMapper>(ErrorMapper());

  sl.registerSingleton<ColorMapper>(ColorMapper());

  sl.registerSingleton<MainViewMapper>(MainViewMapper());

  //! ******************************************* services *******************************

  sl.registerSingleton<FirebaseAnalytics>(FirebaseAnalytics.instance);

  sl.registerSingleton<AnalyticsEvent>(AnalyticsEvent());

  sl.registerSingleton(
    AnalyticsService(
      GetIt.I.get<FirebaseAnalytics>(),
    ),
  );

  //! ******************************************* blocs *************************************

  sl.registerFactory<AppBloc>(() => AppBloc());

  sl.registerFactory(
    () => LoginBloc(
      sl.get<LoginUseCase>(),
      sl.get<LoginValidationUseCase>(),
      sl.get<LoginViewMapper>(),
    ),
  );

  sl.registerFactory(
    () => HomeBloc(
      sl.get<HomeUseCase>(),
    ),
  );

  sl.registerFactory<SplashBloc>(
    () => SplashBloc(
      sl.get<AnalyticsService>(),
      sl.get<TokenUseCase>(),
    ),
  );

  sl.registerFactory<MainBloc>(
    () => MainBloc(
      sl.get<AnalyticsEvent>(),
      sl.get<AnalyticsService>(),
      sl.get<GetViewsUseCase>(),
      sl.get<GetPrimaryViewUseCase>(),
    ),
  );

  //! **************************************** navigation ****************************************
  sl.registerSingleton<AppNavigator>(AppNavigatorImpl());
}
