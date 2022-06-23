import 'package:flutter/material.dart';
import 'package:zima_market/product/constants/project_paddings.dart';
import 'package:zima_market/product/widget/small_text_button.dart';

class QuestionDoButton extends StatelessWidget {
  String? question;
  String? doText;
  void Function()? onTap;
  QuestionDoButton({
    required this.question,
    required this.doText,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPaddings.primaryPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question ?? ' ',
          ),
          SmallTextButton(
            text: doText,
            onTap: onTap,
          )
        ],
      ),
    );
  }
}
