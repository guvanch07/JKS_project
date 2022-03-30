import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:presentation/base/bloc_base.dart';
import 'package:presentation/base/bloc_data.dart';

class BlocImpl<D> implements BaseBloc<D> {
  //final appNavigator = GetIt.I.get<AppNavigator>();

  final _blocData = BlocData.init();

  final _data = StreamController<BlocData<D?>>();

  bool isLoading = false;

  @override
  Stream<BlocData<D?>> get dataStream => _data.stream;

  @override
  void dispose() {
    _data.close();
  }

  @protected
  Future<void> launchPayLoad({
    required Function action,
    Function(dynamic)? errorAction,
    bool showLoading = true,
  }) async {
    if (showLoading) {
      handleData(isLoading: true);
    }
    try {
      await action.call();
    } catch (e) {
      errorAction?.call(e);
    } finally {
      if (showLoading) {
        handleData(isLoading: false);
      }
    }
  }

  @protected
  void handleData({
    bool? isLoading,
    bool? isValid,
    D? data,
  }) {
    if (!_data.isClosed) {
      _blocData.updateParams(
        isLoading: isLoading,
        data: data,
      );
      _data.add(_blocData.copy<D>());
    }
  }

  @override
  void initState() {}
}
