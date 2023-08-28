import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_divider.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_expansion_list_tile.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_modal.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_progress_line.dart';
import 'package:alvamind_library/widget/molecule/app_tags.dart';
import 'package:alvamind_library/widget/molecule/app_transaction_info.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list_selected.dart';
import 'package:alvamind_library/widget/organism/transaction_review_card/list_card_progress.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class OutletOrderDetailOwnerView extends StatefulWidget {
  static const viewAsOwner = '/outlet-order-detail-owner-screen';

  const OutletOrderDetailOwnerView({super.key});

  @override
  State<OutletOrderDetailOwnerView> createState() => _OutletOrderDetailOwnerViewState();
}

class _OutletOrderDetailOwnerViewState extends State<OutletOrderDetailOwnerView> {
  ScrollController? _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller?.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller!.offset >= _controller!.position.maxScrollExtent && !_controller!.position.outOfRange) {
      AppModal.show(
        Navigator.of(context),
        price: false,
        children: [],
        moreWidget: [
          AppColumnInk(
            children: [
              AppButton(
                rounded: true,
                text: 'Download  Nota',
                onTap: () {
                  // TODO
                },
              ),
              SizedBox(
                height: AppSizes.padding / 2,
              ),
              AppButton(
                rounded: true,
                buttonColor: AppColors.blueLv5,
                textColor: AppColors.primary,
                text: 'Cetak Nota',
                onTap: () {
                  // TODO
                },
              )
            ],
          ),
        ],
      );

      setState(() {});
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
          'Detail Pesanan',
          style: AppTextStyle.bold(size: 24),
        ),
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        barcode(),
        SizedBox(height: AppSizes.padding * 1.5),
        statusComplain(),
        SizedBox(height: AppSizes.padding * 1.5),
        orderStatus(),
        SizedBox(height: AppSizes.padding * 1.5),
        orderDetailPanel(),
        SizedBox(height: AppSizes.padding * 1.5),
        paymentInformation(),
        SizedBox(height: AppSizes.padding * 1.5),
        itemOrderPanel(),
        SizedBox(height: AppSizes.padding * 1.5),
        consumenPanel(),
        SizedBox(height: AppSizes.padding * 1.5),
        consumenAddressPanel(),
        SizedBox(height: AppSizes.padding * 1.5),
        statusComplain(),
        SizedBox(height: AppSizes.padding * 1.5),
        summaryPayment(),
        SizedBox(height: AppSizes.padding * 4),
      ],
    );
  }

  Widget barcode() {
    return BarcodeWidget(
      height: AppSizes.padding * 8,
      textPadding: AppSizes.padding,
      barcode: Barcode.code128(),
      data: '22322 227226',
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

  Widget orderStatus() {
    return ListCard(
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv7,
          offset: Offset(0, 4),
          blurRadius: 60,
          spreadRadius: -10,
        ),
      ],
      rightIcon: Icons.chevron_right_rounded,
      title: 'Status Pesanan',
      isSubtitle: false,
      textTags: 'Sedang diproses',
      tagTextColor: AppColors.yellowLv1,
      tagBorderColor: AppColors.yellowLv1,
      moreWidget: Padding(
        padding: EdgeInsets.only(top: AppSizes.padding),
        child: AppProgressLine(
          maxValue: 100,
          value: 40,
          label: 'Progress Keseluruhan',
        ),
      ),
      onTapChevronButton: () {
        // TODO
      },
      onTapCard: () {
        // TODO
      },
    );
  }

  Widget orderDetailPanel() {
    return AppExpansionListTile(
      title: 'Informasi Pesanan',
      backgroundColor: AppColors.white,
      expand: true,
      paddingChild: EdgeInsets.zero,
      children: [
        orderDetailList(),
        SizedBox(
          height: AppSizes.padding,
        ),
        complainStatusList(),
      ],
    );
  }

  Widget orderDetailList() {
    return AppCardContainer(
      boxShadow: const [],
      child: AppColumnInk(
        children: [
          const AppTransactionInfo(
            textTitle: 'ID Pemesanan',
            transactionId: '5457383979',
            transactionStatus: 'Paid',
            onlyTrasactionId: true,
            dotChillPadding: EdgeInsets.all(0),
            dotColor: AppColors.transparent,
          ),
          const AppTransactionInfo(
            textTitle: 'Tanggal Pemesanan',
            transactionId: 'Selasa, 23 Juni 2023 14:00',
            transactionStatus: 'Paid',
            onlyTrasactionId: true,
            dotChillPadding: EdgeInsets.all(0),
            dotColor: AppColors.transparent,
            withIcon: false,
          ),
          AppTransactionInfo(
            textTitle: 'Produksi',
            transactionId: '23-25 Juni 2023',
            transactionStatus: 'Paid',
            onlyTrasactionId: true,
            withIcon: false,
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
            textTitle: 'Berat Pesanan',
            transactionId: '10 Kg',
            transactionStatus: 'Paid',
            onlyTrasactionId: true,
            dotChillPadding: EdgeInsets.all(0),
            dotColor: AppColors.transparent,
            withIcon: false,
            onTapCopyButton: () {
              // TODO
            },
          ),
          AppTransactionInfo(
            textTitle: 'Berat Timbangan Kasir',
            transactionId: '8 Kg',
            onlyTrasactionId: true,
            transactionStatus: 'Belum Terbayar',
            dotChillPadding: EdgeInsets.all(0),
            dotColor: AppColors.transparent,
            withIcon: false,
            transactionStatusColor: AppColors.redLv1,
            onTapCopyButton: () {
              // TODO
            },
          ),
        ],
      ),
    );
  }

  Widget complainStatusList() {
    return AppColumnInk(
      children: [
        ...List.generate(3, (index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: AppSizes.padding,
              left: AppSizes.padding,
              right: AppSizes.padding,
            ),
            child: ListCard(
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
            ),
          );
        })
      ],
    );
  }

  Widget paymentInformation() {
    return AppExpansionListTile(
      backgroundColor: AppColors.white,
      title: 'Informasi Pembayaran',
      expand: true,
      children: [
        AppCardContainer(
          boxShadow: const [],
          child: AppColumnInk(
            children: [
              const AppTransactionInfo(
                textTitle: 'ID Pembayran',
                transactionId: '5457383979',
                transactionStatus: 'Paid',
                onlyTrasactionId: true,
                dotChillPadding: EdgeInsets.all(0),
                dotColor: AppColors.transparent,
              ),
              const AppTransactionInfo(
                textTitle: 'Tanggal Pembayaran',
                transactionId: 'Selasa, 23 Juni 2023\n14:00',
                transactionStatus: 'Paid',
                onlyTrasactionId: true,
                dotChillPadding: EdgeInsets.all(0),
                dotColor: AppColors.transparent,
                withIcon: false,
              ),
              AppTransactionInfo(
                textTitle: 'Metode Pembayaran',
                transactionId: 'BCA Virtual Account',
                transactionStatus: 'Lunas',
                transactionStatusColor: AppColors.greenLv1,
                withIcon: false,
                dotChillPadding: EdgeInsets.all(0),
                dotColor: AppColors.transparent,
                onTapCopyButton: () {
                  // TODO
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget itemOrderPanel() {
    return AppExpansionListTile(
      paddingChild: EdgeInsets.all(AppSizes.padding),
      backgroundColor: AppColors.white,
      title: 'Item Pemesanan',
      expand: true,
      moreItem: const AppTags(
        text: '3 Item',
        color: AppColors.transparent,
        borderWidth: 1,
        borderColor: AppColors.blackLv5,
        textColor: AppColors.blackLv5,
      ),
      children: [
        ...List.generate(3, (index) {
          return Padding(
            padding: index == 3
                ? const EdgeInsets.all(0)
                : EdgeInsets.only(
                    bottom: AppSizes.padding,
                  ),
            child: ItemCardListSelected(
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackLv7.withOpacity(0.5),
                  offset: Offset(0, 4),
                  blurRadius: 60,
                  spreadRadius: 0,
                ),
              ],
              starImageCount: '50',
              title: 'Cuci Kering',
              typeItem: 'Pakaian',
              textPrice: '4',
              statusPrice: '/pcs',
              dateProgress: '2 Agustus 2023',
              textLeftButton: 'Lacak Status',
              textRightButton: 'Next Status',
              isStatus: true,
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

  Widget consumenPanel() {
    return AppExpansionListTile(
      title: 'Konsumen',
      backgroundColor: AppColors.white,
      expand: true,
      paddingChild: EdgeInsets.all(AppSizes.padding),
      children: [
        ItemCardList(
          dateProfileItem: '+62 85177812345',
          starImageCount: '50',
          title: 'Anton Kurniawan',
          dateProgress: '2 Agustus 2023',
          address: 'Jl. Sukamenak DPR RI KOM Kabupaten Prov...',
          isProfile: true,
          isCustomer: true,
          isOwner: true,
          showTag: false,
          textLeftButton: 'Detail Konsumen',
          textRightButton: 'Whatsapp',
          fontSizeButton: 12,
          boxShadow: const [
            BoxShadow(
              color: AppColors.blackLv7,
              offset: Offset(0, 4),
              blurRadius: 60,
              spreadRadius: 0,
            ),
          ],
        ),
      ],
    );
  }

  Widget consumenAddressPanel() {
    return AppExpansionListTile(
      title: 'Alamat Ambil & Antar',
      backgroundColor: AppColors.white,
      expand: true,
      paddingChild: EdgeInsets.all(AppSizes.padding),
      children: [
        ItemCardList(
          dateProfileItem: '+62 85177812345',
          starImageCount: '50',
          title: 'Anton Kurniawan',
          dateProgress: '2 Agustus 2023',
          address: 'Jl. Sukamenak DPR RI KOM Kabupaten Prov...',
          isProfile: true,
          isOwner: true,
          showTag: false,
          showHeartButton: false,
          textLeftButton: 'Detail Alamat',
          textRightButton: 'Petunjuk Peta',
          tagText: 'Pin Point',
          tagColor: AppColors.greenLv1,
          fontSizeButton: 12,
          rightIconButton: Icons.location_on,
          onTapLeftButton: () {
            // TODO
          },
          onTapRightButton: () {
            // TODO
          },
          boxShadow: const [
            BoxShadow(
              color: AppColors.blackLv7,
              offset: Offset(0, 4),
              blurRadius: 60,
              spreadRadius: 0,
            ),
          ],
        ),
      ],
    );
  }

  Widget summaryPayment() {
    return AppCardContainer(
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv7,
          offset: Offset(0, 4),
          blurRadius: 60,
          spreadRadius: 0,
        ),
      ],
      child: AppColumnInk(children: [
        Text(
          'Ringkasan Pembayaran',
          style: AppTextStyle.bold(size: 16),
        ),
        SizedBox(
          height: AppSizes.padding,
        ),
        const AppTransactionInfo(
          textTitle: 'Layanan 3 item',
          transactionId: 'Rp 65.000',
          transactionStatus: 'Paid',
          onlyTrasactionId: true,
          dotChillPadding: EdgeInsets.all(0),
          dotColor: AppColors.transparent,
        ),
        AppDivider(
          thickness: 2,
          color: AppColors.blackLv8,
          padding: EdgeInsets.only(bottom: AppSizes.padding),
        ),
        const AppTransactionInfo(
          textTitle: 'Pajak',
          transactionId: 'Rp 7.000',
          transactionStatus: 'Paid',
          onlyTrasactionId: true,
          dotChillPadding: EdgeInsets.all(0),
          dotColor: AppColors.transparent,
        ),
        AppTransactionInfo(
          textTitle: 'Ongkos Ambil & Antar',
          transactionId: 'Rp 4.300',
          transactionStatus: 'Lunas',
          transactionStatusColor: AppColors.greenLv1,
          onlyTrasactionId: true,
          dotChillPadding: EdgeInsets.all(0),
          dotColor: AppColors.transparent,
          onTapCopyButton: () {
            // TODO
          },
        ),
      ]),
    );
  }
}
