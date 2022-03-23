import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/base/bloc_state.dart';
import 'package:presentation/base/stream_platform_stack_content.dart';
import 'package:presentation/screen/card/card_screen.dart';
import 'package:presentation/screen/home/home_bloc.dart';
import 'package:presentation/screen/home/home_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState<D> extends BlocState<MyHomePage, HomeBloc> {
  @override
  void initState() {
    super.initState();
    bloc.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamPlatformStackContent(
      dataStream: bloc.dataStream,
      children: (blocData) {
        final screenData = blocData.data;
        if (screenData is HomeData) {
          return SafeArea(
              child: ListView.separated(
            itemBuilder: (context, index) {
              return CardItem(
                countryName:
                    screenData.fetchingData?.jobs[index].name ?? "empty",
                //flag: screenData.cardModel?.jobs[index].color ?? "nothing",
                maintitlle:
                    screenData.fetchingData?.jobs[index].primaryViewClass ??
                        "nothing",
              );
            },
            itemCount: screenData.fetchingData?.jobs.length ?? 1,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 5);
            },
          ));
        }
      },
    );
  }
}
