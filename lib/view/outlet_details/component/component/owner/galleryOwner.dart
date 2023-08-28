import 'package:alvamind_library/widget/atom/app_divider.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_image_ink.dart';

import 'package:alvamind_library/widget/organism/tags_organism.dart/tags_organism.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_sizes.dart';

class GalleryOwner extends StatefulWidget {
  @override
  State<GalleryOwner> createState() => _GalleryOwnerState();
}

class _GalleryOwnerState extends State<GalleryOwner> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
          physics: BouncingScrollPhysics(),
          child: AppColumnInk(
            children: [
              SizedBox(height: AppSizes.padding),
              StickyHeader(
                header: Container(
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.white,
                  padding: EdgeInsets.symmetric(vertical: AppSizes.padding / 1.5),
                  child: TagsOrganism(
                    listChips: const [
                      'Semua',
                      'Dari Toko',
                      'Konsumen',
                    ],
                    onTap: (value) {
                      // TODO
                      setState(() {
                        selected = value;
                      });
                    },
                  ),
                ),
                content: Container(
                  height: MediaQuery.of(context).size.height,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    children: List.generate(
                        selected == 1
                            ? 12
                            : selected == 2
                                ? 16
                                : 9, (index) {
                      return Padding(
                        padding: EdgeInsets.all(AppSizes.padding / 3),
                        child: AppImageInk(
                          image: 'https://picsum.photos/id/2$index/200/200',
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.padding * 11),
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
              text: 'Tambah Foto Gallery',
              onTap: () {
                // TODO
              }),
          SizedBox(height: AppSizes.padding),
        ],
      ),
    );
  }
}
