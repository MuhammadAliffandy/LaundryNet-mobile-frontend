import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_dialog.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:alvamind_library/widget/organism/showcase_card/showcase_user_profile_card.dart';
import 'package:alvamind_library/widget/organism/table_organism/table_history_trasaction.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class CommissionTransactionHistoryJoinView extends StatefulWidget {
  static const routeName = '/commission-transaction-history-join-screen';

  const CommissionTransactionHistoryJoinView({super.key});

  @override
  State<CommissionTransactionHistoryJoinView> createState() => _CommissionTransactionHistoryJoinViewState();
}

class _CommissionTransactionHistoryJoinViewState extends State<CommissionTransactionHistoryJoinView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AppNestedScrollView(
        title: appBar(),
        body: body(),
        padding: EdgeInsets.only(top: AppSizes.padding),
        expandedHeight: 430,
        bgMainAxisAlignment: MainAxisAlignment.end,
        background: userProfileCard(),
        titlePadding: EdgeInsets.all(0),
      ),
    );
  }

  Widget appBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
      color: AppColors.white,
      child: Row(
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
            'Riwayat Transaksi Komisi',
            style: AppTextStyle.bold(size: 24),
          )
        ],
      ),
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        tableHistory(),
        SizedBox(height: AppSizes.padding * 2),
      ],
    );
  }

  Widget userProfileCard() {
    return Padding(
      padding: EdgeInsets.only(
        right: AppSizes.padding,
        left: AppSizes.padding,
        bottom: AppSizes.padding / 1.5,
      ),
      child: UserProfileCard(
        nameUser: 'Amber Winston',
        idUser: 'ID Profil 5457383979',
        countBalance: 'Rp12.689.000',
        onTapCopyButton: () {
          // TODO
        },
        onTapHistoryButton: () {
          // TODO
        },
        onTapTopUpButton: () {
          // TODO
        },
        onTapWithDrawButton: () {
          // TODO
        },
        onTapPayButton: () {
          // TODO
        },
      ),
    );
  }

  Widget tableHistory() {
    return AppColumnInk(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
        child: Row(
          children: [
            Expanded(
              child: AppTextField(
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
            SizedBox(
              width: AppSizes.padding / 2,
            ),
            AppIconButton(
              buttonColor: AppColors.transparent,
              borderRadius: 15,
              icon: const Icon(
                CustomIcon.downloadIcon,
                color: AppColors.primary,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      SizedBox(
        height: AppSizes.padding,
      ),
      TableHistoryTransaction(),
    ]);
  }
}
