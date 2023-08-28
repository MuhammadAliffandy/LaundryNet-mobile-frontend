import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_image.dart';
import 'package:alvamind_library/widget/molecule/app_account_list.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_chips.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_expansion_list_tile.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_ink_container.dart';
import 'package:alvamind_library/widget/molecule/app_modal.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_progress_line.dart';
import 'package:alvamind_library/widget/molecule/app_snackbar.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list_selected.dart';
import 'package:alvamind_library/widget/organism/order_card/order_card.dart';
import 'package:alvamind_library/widget/organism/transaction_review_card/list_card_progress.dart';
import 'package:alvamind_library/widget/organism/transaction_review_card/list_transaction.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class ComplainDetailOwnerView extends StatefulWidget {
  static const viewAsOwner = '/complain-detail-owner-screen';

  const ComplainDetailOwnerView({super.key});

  @override
  State<ComplainDetailOwnerView> createState() => _ComplainDetailOwnerViewState();
}

ScrollController? _controller;

class _ComplainDetailOwnerViewState extends State<ComplainDetailOwnerView> {
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
        price: false,
        children: [
          Expanded(
            child: AppButton(
              onTap: () {},
              text: 'Batalkan Komplain',
              rounded: true,
              buttonColor: AppColors.blueLv5,
              textColor: AppColors.primary,
            ),
          ),
          SizedBox(
            width: AppSizes.padding / 2,
          ),
          Expanded(
            child: AppButton(
              onTap: () {},
              text: 'Terima Solusi',
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
    return AppColumnInk(
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
                  'Detail Komplain',
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
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        statusComplain(),
        SizedBox(height: AppSizes.padding * 1.5),
        statusCard(),
        SizedBox(height: AppSizes.padding * 1.5),
        complainDiscusion(),
        SizedBox(height: AppSizes.padding * 1.5),
        detailnfoComplain(),
        SizedBox(height: AppSizes.padding * 1.5),
        problem(),
        SizedBox(height: AppSizes.padding * 1.5),
        problemDescription(),
        SizedBox(height: AppSizes.padding * 1.5),
        solution(),
        SizedBox(height: AppSizes.padding * 1.5),
        photoProof(),
        SizedBox(height: AppSizes.padding * 1.5),
        selectItem(),
        SizedBox(height: AppSizes.padding * 1.5),
        orderCard(),
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
      rightIcon: Icons.chevron_right_rounded,
      title: 'Status Komplain',
      isSubtitle: false,
      textTags: 'Solusi Diajukan',
      onTapChevronButton: () {
        // TODO
      },
      onTapCard: () {
        // TODO
      },
      moreWidget: Padding(
        padding: EdgeInsets.only(top: AppSizes.padding),
        child: AppProgressLine(
          maxValue: 100,
          value: 40,
          showLabel: false,
        ),
      ),
    );
  }

  Widget statusCard() {
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

  bool selected = false;

  Widget complainDiscusion() {
    return AppExpansionListTile(
      backgroundColor: AppColors.white,
      title: 'Diskusi Komplain',
      paddingChild: EdgeInsets.all(AppSizes.padding),
      showExpandButton: false,
      expand: true,
      gap: true,
      moreItem: AppChips(
        fontSize: 14,
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.padding / 2,
          horizontal: AppSizes.padding,
        ),
        text: 'Chat',
        leftIcon: CustomIcon.chatBoldIcon,
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        isSelected: selected,
      ),
      children: [
        AccountList(
          rightButton: false,
          image: 'https://picsum.photos/221/300',
          title: 'Brandon KEnt',
          subtitle: 'Jadi tadi malam saya sudah menerima sebuah paket nya tapui',
          rightItem: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                maxRadius: 12,
                backgroundColor: AppColors.blueLv2,
                child: Text(
                  '3',
                  style: AppTextStyle.regular(
                    size: 10,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.padding / 2,
              ),
              Text(
                '20.00',
                style: AppTextStyle.medium(
                  size: 14,
                  color: AppColors.blackLv4,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget detailnfoComplain() {
    return ListTransaction(
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv7,
          offset: Offset(0, 4),
          blurRadius: 60,
          spreadRadius: -10,
        ),
      ],
      isComplain: true,
      complainId: '5457383979',
      dateComplain: '20 Agustus 2023',
      orderId: '53240679',
      consument: 'Brandon Kent',
      onTapCopyComplainId: () {
        // TODO
        final navigator = Navigator.of(context);
        snackBar(navigator);
      },
      onTapCopyOrderId: () {
        // TODO
        final navigator = Navigator.of(context);
        snackBar(navigator);
      },
    );
  }

  Widget problem() {
    return expanelTextWrap('Masalah', 'Kerusakan');
  }

  Widget problemDescription() {
    return expanelTextWrap(
      'Deskripsi Masalah',
      'Lorem ipsum dolor sit amet consectetur. Senectus faucibus quis viverra tortor consequat mauris fusce. In mi aliquam ultricies tellus aliquam duis. Id suspendisse lorem erat vulputate sagittis odio eu facilisis. Sed egestas sit at in in nunc ipsum et.',
    );
  }

  Widget solution() {
    return expanelTextWrap('Solusi yang diharapkan', 'Pengembalian dana penuh');
  }

  Widget expanelTextWrap(String title, String text) {
    return AppExpansionListTile(
      backgroundColor: AppColors.white,
      title: title,
      paddingChild: EdgeInsets.all(AppSizes.padding),
      expand: true,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: AppTextStyle.medium(size: 14),
            softWrap: true,
            overflow: TextOverflow.clip,
          ),
        )
      ],
    );
  }

  Widget photoProof() {
    return AppExpansionListTile(
      subtitle: 'Bukti Foto',
      backgroundColor: AppColors.white,
      expand: true,
      isDisabled: true,
      showExpandButton: false,
      paddingChild: EdgeInsets.all(AppSizes.padding),
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(3, (index) {
                return Padding(
                  padding: index == 2 ? const EdgeInsets.all(0) : EdgeInsets.only(right: AppSizes.padding),
                  child: const AppImage(
                    image: randomImage,
                    width: 100,
                    height: 100,
                    borderRadius: 20,
                  ),
                );
              })
            ],
          ),
        )
      ],
    );
  }

  Widget selectItem() {
    return AppExpansionListTile(
      paddingChild: EdgeInsets.all(AppSizes.padding),
      backgroundColor: AppColors.white,
      subtitle: 'Item Yang Bermasalah',
      isDisabled: true,
      showExpandButton: false,
      expand: true,
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv7,
          offset: Offset(0, 4),
          blurRadius: 60,
          spreadRadius: -10,
        ),
      ],
      children: const [
        ItemCardListSelected(
          starImageCount: '50',
          title: 'Cuci Kering',
          isList: false,
          textPrice: 'Rp7rb',
          statusPrice: '/kg',
          typeItem: 'Pakaian',
          dateProgress: '2 Agustus 2023',
          boxShadow: [
            BoxShadow(
              color: AppColors.blackLv7,
              offset: Offset(0, 4),
              blurRadius: 60,
              spreadRadius: -10,
            ),
          ],
        ),
      ],
    );
  }

  Widget orderCard() {
    return const AppInkContainer(
      padding: EdgeInsets.all(0),
      child: OrderCard(
        starImageCount: '50',
        title: 'Barokah Laundry',
        isProgress: true,
        textPrice: 'Rp42.431',
        statusPrice: '/00 days',
        dateProgress: '2 Agustus 2023',
        textLeftButton: 'Detail Pesanan',
        textRightButton: 'Lacak Pengiriman',
        labelingCount: 80,
        showButton: false,
        tagBorderColor: AppColors.greenLv1,
        tagText: 'Selesai',
        tagTextColor: AppColors.greenLv1,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackLv7,
            offset: Offset(0, 4),
            blurRadius: 60,
            spreadRadius: -10,
          ),
        ],
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
