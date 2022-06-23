import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zima_market/product/constants/image_paths.dart';
import 'package:zima_market/product/constants/project_colors.dart';
import 'package:zima_market/product/navigator/app_router.dart';
import 'package:zima_market/product/utility/project_image.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      AutoRouter.of(context).push(const LoginRoute());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          ProjectColors.retroNectarine,
          ProjectColors.algerianCoral,
        ]),
      ),
      child: Center(
        child:
            ProjectImage.iconAsset(ProjectImagePaths.trendyolDisplayIcon.path),
      ),
    );
  }
}
