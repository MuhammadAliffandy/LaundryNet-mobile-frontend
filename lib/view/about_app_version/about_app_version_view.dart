import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_image.dart';
import 'package:alvamind_library/widget/molecule/app_expansion_list_tile.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';
import 'package:alvamind_library/widget/organism/terms_condition_list/terms_condition_list.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class AboutAppVersionView extends StatefulWidget {
  static const routeName = '/about-app-version-screen';

  const AboutAppVersionView({super.key});

  @override
  State<AboutAppVersionView> createState() => _AboutAppVersionViewState();
}

class _AboutAppVersionViewState extends State<AboutAppVersionView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.blueLv1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(),
        backgroundColor: AppColors.blueLv1,
        elevation: 0,
      ),
      body: body(),
    );
  }

  Widget appBar() {
    return AppLongCard(
      backgroundColor: AppColors.transparent,
      padding: EdgeInsets.zero,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppIconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
              ),
              buttonColor: AppColors.transparent,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Text(
              'About & App Version',
              style: AppTextStyle.bold(
                size: 24,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: AppSizes.padding),
            AppIconButton(
              icon: const Icon(
                Icons.pending_outlined,
                color: AppColors.white,
              ),
              buttonColor: AppColors.transparent,
              onTap: () {},
            ),
            const SizedBox(
              width: 12,
            )
          ],
        ),
      ],
    );
  }

  Widget body() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: AppSizes.padding * 2),
            headLine(),
            SizedBox(height: AppSizes.padding * 2),
            privacyPolicyPanel(),
            SizedBox(height: AppSizes.padding * 1.5),
            termsOfServicePanel(),
            SizedBox(height: AppSizes.padding * 1.5),
            linkedText(),
            SizedBox(height: AppSizes.padding * 1.5),
          ],
        ),
      ),
    );
  }

  Widget headLine() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AppImage(
          image: AppAssets.info,
          imgProvider: ImgProvider.assetImage,
          width: 150,
          height: 150,
        ),
        SizedBox(height: AppSizes.padding * 2),
        textAbout('LaundryNet', 'V21.0(12345)'),
        SizedBox(height: AppSizes.padding * 2),
        textAbout('Nama Perangkat', 'iPhone 14 Pro Max'),
      ],
    );
  }

  Widget privacyPolicyPanel() {
    return AppExpansionListTile(
      backgroundColor: AppColors.white,
      boxShadow: const [
        BoxShadow(
          color: AppColors.transparent,
        )
      ],
      title: 'Privacy Policy',
      paddingChild: EdgeInsets.all(AppSizes.padding),
      children: const [
        TermsConditionList(
          withHeadTitle: false,
          title: [
            '1. Lorep Ipsum ',
            '2. Lorep Ipsum ',
            '3. Lorep Ipsum ',
            '4. Lorep Ipsum ',
          ],
          subtitle: [
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua incididunt ut labore et dolore magna aliqua.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua incididunt ut labore et dolore magna aliqua.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua incididunt ut labore et dolore magna aliqua.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua incididunt ut labore et dolore magna aliqua.',
          ],
        ),
      ],
    );
  }

  Widget termsOfServicePanel() {
    return AppExpansionListTile(
      backgroundColor: AppColors.white,
      boxShadow: const [
        BoxShadow(
          color: AppColors.transparent,
        )
      ],
      title: 'Terms Of Service',
      paddingChild: EdgeInsets.all(AppSizes.padding),
      children: const [
        TermsConditionList(
          withHeadTitle: false,
          title: [
            '1. Lorep Ipsum ',
            '2. Lorep Ipsum ',
            '3. Lorep Ipsum ',
            '4. Lorep Ipsum ',
          ],
          subtitle: [
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua incididunt ut labore et dolore magna aliqua.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua incididunt ut labore et dolore magna aliqua.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua incididunt ut labore et dolore magna aliqua.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua incididunt ut labore et dolore magna aliqua.',
          ],
        ),
      ],
    );
  }

  Widget linkedText() {
    return Text(
      'Dibuat Oleh www.ideaver,agency',
      style: AppTextStyle.medium(
        size: 16,
        color: AppColors.white,
      ),
    );
  }

  Widget textAbout(
    String title,
    String subtitle,
  ) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyle.bold(
            size: 18,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: AppSizes.padding),
        Text(
          subtitle,
          style: AppTextStyle.medium(
            size: 16,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
