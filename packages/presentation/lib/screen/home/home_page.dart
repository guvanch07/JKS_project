import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/base/bloc_state.dart';
import 'package:presentation/core/theme/style_text.dart';
import 'package:presentation/core/utils/path/asset_path.dart';
import 'package:presentation/screen/mapper/color_mapper.dart';
import 'package:presentation/widgets/card_screen.dart';
import 'package:get_it/get_it.dart';

import 'bloc/home_page/home_bloc.dart';
import 'bloc/home_page/home_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String? title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BlocState<HomePage, HomeBloc> {
  @override
  void initState() {
    super.initState();
    bloc.getJobs(widget.title);
    bloc.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.dataStream,
        builder: (context, snapshot) {
          final blocData = snapshot.data;
          if (blocData is BlocData && blocData.data is HomeData) {
            final screenData = blocData.data as HomeData;
            if (screenData.jobs == null) {
              return const _DefoultEmptyWidget();
            } else {
              return _BuildInitialState(
                screenData: screenData,
              );
            }
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class _DefoultEmptyWidget extends StatelessWidget {
  const _DefoultEmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AssetPath.assetWhenHasNotData),
          const Text(
            "Сорян, ничего не нашли",
            style: Styles.headline1,
          )
        ],
      ),
    );
  }
}

class _BuildInitialState extends StatelessWidget {
  const _BuildInitialState({
    Key? key,
    required this.screenData,
  }) : super(key: key);
  final HomeData screenData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => CardItem(
            maintitlle: screenData.jobs?[index].name ?? "empty",
            color: GetIt.I
                .get<ColorMapper>()
                .getColorByName(screenData.jobs?[index].color)),
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemCount: screenData.jobs?.length ?? 1);
  }
}
