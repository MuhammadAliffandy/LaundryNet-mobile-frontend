import 'package:alvamind_library/app/const/countries.dart';
import 'package:alvamind_library/app/theme/app_text_style.dart';
import 'package:alvamind_library/model/country_model.dart';
import 'package:alvamind_library/model/drop_down_model.dart';
import 'package:alvamind_library/widget/atom/app_divider.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_drop_down.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/organism/tags_organism.dart/tags_organism.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';

class CustomerFilterView extends StatefulWidget {
  static const routeName = '/customer-filter-screen';

  const CustomerFilterView({
    super.key,
  });

  @override
  State<CustomerFilterView> createState() => _CustomerFilterViewState();
}

class _CustomerFilterViewState extends State<CustomerFilterView> {
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
          'Filter Konsumen',
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
        tagSorting(),
        tagCategory(),
        tagGender(),
        locationDropDown(),
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

  Widget tagSorting() {
    return headlineText(
      'Urutkan',
      [
        TagsOrganism(
          paddingTagsBody: EdgeInsets.only(left: AppSizes.padding),
          listChips: const [
            'Semua',
            'A - z',
            'Z - A',
            'Terbaru',
            'Terlama',
          ],
          onTap: (value) {
            // TODO
          },
        ),
      ],
      EdgeInsets.only(bottom: AppSizes.padding),
    );
  }

  Widget tagGender() {
    return headlineText(
      'Gender',
      [
        TagsOrganism(
          paddingTagsBody: EdgeInsets.only(left: AppSizes.padding),
          listChips: const [
            'Semua',
            'Laki-Laki',
            'Perempuan',
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
        'Konsumen Outlet',
        [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
            child: AppDropDown(
              onTapItem: (item) {
                _country = countries.firstWhere((e) => e.countryCode == item.value);
              },
              hintText: 'Barokah Laundry',
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
}
