import 'package:domain/entities/home_step.dart';
import 'package:presentation/bloc/login/home_bloc.dart';

abstract class HomeViewMapper {
  factory HomeViewMapper() => _HomeViewMapper();

  HomeStepFields mapScreenDataToRequest(HomeData screenData);
}

class _HomeViewMapper implements HomeViewMapper {
  @override
  HomeStepFields mapScreenDataToRequest(
    HomeData screenData,
  ) =>
      HomeStepFields(
        screenData.password,
        screenData.email,
      );
}
