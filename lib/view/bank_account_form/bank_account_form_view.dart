import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_divider.dart';
import 'package:alvamind_library/widget/molecule/app_account_list.dart';

import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_ink_container.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';

import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:alvamind_library/widget/organism/showcase_card/showcase_credit_card.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class BankAccountFormView extends StatefulWidget {
  static const routeName = '/bank-account-form-screen';

  const BankAccountFormView({super.key});

  @override
  State<BankAccountFormView> createState() => _BankAccountFormViewState();
}

class _BankAccountFormViewState extends State<BankAccountFormView> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      bottomNavigationBar: bottomButton(),
      body: AppNestedScrollView(
        body: body(),
        title: appBar(),
        background: creditCard(),
        expandedHeight: 340,
        bgMainAxisAlignment: MainAxisAlignment.end,
      ),
    );
  }

  Widget appBar() {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
      child: Row(
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
            'Tambah Rekening Bank',
            style: AppTextStyle.bold(
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        textHeadline('Nama Bank', [
          AppTextField(
            hintText: 'Situmorang',
            onChanged: (text) {
              // TODO
            },
          ),
        ]),
        SizedBox(height: AppSizes.padding * 1.5),
        textHeadline('Nomor Rekening', [
          AppLongCard(
            padding: EdgeInsets.zero,
            children: [
              Expanded(
                child: AppTextField(
                  hintText: '1234 5678 9123 1211',
                  hintStyle: AppTextStyle.bold(size: 14, color: AppColors.black),
                  onChanged: (text) {
                    // TODO
                  },
                ),
              ),
              SizedBox(
                width: AppSizes.padding,
              ),
              AppButton(
                  text: 'Periksa',
                  onTap: () {
                    // TODO
                  })
            ],
          ),
        ]),
        SizedBox(height: AppSizes.padding * 1.5),
        accountBank(),
        SizedBox(height: AppSizes.padding * 4),
      ],
    );
  }

  Widget creditCard() {
    return Padding(
      padding: EdgeInsets.only(
        right: AppSizes.padding,
        left: AppSizes.padding,
        bottom: AppSizes.padding / 1.5,
      ),
      child: UserCreditCard(
        numberCard: '1234 5678 9123 1211',
        nameCard: 'Situmorang',
        image: AppAssets.bankBCAImgPath,
        showButton: false,
        showTag: false,
        onTapEditButton: () {
          // TODO
        },
      ),
    );
  }

  Widget accountBank() {
    return AppInkContainer(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.padding / 2,
        horizontal: AppSizes.padding / 4,
      ),
      borderRadius: BorderRadius.circular(0),
      child: const AccountList(
        title: 'Situmorang',
        subtitle: 'Bank BCA',
        rightButton: false,
        rightItem: Center(),
      ),
    );
  }

  Widget textHeadline(String title, List<Widget> widget) {
    return AppColumnInk(
      children: [
        Text(title, style: AppTextStyle.bold(size: 18)),
        SizedBox(height: AppSizes.padding),
        ...widget,
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
          RichText(
              text: TextSpan(style: AppTextStyle.regular(size: 18), children: [
            const TextSpan(text: 'Dengan Melanjutkan, Anda Menyetujui'),
            TextSpan(
              text: ' Syarat dan Ketentuan ',
              style: AppTextStyle.bold(size: 18, color: AppColors.primary),
            ),
            const TextSpan(text: 'Yang Berlaku'),
          ])),
          SizedBox(height: AppSizes.padding),
          AppButton(
              rounded: true,
              text: 'Simpan',
              onTap: () {
                // TODO
              }),
          SizedBox(height: AppSizes.padding),
        ],
      ),
    );
  }
}
