import 'package:presentation/base/bloc_base.dart';
import 'package:presentation/base/bloc_base_impl.dart';
import 'package:presentation/internal/analytics_event.dart';
import 'package:presentation/internal/analytics_service.dart';
import 'package:presentation/screen/main/bloc/main_data.dart';
import 'package:domain/usecase/get_views_usecase.dart';
import 'package:domain/usecase/get_primary_view_usecase.dart';

abstract class MainBloc extends BaseBloc {
  factory MainBloc(
    AnalyticsEvent analyticsEvent,
    AnalyticsService analyticsService,
    GetViewsUseCase getViewsUseCase,
    GetPrimaryViewUseCase getPrimaryViewUseCase,
  ) =>
      _RootBloc(
        analyticsEvent,
        analyticsService,
        getViewsUseCase,
        getPrimaryViewUseCase,
      );

  void trackTabClicked(String tab);
}

class _RootBloc extends BaseBlocImpl implements MainBloc {
  final AnalyticsEvent _analyticsEvent;
  final AnalyticsService _analyticsService;
  final GetViewsUseCase _getViewsUseCase;
  final GetPrimaryViewUseCase _getPrimaryViewUseCase;
  final _screenData = MainData.init();

  _RootBloc(
    this._analyticsEvent,
    this._analyticsService,
    this._getViewsUseCase,
    this._getPrimaryViewUseCase,
  );

  @override
  void initState() async {
    super.initState();

    _screenData.views = await _getViewsUseCase();

    _screenData.primaryViewIndex = _getPrimaryViewUseCase();

    _updateData();
  }

  @override
  void trackTabClicked(String tab) {
    final event = _analyticsEvent.adaptEventName(
      _analyticsEvent.getAnalyticsTabName(tab),
    );

    _analyticsService.trackCustomEvent(
      event: event,
    );
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
    _getViewsUseCase.dispose();
  }
}
