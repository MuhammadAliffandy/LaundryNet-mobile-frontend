import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_expansion_list_tile.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/organism/payment_method/payment_method.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class SelectPaymentMethodOwnerView extends StatefulWidget {
  static const viewAsOwner = '/select-payment-method-owner-screen';

  const SelectPaymentMethodOwnerView({super.key});

  @override
  State<SelectPaymentMethodOwnerView> createState() => _SelectPaymentMethodOwnerViewState();
}

class _SelectPaymentMethodOwnerViewState extends State<SelectPaymentMethodOwnerView> {
  bool isSelected = false;

  final List<String> imagePayment = [
    AppAssets.paypalIcon,
    AppAssets.googleIcon,
    AppAssets.appleIcon,
    AppAssets.mastercardIcon,
    AppAssets.walletIcon,
    AppAssets.moneyIcon,
  ];
  final List<String> usedImagePayment = [
    AppAssets.walletIcon,
    AppAssets.moneyIcon,
    AppAssets.scanPayIcon,
  ];
  final List<String> imageBankTransfer = [
    AppAssets.bankBCAImgPath,
    AppAssets.bankMandiriImgPath,
    AppAssets.bankBRIImgPath,
    AppAssets.bankBNIImgPath,
  ];
  final List<String> imageVirtualAccount = [
    AppAssets.bankBCAImgPath,
    AppAssets.bankMandiriImgPath,
    AppAssets.bankBRIImgPath,
    AppAssets.bankBNIImgPath,
  ];
  final List<String> imageEWallet = [
    AppAssets.ewalGopayImgPath,
    AppAssets.ewalShoopeepayImgPath,
    AppAssets.ewalDanaImgPath,
    AppAssets.ewalOvoImgPath,
  ];

  final List<String> titleVirtualAccount = [
    'BCA Virtual Account',
    'Mandiri Virtual Account',
    'BRI Virtual Account',
    'BNI Virtual Account',
  ];
  final List<String> titleBankTransfer = [
    'BCA',
    'Mandiri',
    'BRI',
    'BNI',
  ];
  final List<String> titleEWallet = [
    'Gopay',
    'Shopee Pay',
    'Dana',
    'Ovo',
  ];

  final List<String> titlePayment = [
    'PayPal',
    'Google',
    'Apple Pay',
    '•••• •••• •••• •••• 4679',
    'Platform Wallet',
    'Cash Money',
  ];

  final List<String> usedTitlePayment = [
    'Platform Wallet',
    'Uang Cash',
    'Qris',
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: buttonBottom(),
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
          'Pilih Metode Pembayaran',
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
        Text(
          'Select the payment method you want to use.',
          style: AppTextStyle.medium(
            size: 14,
          ),
        ),
        SizedBox(height: AppSizes.padding * 1.5),
        usedPayment(),
        SizedBox(height: AppSizes.padding * 1.5),
        banktTransfer(),
        SizedBox(height: AppSizes.padding * 1.5),
        creditCard(),
        SizedBox(height: AppSizes.padding * 1.5),
        virtualAccount(),
        SizedBox(height: AppSizes.padding * 1.5),
        eWallet(),
        SizedBox(height: AppSizes.padding * 4),
      ],
    );
  }

  Widget usedPayment() {
    return AppExpansionListTile(
      backgroundColor: AppColors.white,
      paddingChild: EdgeInsets.all(AppSizes.padding),
      title: 'Sering Digunakan',
      expand: true,
      children: [
        ...List.generate(3, (i) {
          return Padding(
            padding: EdgeInsets.only(bottom: AppSizes.padding),
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
              image: usedImagePayment[i],
              title: usedTitlePayment[i],
              subtitle: i == 0 ? 'Rp 50.000' : null,
              withTags: i == 0 ? true : false,
              textTags: i == 0 ? 'Top Up' : null,
              titleColor: AppColors.black,
              onTapIconButton: () {
                // TODO

                isSelected = !isSelected;
                setState(() {});
              },
            ),
          );
        })
      ],
    );
  }

  Widget banktTransfer() {
    return AppExpansionListTile(
      backgroundColor: AppColors.white,
      paddingChild: EdgeInsets.all(AppSizes.padding),
      title: 'Transfer Bank',
      expand: true,
      children: [
        ...List.generate(4, (i) {
          return Padding(
            padding: EdgeInsets.only(bottom: AppSizes.padding),
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
        })
      ],
    );
  }

  Widget creditCard() {
    return AppExpansionListTile(
      title: 'Kartu Kredit',
      backgroundColor: AppColors.white,
      paddingChild: EdgeInsets.all(AppSizes.padding),
      expand: true,
      children: [
        PaymentCard(
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
          image: AppAssets.mastercardIcon,
          title: 'Master Card',
          subtitle: 'Admin Fee Rp 0.0000',
          withTags: false,
          titleColor: AppColors.black,
          onTapIconButton: () {
            // TODO

            isSelected = !isSelected;
            setState(() {});
          },
        ),
        SizedBox(
          height: AppSizes.padding,
        ),
        AppButton(
          text: 'Tambahkan Kartu Kredit Baru',
          buttonColor: AppColors.blueLv5,
          textColor: AppColors.primary,
          onTap: () {
            // TODO
          },
        )
      ],
    );
  }

  Widget virtualAccount() {
    return AppExpansionListTile(
      backgroundColor: AppColors.white,
      paddingChild: EdgeInsets.all(AppSizes.padding),
      title: 'Virtual Account',
      expand: true,
      children: [
        ...List.generate(4, (i) {
          return Padding(
            padding: EdgeInsets.only(bottom: AppSizes.padding),
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
              image: imageVirtualAccount[i],
              title: titleVirtualAccount[i],
              titleStyle: AppTextStyle.bold(size: 16),
              subtitle: 'Admin Fee Rp 0.0000',
              withTags: false,
              titleColor: AppColors.black,
              onTapIconButton: () {
                // TODO

                isSelected = !isSelected;
                setState(() {});
              },
            ),
          );
        })
      ],
    );
  }

  Widget eWallet() {
    return AppExpansionListTile(
      backgroundColor: AppColors.white,
      paddingChild: EdgeInsets.all(AppSizes.padding),
      title: 'E-Wallet',
      expand: true,
      children: [
        ...List.generate(4, (i) {
          return Padding(
            padding: EdgeInsets.only(bottom: AppSizes.padding),
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
              image: imageEWallet[i],
              title: titleEWallet[i],
              subtitle: 'Admin Fee Rp 500',
              withTags: false,
              titleColor: AppColors.black,
              onTapIconButton: () {
                // TODO

                isSelected = !isSelected;
                setState(() {});
              },
            ),
          );
        })
      ],
    );
  }

  Widget buttonBottom() {
    return SizedBox(
      height: 100,
      child: AppCardContainer(
        backgroundColor: AppColors.transparent,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: AppColors.blueLv4,
            offset: Offset(0, 4),
            blurRadius: 24,
            spreadRadius: -18,
          ),
        ],
        child: AppButton(
          text: 'Bayar Sekarang',
          rounded: true,
          buttonColor: AppColors.primary,
          onTap: () {
            // TODO
          },
        ),
      ),
    );
  }
}
