import 'package:alvamind_library/app/const/countries.dart';
import 'package:alvamind_library/app/theme/app_text_style.dart';
import 'package:alvamind_library/model/country_model.dart';
import 'package:alvamind_library/model/drop_down_model.dart';
import 'package:alvamind_library/widget/atom/app_divider.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_drop_down.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_range_slider.dart';
import 'package:alvamind_library/widget/organism/tags_organism.dart/tags_organism.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';

class FilterScreenView extends StatefulWidget {
  static const routeName = '/filter-screen';

  const FilterScreenView({
    super.key,
  });

  @override
  State<FilterScreenView> createState() => _FilterScreenViewState();
}

class _FilterScreenViewState extends State<FilterScreenView> {
  CountryModel _country = countries.first;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.white,
      body: AppNestedScrollView(
        pinned: true,
        title: appBar(),
        body: body(),
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 0,
        ),
      ),
    );
  }

  Widget appBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppIconButton(
          icon: const Icon(Icons.close),
          buttonColor: AppColors.transparent,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        Text(
          'Filter',
          style: AppTextStyle.bold(size: 24),
        ),
        SizedBox(
          width: AppSizes.padding * 2,
        )
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        AppDivider(
          thickness: 2,
          color: AppColors.blackLv8,
          padding: EdgeInsets.all(
            AppSizes.padding,
          ),
        ),
        ...List.generate(3, (index) {
          return tagCategory();
        }),
        priceRange(),
        tagFacilities(),
        locationDropDown(),
        tagReview(),
        AppDivider(
          thickness: 2,
          color: AppColors.blackLv8,
          padding: EdgeInsets.all(
            AppSizes.padding,
          ),
        ),
        buttonDown(),
        SizedBox(height: AppSizes.padding * 2)
      ],
    );
  }

  Widget tagCategory() {
    return headlineText(
      'Category',
      [
        TagsOrganism(
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
      ],
      EdgeInsets.only(bottom: AppSizes.padding),
    );
  }

  double lower = 5;
  double upper = 10;

  Widget priceRange() {
    return headlineText(
      'Price Range',
      [
        SizedBox(
          height: AppSizes.padding / 1.5,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
          child: AppRangeSlider(
            lowerValue: lower,
            upperValue: upper,
            leftPrefix: Text(
              'Rp ',
              style: AppTextStyle.medium(size: 14, color: AppColors.white),
            ),
            rightPrefix: Text(
              'Rp ',
              style: AppTextStyle.medium(size: 14, color: AppColors.white),
            ),
            onDragging: (value, lowerValue, upperValue) {
              setState(() {
                lower = lowerValue;
                upper = upperValue;
              });
            },
          ),
        )
      ],
      EdgeInsets.only(bottom: AppSizes.padding),
    );
  }

  Widget tagFacilities() {
    return headlineText(
      'Facilities',
      [
        TagsOrganism(
          paddingTagsBody: EdgeInsets.only(left: AppSizes.padding),
          leftIcon: Icons.star_rounded,
          listChips: const [
            'Semua',
            '5',
            '4',
            '3',
            '2',
          ],
          onTap: (value) {
            // TODO
          },
        ),
      ],
      EdgeInsets.only(bottom: AppSizes.padding),
    );
  }

  Widget tagReview() {
    return headlineText(
      'Ulasan',
      [
        TagsOrganism(
          paddingTagsBody: EdgeInsets.only(left: AppSizes.padding),
          leftIcon: Icons.star_rounded,
          listChips: const [
            'Semua',
            '5',
            '4',
            '3',
            '2',
          ],
          onTap: (value) {
            // TODO
          },
        ),
      ],
      EdgeInsets.only(bottom: AppSizes.padding),
    );
  }

  Widget locationDropDown() {
    return headlineText(
        'Lokasi',
        [
          Padding(
            padding: EdgeInsets.all(AppSizes.padding),
            child: AppDropDown(
              onTapItem: (item) {
                _country = countries.firstWhere((e) => e.countryCode == item.value);
              },
              hintText: 'Pilih Lokasi...',
              selectedItem: _country.name,
              items: List.generate(
                countries.length,
                (i) => DropDownModel(text: countries[i].name, value: countries[i].countryCode),
              ),
              itemsBuilder: (item) {
                return Text(
                  item.text,
                  style: AppTextStyle.semibold(size: 12),
                );
              },
            ),
          )
        ],
        EdgeInsets.only(bottom: AppSizes.padding));
  }

  Widget headlineText(
    String title,
    List<Widget> children,
    EdgeInsets padding,
  ) {
    return Padding(
      padding: padding,
      child: AppColumnInk(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
            child: Text(
              title,
              style: AppTextStyle.bold(size: 18),
            ),
          ),
          SizedBox(
            height: AppSizes.padding,
          ),
          ...children
        ],
      ),
    );
  }

  Widget buttonDown() {
    return AppLongCard(
      padding: EdgeInsets.only(
        top: AppSizes.padding,
        right: AppSizes.padding,
        left: AppSizes.padding,
      ),
      children: [
        Expanded(
          child: AppButton(
            text: 'Reset',
            textColor: AppColors.primary,
            buttonColor: AppColors.blueLv5,
            onTap: () {},
            rounded: true,
          ),
        ),
        SizedBox(width: AppSizes.padding / 1.5),
        Expanded(
          child: AppButton(
            rounded: true,
            text: 'Terapkan',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
