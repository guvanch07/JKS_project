import 'package:domain/core/extension/title_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/core/base_bloc/bloc_data.dart';
import 'package:presentation/core/base_bloc/bloc_state.dart';
import 'package:presentation/core/theme/style_text.dart';
import 'package:presentation/screen/home/bloc/home_data.dart';
import 'package:presentation/widgets/card/card_screen.dart';

import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.project}) : super(key: key);

  final TitleOfTabBar project;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BlocState<HomePage, HomeBloc> {
  @override
  void initState() {
    super.initState();
    bloc.initJobs(widget.project);
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
            if (screenData.jobs!.isEmpty) {
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
          SvgPicture.asset("assets/svg/catty.svg"),
          const Text(
            "Сорян, ничего не нашли",
            style: headline1,
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
              color: screenData.jobs?[index].color ?? "empty",
            ),
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemCount: screenData.jobs?.length ?? 0);
  }
}
