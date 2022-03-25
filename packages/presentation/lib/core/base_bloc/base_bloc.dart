import 'dart:async';

import 'package:presentation/core/base_bloc/bloc_data.dart';

abstract class BaseBloc<D> {
  Stream<BlocData<D?>> get dataStream;

  void initState();

  void dispose();
}
