import 'package:flutter/cupertino.dart';
import 'package:zima_market/product/constants/text_styles.dart';

class ProjectTexts {
  static const passwordDescription = Text.rich(TextSpan(children: [
    TextSpan(
        text: "Your password must be", style: ProjectTextStyles.lightFontStyle),
    TextSpan(
        text: " at lest 7 charachter", style: ProjectTextStyles.boldFontStyle),
    TextSpan(text: " and", style: ProjectTextStyles.lightFontStyle),
    TextSpan(
        text: " at most 15 charachter", style: ProjectTextStyles.boldFontStyle),
    TextSpan(text: " must contain", style: ProjectTextStyles.lightFontStyle),
    TextSpan(
        text: " char and number\n", style: ProjectTextStyles.boldFontStyle),
  ]));
}
