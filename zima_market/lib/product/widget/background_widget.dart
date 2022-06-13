import 'package:flutter/material.dart';
import 'package:zima_market/product/constants/project_colors.dart';
import 'package:kartal/kartal.dart';

class BackGround extends StatelessWidget {
  const BackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                ProjectColors.retroNectarine,
                ProjectColors.algerianCoral,
              ]),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Text(
                        'zima market',
                        style: context.textTheme.displaySmall,
                      ),
                      Text('Everything you are looking for...',
                          style: context.textTheme.bodyText1!
                              .copyWith(color: Colors.white))
                    ],
                  )),
            ),
          ),
        ),
        Flexible(
          flex: 6,
          child: Container(
            color: ProjectColors.backgroundColor,
          ),
        ),
      ],
    );
  }
}
