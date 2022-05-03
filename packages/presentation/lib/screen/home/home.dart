import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/base/bloc_state.dart';
import 'package:presentation/base/stream_platform_stack_content.dart';
import 'package:presentation/core/utils/path/asset_path.dart';
import 'package:presentation/mapper/color_mapper.dart';
import 'package:presentation/screen/home/bloc/home_bloc.dart';
import 'package:presentation/screen/home/bloc/home_data.dart';
import 'package:presentation/widget/job_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.view}) : super(key: key);

  final String? view;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BlocState<HomePage, HomeBloc> {
  @override
  void initState() {
    super.initState();
    bloc.initState();
    bloc.getJobs(widget.view);
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
          if (screenData is HomeData) {
            if (screenData.jobs == null) {
              return const CircularProgressIndicator.adaptive();
            } else {
              // ignore: prefer_is_empty
              if (screenData.jobs?.length == 0) {
                return BuildWhenEmpty(appLocalizations: appLocalizations);
              } else {
                return _BuildJobs(
                  colorMapper: colorMapper,
                  screenData: screenData,
                  bloc: bloc,
                );
              }
            }
          }
        },
      ),
    );
  }
}

class _BuildJobs extends StatelessWidget {
  const _BuildJobs({
    Key? key,
    required this.colorMapper,
    required this.screenData,
    required this.bloc,
  }) : super(key: key);

  final ColorMapper colorMapper;
  final HomeData screenData;
  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
          decoration: const BoxDecoration(
            color: Color(0xFFF5F5F5),
          ),
          child: ListView.builder(
            itemCount: screenData.jobs?.length,
            itemBuilder: (BuildContext context, int index) {
              return JobCards(
                onTap: () => bloc.navigateToBuildScreeen(index),
                title: screenData.jobs?[index].name,
                color: colorMapper.getColorByName(
                  screenData.jobs?[index].color,
                ),
              );
            },
          ),
        ),
      );
}

class BuildWhenEmpty extends StatelessWidget {
  const BuildWhenEmpty({
    Key? key,
    required this.appLocalizations,
  }) : super(key: key);

  final AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: SvgPicture.asset(AssetPath.cat),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  appLocalizations.buttonLogin,
                ),
              ),
            ],
          ),
        ),
      );
}
