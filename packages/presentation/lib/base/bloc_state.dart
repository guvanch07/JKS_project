import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/base/bloc_base.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:presentation/mapper/asset_mapper.dart';
import 'package:presentation/mapper/color_mapper.dart';
import 'package:presentation/mapper/error_mapper.dart';

abstract class BlocState<S extends StatefulWidget, B extends BaseBloc>
    extends State<S> {
  @protected
  final B bloc = GetIt.I.get<B>();

  @protected
  final errorMapper = GetIt.I.get<ErrorMapper>();

  @protected
  final colorMapper = GetIt.I.get<ColorMapper>();

  @protected
  final assetMapper = GetIt.I.get<AssetMapper>();

  @protected
  late AppLocalizations appLocalizations;
}
