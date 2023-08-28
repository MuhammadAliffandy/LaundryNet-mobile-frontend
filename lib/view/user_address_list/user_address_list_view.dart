import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_divider.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class UserAddressListView extends StatefulWidget {
  static const routeName = '/user-address-list-view';

  const UserAddressListView({
    super.key,
  });

  @override
  State<UserAddressListView> createState() => _UserAddressListViewState();
}

int addressListCount = 3;
int isMainAddress = 0;

class _UserAddressListViewState extends State<UserAddressListView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: bottomButton(),
      body: AppNestedScrollView(
        title: appBar(),
        body: body(),
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
          'Daftar Alamat Saya',
          style: AppTextStyle.bold(size: 24),
        )
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        countHeadline(addressListCount),
        SizedBox(
          height: AppSizes.padding,
        ),
        addressList(),
      ],
    );
  }

  Widget addressList() {
    return AppColumnInk(
      children: [
        ...List.generate(3, (i) {
          return Padding(
            padding: i == 2 ? EdgeInsets.all(0) : EdgeInsets.only(bottom: AppSizes.padding),
            child: ItemCardList(
              boxShadow: const [
                BoxShadow(
                  color: AppColors.blackLv7,
                  offset: Offset(0, 4),
                  blurRadius: 60,
                  spreadRadius: -10,
                ),
              ],
              isProfile: true,
              isOwner: true,
              isList: false,
              image: 'https://picsum.photos/23$i/300/',
              starImageCount: '50',
              title: 'Barokah Laundry',
              dateProgress: '+62348032428',
              textLeftButton: 'Edit Alamat',
              textRightButton: isMainAddress == i ? 'Alamat Utama' : 'Jadikan Utama',
              address: 'Jl. Sukamenak DPR RI KOM...',
              tagColor: AppColors.redLv1,
              tagText: 'Belum Pin Point',
              rightIconButton: Icons.location_on_rounded,
              rightButtonColor: isMainAddress == i ? AppColors.primary : AppColors.white,
              rightTextButtonColor: isMainAddress == i ? AppColors.white : AppColors.primary,
              fontSizeButton: 14,
              onTapLeftButton: () {
                // TODO
              },
              onTapRightButton: () {
                // TODO
                setState(() {});
                isMainAddress = i;
              },
            ),
          );
        }),
        SizedBox(
          height: AppSizes.padding,
        )
      ],
    );
  }

  Widget countHeadline(int count) {
    return AppLongCard(
      backgroundColor: AppColors.transparent,
      padding: EdgeInsets.all(0),
      children: [
        Text('Ditemukan $count', style: AppTextStyle.bold(size: 20)),
        count > 0
            ? Row(
                children: [
                  AppIconButton(
                    icon: const Icon(
                      CustomIcon.documentBoldIcon,
                      color: AppColors.primary,
                      size: 20,
                    ),
                    onTap: () {},
                    padding: const EdgeInsets.all(0),
                    buttonColor: AppColors.transparent,
                  ),
                  SizedBox(width: AppSizes.padding / 1.5),
                  AppIconButton(
                    icon: const Icon(
                      CustomIcon.categoryIcon,
                      color: AppColors.blackLv6,
                      size: 20,
                    ),
                    onTap: () {},
                    padding: const EdgeInsets.all(0),
                    buttonColor: AppColors.transparent,
                  ),
                ],
              )
            : const SizedBox.shrink()
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
          color: AppColors.blackLv7,
          offset: Offset(0, -8),
          blurRadius: 60,
          spreadRadius: -10,
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
              text: 'Tambahkan Alamat Baru',
              onTap: () {
                // TODO
              }),
          SizedBox(height: AppSizes.padding),
        ],
      ),
    );
  }
}
