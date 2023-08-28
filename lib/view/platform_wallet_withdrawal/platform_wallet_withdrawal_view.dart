import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_divider.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_expansion_list_tile.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_tags.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:alvamind_library/widget/molecule/app_transaction_info.dart';
import 'package:alvamind_library/widget/organism/accordion/accordion_question_card.dart';
import 'package:alvamind_library/widget/organism/payment_method/payment_method.dart';

import 'package:alvamind_library/widget/organism/showcase_card/showcase_user_profile_card.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class PlatformWalletWithdrawalView extends StatefulWidget {
  static const routeName = '/platform-wallet-withdrawal-scren';

  const PlatformWalletWithdrawalView({super.key});

  @override
  State<PlatformWalletWithdrawalView> createState() => _PlatformWalletWithdrawalViewState();
}

class _PlatformWalletWithdrawalViewState extends State<PlatformWalletWithdrawalView> {
  final List<String> titleBankTransfer = [
    'BCA',
    'Mandiri',
    'BRI',
  ];
  final List<String> imageBankTransfer = [
    AppAssets.bankBCAImgPath,
    AppAssets.bankMandiriImgPath,
    AppAssets.bankBRIImgPath,
  ];

  bool isSelected = false;
  String isTyping = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: bottomButton(),
      body: AppNestedScrollView(
        title: appBar(),
        body: body(),
        background: saldoCard(),
        expandedHeight: 220,
        bgMainAxisAlignment: MainAxisAlignment.end,
      ),
    );
  }

  Widget saldoCard() {
    return Padding(
      padding: EdgeInsets.only(
        right: AppSizes.padding,
        left: AppSizes.padding,
        bottom: AppSizes.padding / 1.5,
      ),
      child: const UserProfileCard(
        onlyBalance: true,
        onlySaldo: true,
        countBalance: 'Rp12.689.000',
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
          Expanded(
            child: Text(
              'Pencairan Saldo Platform Wallet',
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.clip,
              style: AppTextStyle.bold(
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        inputFormSaldo(),
        SizedBox(height: AppSizes.padding * 1.5),
        withdarawalDetail(),
        SizedBox(height: AppSizes.padding * 1.5),
        banktTransfer(),
        SizedBox(height: AppSizes.padding * 1.5),
        textDetail(),
        SizedBox(height: AppSizes.padding * 4),
      ],
    );
  }

  Widget inputFormSaldo() {
    return AppExpansionListTile(
      expand: true,
      isDisabled: true,
      showExpandButton: false,
      title: 'Masukan Nominal Sendiri',
      backgroundColor: AppColors.white,
      paddingChild: EdgeInsets.all(AppSizes.padding),
      moreItem: AppTags(text: 'Tarik Semua'),
      children: [
        AppTextField(
          hintText: 'Rp 0.000',
          onChanged: (value) {
            // TODO
            isTyping = value;
            setState(() {});
          },
        )
      ],
    );
  }

  Widget withdarawalDetail() {
    return AppCardContainer(
      padding: EdgeInsets.only(
        top: AppSizes.padding,
        right: AppSizes.padding,
        left: AppSizes.padding,
      ),
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv7,
          offset: Offset(0, 4),
          blurRadius: 60,
          spreadRadius: 0,
        ),
      ],
      child: AppColumnInk(
        children: [
          Text(
            'Ringkasan Pencairan',
            style: AppTextStyle.bold(size: 16),
          ),
          SizedBox(
            height: AppSizes.padding,
          ),
          AppTransactionInfo(
            transactionId: 'Rp 35.000',
            transactionStatus: 'Paid',
            textTitle: 'Saldo Top Up',
            onlyTrasactionId: true,
            dotChillPadding: EdgeInsets.all(0),
            dotColor: AppColors.transparent,
            onTapCopyButton: () {
              // TODO
            },
          ),
          AppDivider(
            thickness: 2,
            color: AppColors.blackLv8,
            padding: EdgeInsets.only(
              bottom: AppSizes.padding,
            ),
          ),
          AppTransactionInfo(
            transactionId: 'Rp 2.500',
            transactionStatus: 'Paid',
            textTitle: 'Biaya Admin',
            onlyTrasactionId: true,
            dotChillPadding: EdgeInsets.all(0),
            dotColor: AppColors.transparent,
            onTapCopyButton: () {
              // TODO
            },
          ),
          AppTransactionInfo(
            transactionId: 'Rp 37.500',
            transactionStatus: 'Paid',
            textTitle: 'Total',
            textTitleStyle: AppTextStyle.bold(size: 16),
            transactionIdStyle: AppTextStyle.bold(size: 16),
            onlyTrasactionId: true,
            withIcon: false,
            dotChillPadding: EdgeInsets.all(0),
            dotColor: AppColors.transparent,
            onTapCopyButton: () {
              // TODO
            },
          ),
        ],
      ),
    );
  }

  Widget banktTransfer() {
    return AppExpansionListTile(
      backgroundColor: AppColors.white,
      paddingChild: EdgeInsets.all(AppSizes.padding),
      title: 'Transfer Bank',
      expand: true,
      children: [
        ...List.generate(3, (i) {
          return Padding(
            padding: i == 2 ? EdgeInsets.zero : EdgeInsets.only(bottom: AppSizes.padding),
            child: PaymentCard(
              onTap: () {},
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackLv7.withOpacity(0.5),
                  offset: Offset(0, 4),
                  blurRadius: 60,
                  spreadRadius: 0,
                ),
              ],
              icon: isSelected == true ? Icons.circle : null,
              backgroundColor: AppColors.white,
              image: imageBankTransfer[i],
              title: titleBankTransfer[i],
              subtitle: 'Admin Fee Rp 2.500',
              withTags: false,
              textTags: i == 0 ? 'Top Up' : null,
              titleColor: AppColors.black,
              onTapIconButton: () {
                // TODO

                isSelected = !isSelected;
                setState(() {});
              },
            ),
          );
        }),
        SizedBox(
          height: AppSizes.padding,
        ),
        AppButton(
          text: 'Tambah Bank Baru',
          buttonColor: AppColors.blueLv5,
          textColor: AppColors.primary,
          onTap: () {},
        )
      ],
    );
  }

  Widget textDetail() {
    return AppExpansionListTile(
      expand: true,
      title: 'Keterangan',
      backgroundColor: AppColors.white,
      children: [
        QuestionText(
          padding: EdgeInsets.all(0),
          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        )
      ],
    );
  }

  Widget bottomButton() {
    return Container(
      height: 100,
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.all(AppSizes.padding),
        child: AppCardContainer(
          padding: EdgeInsets.all(0),
          boxShadow: const [
            BoxShadow(
              color: AppColors.blueLv4,
              offset: Offset(0, 4),
              blurRadius: 24,
              spreadRadius: 0,
            ),
          ],
          child: AppButton(
            text: 'Request Pencairan Saldo',
            buttonColor: isTyping != '' ? AppColors.primary : AppColors.blackLv7,
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
