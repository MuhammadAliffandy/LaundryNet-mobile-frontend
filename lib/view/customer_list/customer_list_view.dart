import 'package:alvamind_library/widget/atom/app_divider.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_dialog.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list.dart';

import 'package:alvamind_library/widget/organism/order_type_info/order_type_info.dart';
import 'package:alvamind_library/widget/organism/tags_organism.dart/tags_organism.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class CustomerListView extends StatefulWidget {
  static const routeName = '/customer-list-screen';

  const CustomerListView({super.key});

  @override
  State<CustomerListView> createState() => _CustomerListViewState();
}

class _CustomerListViewState extends State<CustomerListView> {
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
          'A - Z',
          'Z - A',
          'Terbaru',
          'Terlama',
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftar Konsumen',
                  style: AppTextStyle.bold(size: 24),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Barokah Laundry',
                  style: AppTextStyle.medium(size: 12),
                ),
              ],
            )
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
    return customerList();
  }

  Widget customerList() {
    return AppColumnInk(
      children: [
        Text('Ditemukan 3', style: AppTextStyle.bold(size: 20)),
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
              dateProfileItem: 'Sejak 10 Januari 2014',
              textLeftButton: 'Detail Konsumen',
              textRightButton: 'Whatsapp',
              address: 'Jl. Sukamenak DPR RI KOM...',
              isProfile: true,
              isOwner: true,
              isCustomer: true,
              onTapLeftButton: () {
                // TODO
              },
              onTapRightButton: () {
                // TODO
              },
              detailInfoCard: const OrderTypeInfo(
                isCustomer: true,
                withOrder: false,
                countMachine: '42',
                countCustomers: '13',
                countEmployees: '0',
              ),
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
          offset: Offset(0, -2),
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
              text: 'Buat Customer Baru',
              onTap: () {
                // TODO
              }),
          SizedBox(height: AppSizes.padding),
        ],
      ),
    );
  }
}
