import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectIconImage extends SvgPicture {
  final String assetName;
  Color? colors;
  ProjectIconImage.asset(this.assetName, {Key? key, this.colors})
      : super.asset(key: key, assetName, height: 35, color: colors);
}
