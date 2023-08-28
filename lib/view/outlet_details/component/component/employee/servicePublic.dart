import 'package:alvamind_library/widget/atom/app_divider.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_dialog.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';

import 'package:alvamind_library/widget/organism/item_card/item_card_list_selected.dart';
import 'package:alvamind_library/widget/organism/tags_organism.dart/tags_organism.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/app_text_style.dart';

class ServicePublic extends StatefulWidget {
  @override
  State<ServicePublic> createState() => _ServicePublicState();
}

class _ServicePublicState extends State<ServicePublic> {
  int tagSelected = 0;
  int tagSelected1 = 0;
  int tabBarSelected = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: AppColumnInk(
            children: [
              SizedBox(height: AppSizes.padding),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
                child: AppTextField(
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
              ),
              StickyHeader(
                header: Container(
                  color: AppColors.white,
                  width: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
                  child: TagsOrganism(
                    paddingTagsBody: EdgeInsets.only(
                      left: AppSizes.padding,
                    ),
                    listChips: const [
                      'Semua',
                      'Pakaian',
                      'Alat Tidur',
                      'Karpet',
                    ],
                    onTap: (value) {
                      // TODO
                      setState(() {
                        tagSelected = value;
                      });
                    },
                  ),
                ),
                content: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
                  child: AppColumnInk(
                    children: [
                      Text(
                        '3 Toko',
                        style: AppTextStyle.bold(size: 20),
                      ),
                      SizedBox(height: AppSizes.padding),
                      ...List.generate(6, (i) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: AppSizes.padding),
                          child: ItemCardListSelected(
                            starImageCount: '50',
                            title: 'Cuci Kering',
                            isList: true,
                            textPrice: 'Rp7rb',
                            statusPrice: '/kg',
                            typeItem: 'Pakaian',
                            timeWork: '3 Hari Kerja',
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.blackLv7.withOpacity(0.5),
                                offset: Offset(0, -10),
                                blurRadius: 60,
                                spreadRadius: 0,
                              ),
                            ],
                            dateProgress: '2 Agustus 2023',
                            onTapCard: () {
                              // TODO
                            },
                          ),
                        );
                      }),
                      SizedBox(
                        height: AppSizes.padding * 11,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 60,
          child: bottomButton(),
        ),
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
              text: 'Tambah Layanan',
              onTap: () {
                // TODO
              }),
          SizedBox(height: AppSizes.padding),
        ],
      ),
    );
  }
}
