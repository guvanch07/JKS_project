import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/base/bloc_base.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:presentation/mapper/error_mapper.dart';
// import 'package:presentation/styles/text_styles.dart';

abstract class BlocState<S extends StatefulWidget, B extends BaseBloc>
    extends State<S> {
  @protected
  final B bloc = GetIt.I.get<B>();

  // @protected
  // final errorMapper = GetIt.I.get<ErrorMapper>();

  // @protected
  // final textStyles = GetIt.I.get<TextStyles>();

  // @protected
  // late AppLocalizations appLocalizations;
}
