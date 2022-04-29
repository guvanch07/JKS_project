import 'package:flutter/material.dart';
import 'package:presentation/core/helpers/primary_button.dart';
import 'package:presentation/core/theme/style_text.dart';
import 'package:presentation/core/theme/theme_app.dart';
import 'package:presentation/navigator/app_navigator.dart';
import 'package:presentation/navigator/base_arguments.dart';
import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screen/main/main.dart';
import 'package:presentation/widget/app_text_form_field.dart';
import 'package:get_it/get_it.dart';

final appNavigator = GetIt.I.get<AppNavigator>();

class BuildScreen extends StatelessWidget {
  static const routeName = '/BuildPage';

  static BasePage page({BaseArguments? arguments, String? tittle}) => BasePage(
        key: const ValueKey(routeName),
        name: routeName,
        arguments: arguments,
        builder: (context) => BuildScreen(tittle: tittle),
      );

  const BuildScreen({
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
