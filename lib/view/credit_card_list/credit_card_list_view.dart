import 'package:alvamind_library/widget/atom/app_divider.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/organism/showcase_card/showcase_credit_card.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class CreditCardListView extends StatefulWidget {
  static const routeName = '/credit-card-list-screen';

  const CreditCardListView({super.key});

  @override
  State<CreditCardListView> createState() => _CreditCardListViewState();
}

class _CreditCardListViewState extends State<CreditCardListView> {
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppIconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          buttonColor: AppColors.transparent,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        Text(
          'Daftar Kartu Kredit',
          style: AppTextStyle.bold(
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        ...List.generate(4, (i) {
          return Padding(
            padding: EdgeInsets.only(bottom: AppSizes.padding),
            child: UserCreditCard(
              numberCard: '1234 5678 9123 1211',
              nameCard: 'Situmorang',
              expiryDateCard: '10/23',
              gradient: i == 1
                  ? const LinearGradient(colors: [
                      AppColors.greenLv2,
                      AppColors.greenLv1,
                    ])
                  : i == 2
                      ? const LinearGradient(colors: [
                          AppColors.orangeLv1,
                          AppColors.yellowLv1,
                        ])
                      : i == 3
                          ? const LinearGradient(colors: [
                              AppColors.redLv2,
                              AppColors.redLv1,
                            ])
                          : null,
              showTag: i == 1
                  ? false
                  : i == 2
                      ? false
                      : i == 3
                          ? false
                          : null,
              onTapEditButton: () {
                // TODO
              },
            ),
          );
        }),
        SizedBox(
          height: AppSizes.padding * 4,
        )
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
              text: 'Tambahkan Kartu Kredit',
              onTap: () {
                // TODO
              }),
          SizedBox(height: AppSizes.padding),
        ],
      ),
    );
  }
}
