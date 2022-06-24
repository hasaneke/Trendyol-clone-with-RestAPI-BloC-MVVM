import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kartal/kartal.dart';
import 'package:zima_market/features/auth/register/bloc/register_bloc.dart';
import 'package:zima_market/features/auth/register/service/register_service.dart';
import 'package:zima_market/product/constants/image_paths.dart';
import 'package:zima_market/product/constants/project_colors.dart';
import 'package:zima_market/product/constants/project_paddings.dart';
import 'package:zima_market/product/constants/project_texts.dart';
import 'package:zima_market/product/constants/text_styles.dart';
import 'package:zima_market/product/navigator/app_router.dart';
import 'package:zima_market/product/service/auth_service.dart';
import 'package:zima_market/product/utility/project_image.dart';
import 'package:zima_market/product/widget/project_background_widget.dart';
import 'package:zima_market/product/widget/project_elevated_button.dart';
import 'package:zima_market/product/widget/project_text_field.dart';
import 'package:zima_market/product/widget/question_do_button.dart';

class RegisterView extends HookWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) =>
            RegisterBloc(RegisterService(AuthService.instance)),
        child: Stack(
          children: [
            const BackGround(),
            Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(),
                ),
                Flexible(flex: 13, child: _RegisterAuthForm()),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _RegisterAuthForm extends StatelessWidget {
  _RegisterAuthForm({Key? key}) : super(key: key);
  final emailController = useTextEditingController();
  final passwordController = useTextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 7,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: context.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          padding: ProjectPaddings.containerPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProjectTextFormField(
                hintText: 'Email',
                controller: emailController,
              ),
              ProjectTextFormField(
                hintText: 'Password',
                controller: passwordController,
                suffixIcon: const Icon(Icons.lock),
              ),
              Container(
                  width: double.infinity,
                  color: ProjectColors.cascadingWhite,
                  child: ProjectTexts.passwordDescription),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Gender (Optional)",
                  style:
                      ProjectTextStyles.lightFontStyle.copyWith(fontSize: 15),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: _FlatElevatedButton(
                      name: 'Female',
                    ),
                  ),
                  Expanded(
                      child: _FlatElevatedButton(
                    name: 'Male',
                  ))
                ],
              ),
              ProjectElevatedButton(
                name: "Register",
                onPressed: () async {},
              ),
              _signInMethods(),
              QuestionDoButton(
                question: "Are you a member? ",
                doText: "Login!",
                onTap: () {
                  AutoRouter.of(context).pop(const LoginRoute());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Padding _signInMethods() {
  return Padding(
    padding: ProjectPaddings.primaryPadding,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ProjectImage.iconAsset(
          ProjectImagePaths.facebookIcon.path,
          colors: ProjectColors.facebookColor,
        ),
        ProjectImage.iconAsset(
          ProjectImagePaths.googleIcon.path,
          colors: ProjectColors.googleColor,
        )
      ],
    ),
  );
}

class _FlatElevatedButton extends StatelessWidget {
  String? name;
  _FlatElevatedButton({
    this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          elevation: 0, primary: ProjectColors.cascadingWhite),
      child: Text(
        name ?? '',
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
      ),
    );
  }
}
