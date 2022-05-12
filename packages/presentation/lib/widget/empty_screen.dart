import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/core/utils/path/asset_path.dart';

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
