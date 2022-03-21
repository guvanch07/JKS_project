import 'dart:async';

import 'package:flutter/material.dart';

import 'bloc_data.dart';

abstract class BaseBloc<D> {
  final _blocdata = BlocData.init();
  Stream<BlocData<D?>> get dataStream;

  void initState();
  void dispose();
}

class BlocImmpl<D> extends BaseBloc<D> {
  final _data = StreamController<BlocData<D?>>();

  @protected
  void handleData({
    bool? isLoading,
    bool? isValid,
    D? data,
  }) {
    if (!_data.isClosed) {
      _blocdata.updateParams(
        isLoading: isLoading,
        data: data,
      );
      _data.add(_blocdata.copy<D>());
    }
  }

  @override
  Stream<BlocData<D?>> get dataStream => _data.stream;

  @override
  void dispose() {
    _data.close();
  }

  @override
  void initState() {}
}
