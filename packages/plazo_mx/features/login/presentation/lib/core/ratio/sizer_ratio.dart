import 'package:flutter/material.dart';

const int kMockupHeight = 667;
const int kMockupWidth = 375;
const double kPadding = 16;

double getWidthRatio(BuildContext context) =>
    MediaQuery.of(context).size.width / kMockupWidth;

double getHeightRatio(BuildContext context) =>
    MediaQuery.of(context).size.height / kMockupHeight;