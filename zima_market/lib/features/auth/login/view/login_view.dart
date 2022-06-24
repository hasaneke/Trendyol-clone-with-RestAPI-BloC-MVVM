import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zima_market/features/auth/login/bloc/login_bloc.dart';
import 'package:zima_market/features/auth/login/service/login_service.dart';
import 'package:zima_market/product/constants/image_paths.dart';
import 'package:zima_market/product/constants/project_colors.dart';
import 'package:zima_market/product/constants/project_paddings.dart';
import 'package:zima_market/product/navigator/app_router.dart';
import 'package:zima_market/product/service/auth_service.dart';
import 'package:zima_market/product/utility/project_image.dart';
import 'package:zima_market/product/widget/project_background_widget.dart';
import 'package:kartal/kartal.dart';
import 'package:zima_market/product/widget/project_elevated_button.dart';
import 'package:zima_market/product/widget/project_text_field.dart';
import 'package:zima_market/product/widget/question_do_button.dart';
import 'package:zima_market/product/widget/small_text_button.dart';

import 'package:easy_localization/easy_localization.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocProvider<LoginBloc>(
            create: (context) =>
                LoginBloc(service: LoginService(AuthService.instance)),
            child: Stack(
              children: [
                const BackGround(),
                Column(
                  children: [
                    Flexible(flex: 1, child: Container()),
                    Flexible(
                      flex: 6,
                      child: _LoginAuthForm(
                        context: context,
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class _LoginAuthForm extends StatefulHookWidget {
  final BuildContext context;
  const _LoginAuthForm({
    required this.context,
    Key? key,
  }) : super(key: key);

  @override
  State<_LoginAuthForm> createState() => _LoginAuthFormState();
}

class _LoginAuthFormState extends State<_LoginAuthForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Center(
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error.message)));
          } else if (state is LoginComplete) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Login Success')));
          } else if (state is NavigateToRegiserState) {
            AutoRouter.of(context).push(const RegisterRoute());
          }
        },
        builder: (context, state) {
          return Opacity(
            opacity: state is LoginLoadingState ? 0.4 : 1,
            child: IgnorePointer(
              ignoring: state is LoginLoadingState,
              child: Card(
                elevation: 7,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: context.width,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25)),
                  padding: ProjectPaddings.containerPadding,
                  child:
                      _loginForm(emailController, passwordController, context),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Form _loginForm(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProjectTextFormField(
            hintText: "auth.email".tr(),
            controller: emailController,
          ),
          ProjectTextFormField(
            hintText: 'auth.password'.tr(),
            controller: passwordController,
            suffixIcon: const Icon(Icons.lock),
          ),
          _iForgotMyPassword(),
          ProjectElevatedButton(
            name: "auth.login".tr(),
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(SignInEvent(
                    email: emailController.text,
                    password: passwordController.text));
              }
            },
          ),
          _signInMethods(),
          QuestionDoButton(
            question: " ${'auth.not_registered_yet'.tr()}? ",
            doText: "${"auth.register".tr()}!",
            onTap: () {
              context.read<LoginBloc>().add(NavigateToRegisterEvent());
            },
          ),
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
