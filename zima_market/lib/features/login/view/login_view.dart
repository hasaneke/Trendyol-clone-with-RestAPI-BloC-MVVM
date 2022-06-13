import 'package:flutter/material.dart';
import 'package:zima_market/product/constants/project_colors.dart';
import 'package:zima_market/product/constants/project_paddings.dart';
import 'package:zima_market/product/utility/project_image.dart';
import 'package:zima_market/product/widget/background_widget.dart';
import 'package:kartal/kartal.dart';
import 'package:zima_market/product/widget/project_elevated_button.dart';

import '../../../product/widget/project_text_field.dart';
import '../../../product/widget/small_text_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BackGround(),
            LoginAuthForm(height: context.height * 0.5),
          ],
        ),
      ),
    );
  }
}

class LoginAuthForm extends StatelessWidget {
  final double height;
  const LoginAuthForm({
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 7,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: context.width,
          height: height,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          padding: ProjectPaddings.containerPadding,
          child: Column(
            children: [
              const ProjectTextField(
                hintText: 'Email',
              ),
              const ProjectTextField(
                hintText: 'Password',
              ),
              _iForgotMyPassword(),
              const ProjectElevatedButton(),
              _signInMethods(),
              _notRegisteredYet(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _notRegisteredYet() {
    return Padding(
      padding: ProjectPaddings.primaryPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not registered yet?',
          ),
          SmallTextButton(
            text: ' Register!',
            onTap: () {},
          )
        ],
      ),
    );
  }

  Padding _signInMethods() {
    return Padding(
      padding: ProjectPaddings.primaryPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProjectIconImage.asset(
            'assets/icons/facebook-brands.svg',
            colors: ProjectColors.facebookColor,
          ),
          ProjectIconImage.asset(
            'assets/icons/google-brands.svg',
            colors: ProjectColors.googleColor,
          )
        ],
      ),
    );
  }

  Align _iForgotMyPassword() {
    return Align(
      alignment: Alignment.topRight,
      child: SmallTextButton(
        text: 'I forgot my password',
        onTap: () {},
      ),
    );
  }
}
