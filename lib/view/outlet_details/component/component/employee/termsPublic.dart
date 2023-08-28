import 'package:alvamind_library/widget/atom/app_divider.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_expansion_list_tile.dart';
import 'package:alvamind_library/widget/organism/accordion/accordion_question_card.dart';
import 'package:flutter/material.dart';
import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_sizes.dart';

class TermsPublic extends StatefulWidget {
  @override
  State<TermsPublic> createState() => _TermsPublicState();
}

class _TermsPublicState extends State<TermsPublic> {
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
              SizedBox(
                height: AppSizes.padding,
              ),
              ...List.generate(
                4,
                (index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: AppSizes.padding),
                    child: AppExpansionListTile(
                      title: '${index + 1} Lorem Ipsum dolor sit amet',
                      expand: true,
                      backgroundColor: AppColors.white,
                      children: [
                        QuestionText(
                          padding: EdgeInsets.zero,
                          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        )
                      ],
                    ),
                  );
                },
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
              text: 'Edit Syarat & Ketentuan Toko',
              onTap: () {
                // TODO
              }),
          SizedBox(height: AppSizes.padding),
        ],
      ),
    );
  }
}
