import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/organism/showcase_card/showcase_banner.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class NotificationDetailView extends StatefulWidget {
  static const routeName = 'notification-detail-screen';

  const NotificationDetailView({super.key});

  @override
  State<NotificationDetailView> createState() => _NotificationDetailViewState();
}

class _NotificationDetailViewState extends State<NotificationDetailView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: buttonBottom(),
      body: AppNestedScrollView(
        body: body(),
        title: appBar(),
      ),
    );
  }

  Widget appBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppIconButton(
          icon: const Icon(Icons.arrow_back),
          buttonColor: AppColors.transparent,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        Text(
          'Detail Notifikasi',
          style: AppTextStyle.bold(size: 24),
        ),
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        banner(),
        SizedBox(height: AppSizes.padding),
        headline(),
        SizedBox(height: AppSizes.padding),
        richText(),
        SizedBox(height: AppSizes.padding),
        text(),
        SizedBox(height: AppSizes.padding),
        richText(),
        SizedBox(height: AppSizes.padding),
      ],
    );
  }

  Widget banner() {
    return BannerCard();
  }

  Widget headline() {
    return Text(
      'Dapatkan Diskon Gratis Ongkir Hanya Untul Hari ini',
      style: AppTextStyle.bold(size: 24),
    );
  }

  Widget richText() {
    return Text(
      'Lorem ipsum dolor sit amet consectetur. Diam fermentum sed tellus porttitor molestie maecenas rhoncus tincidunt volutpat. Est tristique enim pellentesque scelerisque neque in ipsum turpis in. Sem adipiscing in amet scelerisque pretium. Orci nisi.',
      style: AppTextStyle.medium(size: 14),
    );
  }

  Widget text() {
    return Text(
      'Lolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut ',
      style: AppTextStyle.medium(size: 14),
    );
  }

  Widget buttonBottom() {
    return SizedBox(
      height: 100,
      child: AppCardContainer(
        backgroundColor: AppColors.transparent,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: AppColors.blueLv4,
            offset: Offset(0, 4),
            blurRadius: 24,
            spreadRadius: -18,
          ),
        ],
        child: AppButton(
          text: 'Kembali',
          rounded: true,
          textColor: AppColors.primary,
          buttonColor: AppColors.blueLv5,
          onTap: () {
            // TODO
          },
        ),
      ),
    );
  }
}
