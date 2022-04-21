import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/base/base_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:presentation/screen/mapper/error_mapper.dart';

abstract class BlocState<S extends StatefulWidget, B extends BaseBloc>
    extends State<S> {
  @protected
  final B bloc = GetIt.I.get<B>();
  @protected
  final errorMapper = GetIt.I.get<ErrorMapper>();

  @protected
  AppLocalizations? appLocalizations;
}
