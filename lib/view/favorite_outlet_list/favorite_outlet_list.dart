import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_logo.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list.dart';
import 'package:alvamind_library/widget/organism/tags_organism.dart/tags_organism.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class FavoriteOutletListView extends StatefulWidget {
  static const routeName = '/favorite-outlet-list-screen';

  const FavoriteOutletListView({super.key});

  @override
  State<FavoriteOutletListView> createState() => _FavoriteOutletListViewState();
}

int tagSelected1 = 0;

class _FavoriteOutletListViewState extends State<FavoriteOutletListView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AppNestedScrollView(
        body: body(),
        title: appBar(),
        titleFlexible: tag(),
        collapseHeight: 120,
        titlePadding: EdgeInsets.zero,
        padding: EdgeInsets.only(
          top: AppSizes.padding / 2,
          right: AppSizes.padding,
          left: AppSizes.padding,
        ),
      ),
    );
  }

  Widget appBar() {
    return AppColumnInk(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppLogo(
                title: 'LaundryNet',
                image: AppAssets.logo,
                withText: false,
                size: 25,
              ),
              SizedBox(width: AppSizes.padding / 1.5),
              Text(
                'Outlet Favorite Anda',
                style: AppTextStyle.bold(size: 24),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tag() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
      child: TagsOrganism(
        paddingTagsBody: EdgeInsets.only(left: AppSizes.padding),
        listChips: const [
          'Semua',
          'Reguler',
          'Premium',
        ],
        onTap: (value) {
          // TODO
          tagSelected1 = value;
          setState(() {});
        },
      ),
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        outletFavorite(),
      ],
    );
  }

  Widget outletFavorite() {
    return AppColumnInk(
      children: [
        Text(
          '3 Toko',
          style: AppTextStyle.bold(size: 20),
        ),
        SizedBox(height: AppSizes.padding),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: tagSelected1 == 0
              ? outletReguler()
              : tagSelected1 == 1
                  ? outletReguler()
                  : outletPremium(),
        ),
      ],
    );
  }

  Widget outletReguler() {
    return AppColumnInk(
      children: [
        ...List.generate(3, (i) {
          return Padding(
            padding: i == 2 ? EdgeInsets.all(0) : EdgeInsets.only(bottom: AppSizes.padding),
            child: ItemCardList(
              image: 'https://picsum.photos/20$i/300/',
              starImageCount: '50',
              title: 'Barokah Laundry',
              dateProgress: '2 Agustus 2023',
              textLeftButton: 'Detail Pesanan',
              textRightButton: 'Lacak Pengiriman',
              address: 'Jl. Sukamenak DPR RI KOM...',
              isProfile: true,
              tagText: 'Reguler',
              tagColor: AppColors.greenLv1,
              boxShadow: const [
                BoxShadow(
                  color: AppColors.blackLv7,
                  offset: Offset(0, 4),
                  blurRadius: 60,
                  spreadRadius: -10,
                ),
              ],
              onTapCard: () {
                // TODO
              },
            ),
          );
        })
      ],
    );
  }

  Widget outletPremium() {
    return AppColumnInk(
      children: [
        ...List.generate(2, (i) {
          return Padding(
            padding: i == 1 ? EdgeInsets.all(0) : EdgeInsets.only(bottom: AppSizes.padding),
            child: ItemCardList(
              image: 'https://picsum.photos/20$i/300/',
              starImageCount: '50',
              title: 'Barokah Laundry',
              dateProgress: '2 Agustus 2023',
              textLeftButton: 'Detail Pesanan',
              textRightButton: 'Lacak Pengiriman',
              address: 'Jl. Sukamenak DPR RI KOM...',
              isProfile: true,
              tagText: 'Premium',
              tagColor: AppColors.orangeLv1,
              boxShadow: const [
                BoxShadow(
                  color: AppColors.blackLv7,
                  offset: Offset(0, 4),
                  blurRadius: 60,
                  spreadRadius: -10,
                ),
              ],
              onTapCard: () {
                // TODO
              },
            ),
          );
        })
      ],
    );
  }
}
