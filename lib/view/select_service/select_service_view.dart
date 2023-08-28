import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_dialog.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';
import 'package:alvamind_library/widget/molecule/app_modal.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list_selected.dart';
import 'package:alvamind_library/widget/organism/tags_organism.dart/tags_organism.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_text_style.dart';

import '../../app/theme/app_colors.dart';

class SelectServiceView extends StatefulWidget {
  static const routeName = '/select-service-screen';

  const SelectServiceView({super.key});

  @override
  State<SelectServiceView> createState() => _SelectServiceViewState();
}

class _SelectServiceViewState extends State<SelectServiceView> {
  ScrollController? _controller;
  List<bool> isSelected = [
    ...List.generate(5, (index) {
      return false;
    }),
  ];

  List<int> itemCount = [
    ...List.generate(5, (index) {
      return 0;
    })
  ];

  int itemSelected = 0;

  @override
  void initState() {
    _controller = ScrollController();
    _controller?.addListener(_scrollListener);
    super.initState();
  }

  _sumItem() {
    itemSelected = 0;
    for (int i = 0; i <= 5; i++) {
      itemSelected += itemCount[i];
      setState(() {});
    }
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
              Text(
                '$itemSelected Item Terpilih',
                style: AppTextStyle.bold(size: 16),
              ),
              SizedBox(
                height: AppSizes.padding,
              ),
              AppLongCard(
                padding: EdgeInsets.all(0),
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        style: AppTextStyle.regular(size: 10),
                      ),
                      SizedBox(
                        height: AppSizes.padding / 2,
                      ),
                      Text(
                        'Rp35.000',
                        style: AppTextStyle.bold(size: 24, color: AppColors.primary),
                      )
                    ],
                  ),
                  SizedBox(
                    width: AppSizes.padding,
                  ),
                  Expanded(
                    child: AppButton(
                      rounded: true,
                      text: 'Pesan Sekarang',
                      onTap: () {
                        // TODO
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      );
      setState(() {});
    }
    _sumItem();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AppNestedScrollView(
        controller: _controller,
        body: body(),
        collapseHeight: 120,
        expandedHeight: 250,
        titlePadding: EdgeInsets.zero,
        title: appBar(),
        background: backgroundAppBar(),
        titleFlexible: tag(),
      ),
    );
  }

  Widget appBar() {
    return Container(
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
            'Pilih Jenis Layanan',
            style: AppTextStyle.bold(size: 24),
          ),
        ],
      ),
    );
  }

  Widget backgroundAppBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: AppColumnInk(
        children: [
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et...',
            style: AppTextStyle.medium(size: 14),
          ),
          SizedBox(
            height: AppSizes.padding,
          ),
          AppTextField(
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
            hintText: 'Cari Layanan',
            type: AppTextFieldType.search,
          ),
        ],
      ),
    );
  }

  Widget tag() {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
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
        },
      ),
    );
  }

  Widget body() {
    return serviceList();
  }

  Widget serviceList() {
    return AppColumnInk(
      children: [
        ...List.generate(5, (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: AppSizes.padding),
            child: ItemCardListSelected(
              starImageCount: '50',
              title: 'Cuci Kering',
              isSelected: isSelected[index],
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackLv7.withOpacity(0.5),
                  offset: Offset(0, -10),
                  blurRadius: 60,
                  spreadRadius: 0,
                ),
              ],
              textPrice: 'Rp7rb',
              statusPrice: '/kg',
              typeItem: 'Pakaian',
              timeWork: '3 Hari Kerja',
              customSelectedButton: AppLongCard(
                backgroundColor: AppColors.transparent,
                padding: EdgeInsets.symmetric(horizontal: AppSizes.padding / 2),
                children: [
                  Text(
                    'Kuantitas',
                    style: AppTextStyle.bold(
                      size: 14,
                      color: AppColors.white,
                    ),
                  ),
                  Row(
                    children: [
                      AppIconButton(
                        buttonColor: AppColors.white,
                        icon: Icon(
                          Icons.horizontal_rule,
                          size: 16,
                        ),
                        onTap: () {
                          // TODO
                          itemCount[index] != 0 ? itemCount[index]-- : 0;
                          setState(() {});
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
                        child: Text(
                          '${itemCount[index]}',
                          style: AppTextStyle.bold(size: 14, color: AppColors.white),
                        ),
                      ),
                      AppIconButton(
                        buttonColor: AppColors.white,
                        icon: Icon(
                          Icons.add,
                          size: 16,
                        ),
                        onTap: () {
                          // TODO
                          itemCount[index]++;
                          setState(() {});
                        },
                      ),
                    ],
                  )
                ],
              ),
              onTapCard: () {
                isSelected[index] = !isSelected[index];

                setState(() {});
              },
            ),
          );
        })
      ],
    );
  }
}
