import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectImage extends SvgPicture {
  final String assetName;
  Color? colors;
  ProjectImage.iconAsset(this.assetName, {Key? key, this.colors})
      : super.asset(key: key, assetName, height: 35, color: colors);
  ProjectImage.imageAsset(this.assetName, [Key? key, this.colors])
      : super.asset(key: key, assetName, height: 80, color: colors);
}
