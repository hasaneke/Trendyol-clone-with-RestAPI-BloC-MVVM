import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:zima_market/product/constants/project_colors.dart';
import 'package:zima_market/product/constants/project_paddings.dart';

class ProjectElevatedButton extends StatelessWidget {
  String? name;
  ProjectElevatedButton({
    this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: ProjectPaddings.primaryPadding,
        width: context.width,
        height: context.height * 0.08,
        child: ElevatedButton(
            style:
                ElevatedButton.styleFrom(primary: ProjectColors.retroNectarine),
            onPressed: () {},
            child: Text(name ?? '')));
  }
}
