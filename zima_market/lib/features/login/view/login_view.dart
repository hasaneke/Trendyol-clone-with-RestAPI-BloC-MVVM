import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zima_market/product/constants/image_paths.dart';
import 'package:zima_market/product/constants/project_colors.dart';
import 'package:zima_market/product/constants/project_paddings.dart';
import 'package:zima_market/product/navigator/app_router.dart';
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
            _LoginAuthForm(
              height: context.height * 0.5,
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginAuthForm extends HookWidget {
  final double height;
  final BuildContext context;
  const _LoginAuthForm({
    required this.height,
    required this.context,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
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
              ProjectTextField(
                hintText: 'Email',
                controller: emailController,
              ),
              ProjectTextField(
                hintText: 'Password',
                controller: passwordController,
                suffixIcon: const Icon(Icons.lock),
              ),
              _iForgotMyPassword(),
              ProjectElevatedButton(name: "Login"),
              _signInMethods(),
              QuestionDoWidget(
                question: 'Not registered yet? ',
                doText: "Register!",
                onTap: () {
                  AutoRouter.of(context).push(const RegisterRoute());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _signInMethods() {
    return Padding(
      padding: ProjectPaddings.primaryPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProjectImage.iconAsset(
            ImagePaths.facebookIcon.path,
            colors: ProjectColors.facebookColor,
          ),
          ProjectImage.iconAsset(
            ImagePaths.googleIcon.path,
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

class QuestionDoWidget extends StatelessWidget {
  String? question;
  String? doText;
  void Function()? onTap;
  QuestionDoWidget({
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
