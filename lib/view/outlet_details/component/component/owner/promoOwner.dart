import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_divider.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/organism/promo_card/promo_card.dart';
import 'package:flutter/material.dart';
import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_sizes.dart';

class PromoOwner extends StatefulWidget {
  @override
  State<PromoOwner> createState() => _PromoOwnerState();
}

class _PromoOwnerState extends State<PromoOwner> {
  int tagSelected = 0;
  int tagSelected1 = 0;
  int tabBarSelected = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
          physics: BouncingScrollPhysics(),
          child: AppColumnInk(
            children: [
              SizedBox(height: AppSizes.padding),
              AppColumnInk(
                children: [
                  ...List.generate(3, (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: AppSizes.padding),
                      child: PromoCard(
                        image: AppAssets.success,
                        title: 'Promo Spesial Hari ini Untuk Hari ini',
                        datePromo: 'Berakhir 2 Hari lagi',
                        subtitle: 'Dapatkan diskon hinggi 75% syarat & kententuan berlaku.',
                        rightIcon: false,
                        detailDatePromo: '25 Mei - 25 Mei 2023',
                        countPromo: '123.123',
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.blackLv7,
                            offset: Offset(0, 4),
                            blurRadius: 60,
                            spreadRadius: 0,
                          ),
                        ],
                        functionEditButton: () {
                          // TODO
                        },
                      ),
                    );
                  }),
                  SizedBox(
                    height: AppSizes.padding * 11,
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 60,
          child: bottomButton(),
        ),
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
              text: 'Buat Promo',
              onTap: () {
                // TODO
              }),
          SizedBox(height: AppSizes.padding),
        ],
      ),
    );
  }
}
