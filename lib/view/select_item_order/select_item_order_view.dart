import 'package:alvamind_library/app/theme/app_sizes.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_modal.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list_selected.dart';
import 'package:alvamind_library/widget/organism/tags_organism.dart/tags_organism.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class SelectItemOrderView extends StatefulWidget {
  static const routeName = '/select-item-order-screen';

  const SelectItemOrderView({super.key});

  @override
  State<SelectItemOrderView> createState() => _SelectItemOrderViewState();
}

int tagSelected = 0;
int itemSelectedCount = 0;
List<bool> isSelected = [
  ...List.generate(5, (index) {
    return false;
  })
];
ScrollController? _controller;

class _SelectItemOrderViewState extends State<SelectItemOrderView> {
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
        miniTitle: 'Yakin Memilih $itemSelectedCount item ini ?',
        directionButton: Axis.horizontal,
        price: false,
        children: [
          Expanded(
            child: AppButton(
              onTap: () {
                Navigator.of(context).pop();
              },
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
        expandedHeight: 180,
        collapseHeight: 130,
        title: appBar(),
        titlePadding: EdgeInsets.only(
          top: AppSizes.padding,
          bottom: AppSizes.padding,
        ),
        background: flexibleAppBar(),
        titleFlexible: tag(),
        body: body(),
      ),
    );
  }

  Widget tag() {
    return Container(
      color: AppColors.white,
      child: TagsOrganism(
        paddingTagsBody: EdgeInsets.only(left: AppSizes.padding),
        listChips: const [
          'Semua',
          'Pakaian',
          'Alat tidur',
          'Karpet',
        ],
        onTap: (value) {
          // TODO
          tagSelected = value;
        },
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Item Pesanan Anda',
              style: AppTextStyle.bold(size: 24),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'ID Order 232355667',
              style: AppTextStyle.medium(size: 12),
            ),
          ],
        )
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        itemSelectedList(),
      ],
    );
  }

  Widget flexibleAppBar() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.padding,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: AppColumnInk(
          children: [
            SizedBox(
              height: AppSizes.padding,
            ),
            Text(
              'Silahkan memilih item layanan yang ingin anda\nkomplain',
              style: AppTextStyle.medium(size: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemSelectedList() {
    return AppColumnInk(children: [
      ...List.generate(5, (index) {
        return Padding(
          padding: index == 4 ? const EdgeInsets.all(0) : EdgeInsets.only(bottom: AppSizes.padding),
          child: ItemCardListSelected(
            image: 'https://picsum.photos/23$index/300',
            starImageCount: '50',
            title: 'Cuci Kering',
            isSelected: isSelected[index],
            textPrice: 'Rp7rb',
            statusPrice: '/kg',
            typeItem: 'Pakaian',
            timeWork: '3 Hari Kerja',
            dateProgress: '2 Agustus 2023',
            boxShadow: const [
              BoxShadow(
                color: AppColors.blackLv7,
                offset: Offset(0, 4),
                blurRadius: 60,
                spreadRadius: -10,
              ),
            ],
            onTapCard: () {
              // TODO
              setState(() {
                isSelected[index] = !isSelected[index];
                isSelected[index] == true ? itemSelectedCount++ : itemSelectedCount--;
              });
            },
          ),
        );
      })
    ]);
  }
}
