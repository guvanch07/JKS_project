import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/base/bloc_state.dart';
import 'package:presentation/base/stream_platform_stack_content.dart';
import 'package:presentation/core/helpers/primary_button.dart';
import 'package:presentation/core/theme/style_text.dart';
import 'package:presentation/core/theme/theme_app.dart';
import 'package:presentation/navigator/app_navigator.dart';
import 'package:presentation/navigator/base_arguments.dart';
import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screen/build_screen/bloc/bloc.dart';
import 'package:presentation/screen/build_screen/bloc/bloc_data.dart';
import 'package:presentation/screen/home/home.dart';
import 'package:presentation/screen/main/main.dart';
import 'package:presentation/widget/app_text_form_field.dart';

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
    this.jobName,
  }) : super(key: key);

  final String? jobName;

  @override
  State<BuildPage> createState() => _BuildPageState();
}

class _BuildPageState extends BlocState<BuildPage, BuildBloc> {
  @override
  void initState() {
    super.initState();
    bloc.initState();
    bloc.getProperty(widget.jobName);
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
      body: StreamPlatformStackContent(
        dataStream: bloc.dataStream,
        children: (blocData) {
          final screenData = blocData.data;
          if (screenData is BuildData) {
            if (screenData.property == null) {
              return const CircularProgressIndicator.adaptive();
            } else {
              // ignore: prefer_is_empty
              if (screenData.property?.length == 0) {
                return BuildWhenEmpty(appLocalizations: appLocalizations);
              } else {
                return _BuildScreen(
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

class _BuildScreen extends StatelessWidget {
  const _BuildScreen({
    Key? key,
    this.tittle,
  }) : super(key: key);
  final String? tittle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainbgc,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => appNavigator.popAndPush(MainPage.page()),
              color: AppColors.textMain,
              icon: const Icon(Icons.arrow_back_ios)),
          elevation: 0,
          title: Text(tittle ?? "build", style: Styles.headline2),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            const BuildToogleButton(),
            const Inputs(),
            const Spacer(),
            SafeArea(child: PrimaryButton(onTap: () {}, text: "Send"))
          ],
        ));
  }
}

class BuildToogleButton extends StatefulWidget {
  const BuildToogleButton({Key? key}) : super(key: key);

  @override
  State<BuildToogleButton> createState() => _BuildToogleButtonState();
}

class _BuildToogleButtonState extends State<BuildToogleButton> {
  final List<bool> _selections = List.generate(2, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 15.0, left: 15),
          child: Text(
            "Build Type",
            style: Styles.headline1,
          ),
        ),
        Center(
          child: ToggleButtons(
              borderColor: Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              selectedColor: Colors.white,
              disabledColor: AppColors.textMain,
              disabledBorderColor: Colors.white,
              fillColor: AppColors.accentGreen,
              highlightColor: Colors.white,
              borderWidth: 0,
              onPressed: ((int index) {
                setState(() {
                  _selections[index] = !_selections[index];
                });
              }),
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    //color: Colors.white,
                    child: const Center(child: Text("1"))),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    //color: Colors.white,
                    child: const Center(child: Text("2"))),
              ],
              isSelected: _selections),
        ),
      ],
    );
  }
}

class Inputs extends StatelessWidget {
  const Inputs({Key? key}) : super(key: key);

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
