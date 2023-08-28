import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/organism/order_card/order_card.dart';
import 'package:alvamind_library/widget/organism/tab%20_detail_outlet/tab_detail_outlet.dart';

import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class ComplainListOwnerView extends StatefulWidget {
  static const viewAsOwner = '/complain-list-view-screen-owner';

  const ComplainListOwnerView({super.key});

  @override
  State<ComplainListOwnerView> createState() => _ComplainListOwnerViewState();
}

TabController? _tabController;

class _ComplainListOwnerViewState extends State<ComplainListOwnerView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AppNestedScrollView(
        lengthTab: 2,
        collapseHeight: 120,
        background: appBar(),
        body: body(),
        padding: EdgeInsets.only(top: AppSizes.padding),
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: EdgeInsets.only(top: AppSizes.padding * 2),
      child: AppColumnInk(
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
                    'Daftar Komplain',
                    style: AppTextStyle.bold(size: 24),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Toko Barokah Laundry',
                    style: AppTextStyle.medium(size: 12),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: AppSizes.padding / 4),
          tabBar(),
        ],
      ),
    );
  }

  Widget tabBar() {
    return TabBarDetailOutlet(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
      controller: _tabController,
      isScrollable: false,
      listTabBar: [
        'Aktif',
        'Selesai'
      ],
      onTap: (value) {},
    );
  }

  Widget body() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: TabBarView(
        controller: _tabController,
        physics: BouncingScrollPhysics(),
        children: [
          complainListBodyActive(),
          complainListBodyDone(),
        ],
      ),
    );
  }

  Widget complainListBodyActive() {
    return AppColumnInk(
      children: [
        ...List.generate(3, (i) {
          return Padding(
            padding: i == 2
                ? EdgeInsets.only(
                    right: AppSizes.padding,
                    left: AppSizes.padding,
                  )
                : EdgeInsets.only(
                    bottom: AppSizes.padding,
                    right: AppSizes.padding,
                    left: AppSizes.padding,
                  ),
            child: OrderCard(
              image: 'https://picsum.photos/23$i/300',
              boxShadow: const [
                BoxShadow(
                  color: AppColors.blackLv7,
                  offset: Offset(0, 4),
                  blurRadius: 60,
                  spreadRadius: -10,
                ),
              ],
              starImageCount: '50',
              title: 'Barokah Laundry',
              isProgress: true,
              showProgressLine: false,
              showButton: false,
              textPrice: 'Rp42.431',
              statusPrice: '/00 days',
              dateProgress: '2 Agustus 2023',
              textLeftButton: 'Detail Pesanan',
              textRightButton: 'Lacak Pengiriman',
              tagText: i == 0
                  ? 'Solusi Ditolak'
                  : i == 1
                      ? 'Solusi Diajukan'
                      : 'Selesai',
              tagBorderColor: i == 0
                  ? AppColors.redLv1
                  : i == 1
                      ? AppColors.primary
                      : AppColors.greenLv1,
              tagTextColor: i == 0
                  ? AppColors.redLv1
                  : i == 1
                      ? AppColors.primary
                      : AppColors.greenLv1,
              labelingCount: 40,
              customWidget: [
                Expanded(
                  child: AppButton(
                    onTap: () {},
                    text: 'Lihat Detail',
                    rounded: true,
                    textColor: AppColors.white,
                    borderWidth: 2,
                    buttonColor: AppColors.primary,
                    borderColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.padding / 2.5,
                    ),
                  ),
                ),
                SizedBox(
                  width: AppSizes.padding / 2,
                ),
                Expanded(
                  child: AppButton(
                    onTap: () {},
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.padding / 2.5,
                    ),
                    leftIcon: CustomIcon.chatBoldIcon,
                    text: 'Diskusi (2)',
                    textColor: AppColors.primary,
                    borderWidth: 2,
                    buttonColor: AppColors.white,
                    borderColor: AppColors.primary,
                    rounded: true,
                  ),
                ),
              ],
            ),
          );
        })
      ],
    );
  }

  Widget complainListBodyDone() {
    return AppColumnInk(
      children: [
        ...List.generate(3, (i) {
          return Padding(
            padding: i == 2
                ? EdgeInsets.only(
                    right: AppSizes.padding,
                    left: AppSizes.padding,
                  )
                : EdgeInsets.only(
                    bottom: AppSizes.padding,
                    right: AppSizes.padding,
                    left: AppSizes.padding,
                  ),
            child: OrderCard(
              image: 'https://picsum.photos/23$i/300',
              boxShadow: const [
                BoxShadow(
                  color: AppColors.blackLv7,
                  offset: Offset(0, 4),
                  blurRadius: 60,
                  spreadRadius: -10,
                ),
              ],
              starImageCount: '50',
              title: 'Barokah Laundry',
              isProgress: true,
              showButton: false,
              textPrice: 'Rp42.431',
              statusPrice: '/00 days',
              dateProgress: '2 Agustus 2023',
              textLeftButton: 'Detail Pesanan',
              textRightButton: 'Lacak Pengiriman',
              tagText: 'Selesai',
              tagBorderColor: AppColors.greenLv1,
              tagTextColor: AppColors.greenLv1,
              labelingCount: 40,
              onTapLeftButton: () {
                // TODO
              },
              onTapRightButton: () {
                // TODO
              },
            ),
          );
        })
      ],
    );
  }
}
