import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:zima_market/product/constants/project_colors.dart';

class SmallTextButton extends StatelessWidget {
  String? text;
  void Function()? onTap;
  SmallTextButton({
    this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text!,
        style: context.textTheme.button!
            .copyWith(color: ProjectColors.retroNectarine),
      ),
    );
  }
}
