import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_logo.dart';
import 'package:alvamind_library/widget/atom/app_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_text_style.dart';

import '../../app/theme/app_colors.dart';

class SplashView extends StatefulWidget {
  static const routeName = '/splash-screen';

  const SplashView({
    super.key,
  });

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: body(),
      bottomNavigationBar: SizedBox(
        height: 140,
        child: Padding(
          padding: EdgeInsets.only(bottom: AppSizes.padding * 2),
          child: const AppProgressIndicator(
            showMessage: false,
            size: 80,
          ),
        ),
      ),
    );
  }

  Widget body() {
    return Center(
      child: AppLogo(
        title: 'LaundryNet',
        image: AppAssets.logoCircle,
        withText: true,
        size: 60,
        titleStyle: AppTextStyle.bold(
          size: 40,
          color: AppColors.black,
        ),
      ),
    );
  }
}
