import 'package:alvamind_library/app/asset/app_assets.dart';

import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list_selected_done.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class SelectOrderTypeView extends StatefulWidget {
  static const routeName = '/select-order-type-screen';

  const SelectOrderTypeView({super.key});

  @override
  State<SelectOrderTypeView> createState() => _SelectOrderTypeViewState();
}

class _SelectOrderTypeViewState extends State<SelectOrderTypeView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AppNestedScrollView(
        title: appBar(),
        body: body(),
      ),
    );
  }

  Widget appBar() {
    return Row(
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
          'Pilih Jenis Pesanan',
          style: AppTextStyle.bold(size: 24),
        ),
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        deliveryService(),
        SizedBox(height: AppSizes.padding),
        dropService(),
        SizedBox(height: AppSizes.padding),
        selfService(),
        SizedBox(height: AppSizes.padding),
        homeService(),
        SizedBox(height: AppSizes.padding),
        textList(),
      ],
    );
  }

  Widget deliveryService() {
    return ItemCardListSelectedDone(
      title: 'Cuci Kering',
      isSelected: true,
      morePayment: 'Rp2.500',
      shuttlePayment: 'Free',
      textButton: 'Free Pembayaran Wallet Platform',
      onTapButton: () {
        // TODO
      },
    );
  }

  Widget dropService() {
    return ItemCardListSelectedDone(
      title: 'Drop Service',
      isSelected: true,
      subtitle: Text(
        'Serahkan laundry anda ke petugas toko',
        style: AppTextStyle.medium(
          size: 12,
          color: AppColors.blackLv5,
        ),
      ),
      textButton: 'Pembayaran di Kasir Outlet',
      selectedColor: AppColors.orangeLv1,
      iconTitle: const Icon(
        CustomIcon.boxIcon,
        color: AppColors.black,
      ),
      onTapButton: () {
        // TODO
      },
    );
  }

  Widget selfService() {
    return ItemCardListSelectedDone(
      title: 'Self Service',
      isSelected: true,
      subtitle: Text(
        'Layanan laundry secara mandiri menggunakan smartphone dan mesin cuci pintar di toko',
        style: AppTextStyle.medium(
          size: 12,
          color: AppColors.blackLv5,
        ),
      ),
      textButton: 'Scan QRcode Mesin Cuci di Outlet',
      selectedColor: AppColors.greenLv3,
      iconTitle: const Icon(
        CustomIcon.scanIcon,
        color: AppColors.black,
      ),
      onTapButton: () {
        // TODO
      },
    );
  }

  Widget homeService() {
    return ItemCardListSelectedDone(
      title: 'Self Service',
      isSelected: true,
      subtitle: Text(
        'Serahkan laundry anda ke petugas toko',
        style: AppTextStyle.medium(
          size: 12,
          color: AppColors.blackLv5,
        ),
      ),
      textButton: 'Pembayaran di Rumah',
      selectedColor: AppColors.redLv2,
      iconTitle: const Icon(
        CustomIcon.homeIcon,
        color: AppColors.black,
      ),
      onTapButton: () {
        // TODO
      },
    );
  }

  bool wrapText = true;

  Widget textList() {
    return AppColumnInk(
      children: [
        RichText(
          text: TextSpan(
            style: AppTextStyle.medium(size: 14),
            children: [
              TextSpan(
                text: wrapText == true ? 'Lolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut' : 'Lolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut Lolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut',
              ),
              TextSpan(
                text: wrapText == true ? ' Read More...' : ' Close',
                style: AppTextStyle.medium(
                  size: 12,
                  color: AppColors.primary,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    wrapText = !wrapText;
                    setState(() {});
                  },
              ),
            ],
          ),
        ),
        SizedBox(height: AppSizes.padding * 1.5),
        Text(
          'Lolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut Read more...',
          style: AppTextStyle.medium(size: 14),
        ),
        SizedBox(height: AppSizes.padding * 2),
      ],
    );
  }
}
