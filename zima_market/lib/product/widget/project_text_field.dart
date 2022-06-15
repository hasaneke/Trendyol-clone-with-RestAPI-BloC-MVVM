import 'package:flutter/material.dart';
import 'package:zima_market/product/constants/project_paddings.dart';

class ProjectTextField extends StatelessWidget {
  final String? hintText;
  final bool? isObsecure;
  final TextEditingController? controller;
  final Icon? suffixIcon;
  const ProjectTextField({
    this.hintText,
    this.isObsecure,
    this.suffixIcon,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPaddings.primaryPadding,
      child: TextField(
        controller: controller,
        obscureText: isObsecure ?? false,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
