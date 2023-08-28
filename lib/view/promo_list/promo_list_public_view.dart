import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_divider.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/organism/promo_card/promo_card.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class PromoListPublicView extends StatefulWidget {
  static const viewAsPublic = '/promo-list-public-screen';

  const PromoListPublicView({super.key});

  @override
  State<PromoListPublicView> createState() => _PromoListPublicViewState();
}

class _PromoListPublicViewState extends State<PromoListPublicView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: bottomButton(),
      body: AppNestedScrollView(
        body: body(),
        title: appBar(),
      ),
    );
  }

  Widget appBar() {
    return AppLongCard(
      padding: EdgeInsets.only(right: AppSizes.padding / 1.5),
      borderRadius: BorderRadius.circular(0),
      backgroundColor: AppColors.white,
      children: [
        Row(
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
              'Promo List',
              style: AppTextStyle.bold(size: 24),
            ),
          ],
        ),
        AppIconButton(
          icon: const Icon(
            CustomIcon.notificationIcon,
            color: AppColors.primary,
          ),
          buttonColor: AppColors.transparent,
          onTap: () {},
        ),
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        promoCardList(),
        SizedBox(height: AppSizes.padding * 4)
      ],
    );
  }

  Widget promoCardList() {
    return AppColumnInk(
      children: [
        ...List.generate(5, (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: AppSizes.padding),
            child: PromoCard(
              image: AppAssets.warning,
              title: 'Promo Spesial Hari ini Untuk Hari ini',
              datePromo: 'Berakhir 2 Hari lagi',
              subtitle: 'Dapatkan diskon hinggi 75% syarat &\nkententuan berlaku.',
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackLv7,
                  offset: Offset(0, 4),
                  blurRadius: 60,
                  spreadRadius: 0,
                ),
              ],
              functionIconButton: () {
                // TODO
              },
            ),
          );
        })
      ],
    );
  }

  Widget bottomButton() {
    return AppCardContainer(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(0),
      ),
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv6,
          offset: Offset(0, -4),
          blurRadius: 60,
          spreadRadius: -20,
        ),
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppDivider(
            thickness: 4,
            color: AppColors.blackLv7,
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: AppSizes.padding * 8.5,
            ),
          ),
          SizedBox(height: AppSizes.padding),
          AppButton(
              rounded: true,
              text: 'Pilih Promo',
              onTap: () {
                // TODO
              }),
          SizedBox(height: AppSizes.padding),
        ],
      ),
    );
  }
}
