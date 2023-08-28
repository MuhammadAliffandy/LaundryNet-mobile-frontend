import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_divider.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_dialog.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list.dart';
import 'package:alvamind_library/widget/organism/order_type_info/order_type_info.dart';
import 'package:alvamind_library/widget/organism/tags_organism.dart/tags_organism.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class OwnerOutletesListView extends StatefulWidget {
  static const routeName = '/owner-outletes-list-screen';

  const OwnerOutletesListView({
    super.key,
  });

  @override
  State<OwnerOutletesListView> createState() => _OwnerOutletesListViewState();
}

class _OwnerOutletesListViewState extends State<OwnerOutletesListView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: bottomButton(),
      body: AppNestedScrollView(
        title: appBar(),
        body: body(),
        expandedHeight: 200,
        collapseHeight: 120,
        background: searchTag(),
        titlePadding: EdgeInsets.symmetric(vertical: AppSizes.padding),
        titleFlexible: tag(),
        bgMainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  Widget tag() {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.only(top: AppSizes.padding),
      child: TagsOrganism(
        paddingTagsBody: EdgeInsets.only(left: AppSizes.padding),
        listChips: const [
          'Semua',
          'Surabaya',
          'Jakarta',
          'Malang',
          'Semarang',
        ],
        onTap: (value) {
          // TODO
        },
      ),
    );
  }

  Widget appBar() {
    return Column(
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
              'Toko Saya',
              style: AppTextStyle.bold(size: 24),
            ),
          ],
        ),
      ],
    );
  }

  Widget searchTag() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: AppSizes.padding,
            left: AppSizes.padding,
            right: AppSizes.padding,
          ),
          child: AppTextField(
            onChanged: (value) {
              // TODO
              setState(() {});
            },
            onTapSearcFilter: () {
              final navigator = Navigator.of(context);
              AppDialog.show(
                navigator,
                title: 'Dialog Title',
                text: 'Dialog Text',
                leftButtonText: 'Left Button',
                rightButtonText: 'Right Button',
              );
            },
            hintText: 'Search...',
            type: AppTextFieldType.search,
          ),
        ),
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        Text(
          '3 Toko',
          style: AppTextStyle.bold(size: 20),
        ),
        SizedBox(height: AppSizes.padding),
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
              image: 'https://picsum.photos/23$i/300/',
              starImageCount: '50',
              title: 'Barokah Laundry',
              dateProgress: '2 Agustus 2023',
              textLeftButton: 'Detail Toko',
              textRightButton: 'Laporan Keuangan',
              address: 'Jl. Sukamenak DPR RI KOM...',
              isProfile: true,
              isOwner: true,
              onTapLeftButton: () {
                // TODO
              },
              onTapRightButton: () {
                // TODO
              },
              fontSizeButton: 14,
              detailInfoCard: OrderTypeInfo(
                withOrder: false,
                countMachine: '21/24',
                countCustomers: '3.145',
                countEmployees: '7',
                deliveryButton: () {
                  // TODO
                },
                dropButton: () {
                  // TODO
                },
                selfButton: () {
                  // TODO
                },
              ),
            ),
          );
        })
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
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv6,
          offset: Offset(0, -2),
          blurRadius: 60,
          spreadRadius: -25,
        ),
      ],
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
              leftIcon: Icons.add_box_rounded,
              rounded: true,
              text: 'Tambahkan Toko Baru',
              onTap: () {
                // TODO
              }),
          SizedBox(height: AppSizes.padding),
        ],
      ),
    );
  }
}
