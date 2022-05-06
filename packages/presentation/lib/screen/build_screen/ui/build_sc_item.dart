import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/base/bloc_state.dart';
import 'package:presentation/base/stream_platform_stack_content.dart';
import 'package:presentation/core/helpers/primary_button.dart';
import 'package:presentation/core/theme/style_text.dart';
import 'package:presentation/core/theme/theme_app.dart';
import 'package:presentation/mapper/build_mapper/build_mapper.dart';
import 'package:presentation/navigator/app_navigator.dart';
import 'package:presentation/navigator/base_arguments.dart';
import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screen/build_screen/bloc/bloc_build.dart';
import 'package:presentation/screen/build_screen/bloc/bloc_build_data.dart';
import 'package:presentation/screen/main/main.dart';
import 'package:presentation/widget/empty_screen.dart';
import 'package:presentation/widget/text_fields/app_text_form_field.dart';

class BuildPage extends StatefulWidget {
  final String? title;

  static const routeName = '/BuildPage';

  static BasePage page({BaseArguments? arguments, String? tittle}) => BasePage(
        key: const ValueKey(routeName),
        name: routeName,
        arguments: arguments,
        builder: (context) => BuildPage(title: tittle),
      );

  const BuildPage({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  State<BuildPage> createState() => _BuildPageState();
}

class _BuildPageState extends BlocState<BuildPage, BuildBloc> {
  @override
  void initState() {
    super.initState();
    bloc.initState();
    bloc.getProperty(widget.title);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.mainbgc,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => appNavigator.popAndPush(MainPage.page()),
            color: AppColors.textMain,
            icon: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
        title: Text(widget.title ?? "build", style: Styles.headline2),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: StreamPlatformStackContent(
        dataStream: bloc.dataStream,
        children: (blocData) {
          final screenData = blocData.data;
          if (screenData is BuildData) {
            if (screenData.property == null) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else {
              // ignore: prefer_is_empty
              if (screenData.property?.length == 0) {
                return BuildWhenEmpty(appLocalizations: appLocalizations);
              } else {
                return _BuildScreen(
                  appLocalizations: appLocalizations,
                  blocData: screenData,
                  tittle: widget.title,
                );
              }
            }
          }
        },
      ),
    );
  }
}

final appNavigator = GetIt.I.get<AppNavigator>();
final BuildMapper _mainViewMapper = GetIt.I.get<BuildMapper>();

class _BuildScreen extends StatelessWidget {
  const _BuildScreen({
    Key? key,
    this.tittle,
    required this.blocData,
    this.appLocalizations,
  }) : super(key: key);
  final String? tittle;
  final BuildData blocData;
  final AppLocalizations? appLocalizations;

  @override
  Widget build(BuildContext context) {
    final _callWidgetsFromMapper = _mainViewMapper.mapPropertyText(
        blocData.property, blocData.onChangeValue);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: _callWidgetsFromMapper.length,
                itemBuilder: (context, index) {
                  return _callWidgetsFromMapper[index];
                })),
        SafeArea(
          child: PrimaryButton(
            onTap: () {},
            text: appLocalizations?.buttonLogin ?? "post",
          ),
        ),
      ],
    );
  }
}

class Inputs extends StatelessWidget {
  const Inputs({
    Key? key,
    required this.buildData,
  }) : super(key: key);
  final BuildData buildData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text("Input 1", style: Styles.headline2),
        ),
        AppTextField(
          isSuffixExsist: false,
          obscure: false,
          text: 'input1',
        ),
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text("Input 2", style: Styles.headline2),
        ),
        AppTextField(
          isSuffixExsist: false,
          obscure: false,
          text: 'input2',
        ),
      ],
    );
  }
}
