import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_avatar.dart';
import 'package:alvamind_library/widget/atom/app_image.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/organism/order_type_info/profile_info.dart';
import 'package:alvamind_library/widget/organism/transaction_review_card/list_card_progress.dart';
import 'package:alvamind_library/widget/organism/transaction_review_card/list_transaction.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class CustomerDetailView extends StatefulWidget {
  static const routeName = '/customer-detail-screen';

  const CustomerDetailView({super.key});

  @override
  State<CustomerDetailView> createState() => _CustomerDetailViewState();
}

class _CustomerDetailViewState extends State<CustomerDetailView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AppNestedScrollView(
        title: appBar(),
        body: body(),
        background: profileContainer(),
        bgMainAxisAlignment: MainAxisAlignment.end,
        expandedHeight: 400,
      ),
    );
  }

  Widget appBar() {
    return AppLongCard(
      backgroundColor: AppColors.white,
      borderRadius: BorderRadius.circular(0),
      padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
      children: [
        Row(
          children: [
            AppIconButton(
              icon: const Icon(Icons.arrow_back),
              buttonColor: AppColors.transparent,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Text(
              'Detail Konsumen',
              style: AppTextStyle.bold(size: 24),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: AppSizes.padding),
            AppIconButton(
              icon: const Icon(
                CustomIcon.notificationIcon,
                color: AppColors.primary,
              ),
              buttonColor: AppColors.transparent,
              onTap: () {},
            ),
            AppIconButton(
              icon: const Icon(
                Icons.pending_outlined,
                color: AppColors.black,
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
    return AppColumnInk(
      children: [
        profileDetail(),
      ],
    );
  }

  Widget profileContainer() {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSizes.padding),
      child: AppColumnInk(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppAvatar(
            size: 140,
            image: randomImage,
            showIconButton: true,
            icon: CustomIcon.editPenIcon,
            borderWidth: 0,
          ),
          SizedBox(height: AppSizes.padding * 1.5),
          Text(
            'Andrew Ainsley',
            style: AppTextStyle.bold(size: 24),
          ),
          SizedBox(height: AppSizes.padding / 1.5),
          Text(
            'Terdaftar Sejak Juni 2023',
            style: AppTextStyle.medium(size: 16),
          ),
          SizedBox(height: AppSizes.padding * 1.5),
          const ProfileInfo(
            title: [
              '3.415',
              '3',
            ],
            subtitle: [
              'Total Transaksi',
              'Alamat',
            ],
          )
        ],
      ),
    );
  }

  Widget profileDetail() {
    return AppColumnInk(
      children: [
        AppButton(
            leftIcon: CustomIcon.editPenIcon,
            text: 'Edit Konsumen',
            onTap: () {
              // TODO
            }),
        SizedBox(height: AppSizes.padding * 1.5),
        const ListTransaction(
          isTransaction: true,
          transactionId: 'andrew@gmail.com',
          adminPayment: '+62534234432',
          bill: 'Laki Laki',
          count: '19 Mei 2023',
          status: 'Paid',
          statusColor: AppColors.primary,
          boxShadow: [
            BoxShadow(
              color: AppColors.blackLv7,
              offset: Offset(0, 4),
              blurRadius: 60,
              spreadRadius: -10,
            ),
          ],
        ),
        SizedBox(height: AppSizes.padding * 1.5),
        statusComplain(),
        SizedBox(height: AppSizes.padding * 1.5),
        statusComplain(),
        SizedBox(height: AppSizes.padding * 4),
      ],
    );
  }

  Widget statusComplain() {
    return ListCard(
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv7,
          offset: Offset(0, 4),
          blurRadius: 60,
          spreadRadius: -10,
        ),
      ],
      leftIcon: CustomIcon.walletBoldIcon,
      rightIcon: Icons.chevron_right_rounded,
      title: 'Selasa, 23 Juni 2023',
      subtitle: 'Status Complain',
      textTags: 'Proses',
      onTapChevronButton: () {
        // TODO
      },
      onTapCard: () {
        // TODO
      },
    );
  }
}
