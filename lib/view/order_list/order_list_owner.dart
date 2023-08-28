import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_dialog.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:alvamind_library/widget/organism/order_card/order_card.dart';
import 'package:alvamind_library/widget/organism/order_list/order_list.dart';
import 'package:alvamind_library/widget/organism/tags_organism.dart/tags_organism.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class OrderListOwnerView extends StatefulWidget {
  static const viewAsOwner = '/order-list-owner-screen';

  const OrderListOwnerView({super.key});

  @override
  State<OrderListOwnerView> createState() => _OrderListOwnerViewState();
}

class _OrderListOwnerViewState extends State<OrderListOwnerView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
          'Semua',
          'Menunggu Konfirmasi',
          'Ambil',
          'Antar',
          'Selesai',
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
                  'Daftar Pesanan',
                  style: AppTextStyle.bold(size: 24),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Bagian Produksi',
                  style: AppTextStyle.medium(size: 12),
                ),
              ],
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
    return orderList();
  }

  Widget orderList() {
    return AppColumnInk(
      children: [
        ...List.generate(5, (i) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: AppSizes.padding,
            ),
            child: OrderList(
              title: 'Alasan',
              dateTime: '12 : 30 PM',
              location: 'Tokyo, Jepang',
              description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              boxShadow: const [
                BoxShadow(
                  color: AppColors.blackLv7,
                  offset: Offset(0, 4),
                  blurRadius: 30,
                  spreadRadius: -10,
                ),
              ],
              orderCard: OrderCard(
                image: 'https://picsum.photos/id/3$i/200/400',
                padding: EdgeInsets.all(0),
                backgroundColor: AppColors.transparent,
                starImageCount: '50',
                title: i == 1 ? 'Zarie Baptista' : 'Barokah Laundry',
                isProgress: true,
                textPrice: '20 Kg',
                statusPrice: 'Estimasi Selesai 7 hari',
                dateProgress: '2 Agustus 2023',
                textLeftButton: i == 1 ? 'Order Outlet Lain' : 'Detail Pesanan',
                textRightButton: i == 1 ? 'Batalkan Pesanan' : 'Lacak Pengiriman',
                labelingCount: 40,
                tagText: i == 1
                    ? 'HomeService'
                    : i == 2
                        ? 'SelfService'
                        : 'Delivery',
                tagTextColor: AppColors.white,
                tagColor: i == 1
                    ? AppColors.orangeLv1
                    : i == 2
                        ? AppColors.yellowLv1
                        : AppColors.greenLv3,
                tagBorderWidth: 0,
                leftButtonColor: i == 1 ? AppColors.blackLv7 : null,
                rightButtonColor: i == 1 ? AppColors.redLv1 : null,
                rightButtonTextColor: i == 1 ? AppColors.white : null,
                leftButtonBorderColor: i == 1 ? AppColors.blackLv7 : null,
                rightButtonBorderColor: i == 1 ? AppColors.redLv1 : null,
                onTapLeftButton: () {
                  // TODO
                },
                onTapRightButton: () {
                  // TODO
                },
              ),
            ),
          );
        }),
      ],
    );
  }
}
