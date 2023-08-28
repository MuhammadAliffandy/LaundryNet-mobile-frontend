import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/model/drop_down_model.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_drop_down.dart';
import 'package:alvamind_library/widget/molecule/app_expansion_list_tile.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';
import 'package:alvamind_library/widget/molecule/app_modal.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_snackbar.dart';
import 'package:alvamind_library/widget/organism/accordion/accordion_question_card.dart';
import 'package:alvamind_library/widget/organism/transaction_review_card/list_card_progress.dart';
import 'package:alvamind_library/widget/organism/transaction_review_card/list_transaction.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class QRPaymentView extends StatefulWidget {
  static const routeName = '/qr-payment-screen';

  const QRPaymentView({super.key});

  @override
  State<QRPaymentView> createState() => _QRPaymentViewState();
}

ScrollController? _controller;

class _QRPaymentViewState extends State<QRPaymentView> {
  @override
  void initState() {
    _controller = ScrollController();
    _controller?.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller!.offset >= _controller!.position.maxScrollExtent && !_controller!.position.outOfRange) {
      setState(() {});
      final navigator = Navigator.of(context);
      AppModal.show(
        navigator,
        backgroundColor: AppColors.white,
        miniTitle: 'Sudah melakukan pembayaran?',
        subtitle: 'Pesananmu Akan Diproses Jika Pembayaranmu Telah Terverifikasi',
        subtitleColor: AppColors.black,
        directionButton: Axis.horizontal,
        price: false,
        children: [
          Expanded(
            child: AppButton(
              onTap: () {},
              text: 'Batalkan Pesanan',
              textColor: AppColors.primary,
              buttonColor: AppColors.blueLv5,
              rounded: true,
            ),
          ),
          SizedBox(width: AppSizes.padding / 2),
          Expanded(
            child: AppButton(
              onTap: () {},
              text: 'Konfirmasi',
              rounded: true,
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AppNestedScrollView(
        controller: _controller,
        title: appBar(),
        body: body(),
      ),
    );
  }

  Widget appBar() {
    return AppLongCard(
      backgroundColor: AppColors.transparent,
      padding: EdgeInsets.all(0),
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
            Text(
              'Pembayaran QRIS',
              style: AppTextStyle.bold(size: 24),
            ),
          ],
        ),
        Row(
          children: [
            AppIconButton(
              icon: const Icon(
                CustomIcon.notificationIcon,
                color: AppColors.primary,
              ),
              buttonColor: AppColors.transparent,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            dropDown(),
            SizedBox(width: AppSizes.padding),
          ],
        ),
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        SizedBox(height: AppSizes.padding / 4),
        listCard(),
        SizedBox(height: AppSizes.padding * 1.5),
        qrCard(),
        SizedBox(height: AppSizes.padding * 1.5),
        detailTransaction(),
        SizedBox(height: AppSizes.padding * 1.5),
        infoPayment(),
        SizedBox(height: AppSizes.padding * 4),
      ],
    );
  }

  Widget infoPayment() {
    return AppExpansionListTile(
      title: 'Cara Pembayaran',
      backgroundColor: AppColors.white,
      expand: true,
      children: [
        QuestionText(
          padding: EdgeInsets.all(0),
          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          backgroundColor: AppColors.transparent,
        )
      ],
    );
  }

  Widget detailTransaction() {
    return ListTransaction(
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv7,
          offset: Offset(0, 4),
          blurRadius: 60,
          spreadRadius: -10,
        ),
      ],
      isTransaction: true,
      transactionId: '5457383979',
      adminPayment: 'Rp 2.500',
      bill: 'Rp 52.414',
      count: 'Rp 56.414',
      status: 'Belum Terbayar',
      statusColor: AppColors.redLv1,
      onTapCopyTransactionId: () {
        // TODO
        final navigator = Navigator.of(context);
        snackBar(navigator);
      },
      onTapCopyCount: () {
        // TODO
        final navigator = Navigator.of(context);
        snackBar(navigator);
      },
    );
  }

  Widget qrCard() {
    return AppCardContainer(
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv7,
          offset: Offset(0, 4),
          blurRadius: 60,
          spreadRadius: -10,
        ),
      ],
      child: AppColumnInk(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(AppSizes.padding),
            child: Image.network(
              'https://cdn.britannica.com/17/155017-050-9AC96FC8/Example-QR-code.jpg',
            ),
          ),
          Text(
            'Barokah Laundry',
            style: AppTextStyle.medium(size: 16),
          ),
          Text(
            'NMID : ID1287645162378',
            style: AppTextStyle.medium(size: 12),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.padding * 4,
              vertical: AppSizes.padding / 1.5,
            ),
            child: AppButton(
                buttonColor: AppColors.transparent,
                borderColor: AppColors.primary,
                textColor: AppColors.primary,
                leftIcon: CustomIcon.downloadBoldIcon,
                borderWidth: 1,
                text: 'Download QRIS Code',
                fontSize: 14,
                rounded: true,
                padding: EdgeInsets.all(AppSizes.padding / 4),
                onTap: () {
                  // TODO
                }),
          ),
        ],
      ),
    );
  }

  Widget listCard() {
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

  List<String> itemText = [
    'Download QRIS',
    'Batalkan transaksi'
  ];
  Widget dropDown() {
    return SizedBox(
      width: 40,
      child: AppDropDown(
        onTapItem: (item) {
          return SizedBox.shrink();
        },
        iconsSize: 22,
        suffixIcon: Icons.pending_outlined,
        itemsBackgroundColor: AppColors.white,
        iconsColor: AppColors.black,
        fillColor: AppColors.transparent,
        textStyle: AppTextStyle.semibold(size: 0),
        items: List.generate(
          itemText.length,
          (i) => DropDownModel(text: itemText[i], value: ''),
        ),
        itemsBuilder: (item) {
          return item.text == 'Download QRIS'
              ? Row(
                  children: [
                    const Icon(
                      CustomIcon.downloadIcon,
                      size: 14,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      item.text,
                      style: AppTextStyle.semibold(
                        size: 12,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.check_box,
                      size: 14,
                    ),
                  ],
                )
              : Row(
                  children: [
                    const Icon(
                      Icons.close,
                      size: 14,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      item.text,
                      style: AppTextStyle.semibold(
                        size: 12,
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  snackBar(NavigatorState context) {
    AppSnackbar.show(
      context,
      icon: Icons.info,
      title: 'Berhasil copy ke clipboard',
      titleStyle: AppTextStyle.bold(size: 10, color: AppColors.white),
      backgroundColor: AppColors.greenLv1,
      showCloseButton: true,
    );
  }
}
