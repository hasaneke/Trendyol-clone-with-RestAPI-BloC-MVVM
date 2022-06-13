import 'package:flutter/material.dart';
import 'package:zima_market/product/constants/project_paddings.dart';

class ProjectTextField extends StatelessWidget {
  final String? hintText;
  final bool? isObsecure;
  const ProjectTextField({
    this.hintText,
    this.isObsecure,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPaddings.primaryPadding,
      child: TextField(
        obscureText: isObsecure ?? false,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
