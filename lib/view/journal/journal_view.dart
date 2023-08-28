import 'package:alvamind_library/app/const/gender.dart';
import 'package:alvamind_library/model/drop_down_model.dart';
import 'package:alvamind_library/model/gender_model.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_dialog.dart';
import 'package:alvamind_library/widget/molecule/app_drop_down.dart';
import 'package:alvamind_library/widget/molecule/app_expansion_list_tile.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:alvamind_library/widget/organism/table_organism/table_history_trasaction.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class JournalView extends StatefulWidget {
  static const routeName = '/journal-screen';

  const JournalView({super.key});

  @override
  State<JournalView> createState() => _JournalViewState();
}

class _JournalViewState extends State<JournalView> {
  GenderModel _gender = gender.first;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AppNestedScrollView(
        body: body(),
        title: appBar(),
        padding: EdgeInsets.only(top: AppSizes.padding),
      ),
    );
  }

  Widget appBar() {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppIconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            buttonColor: AppColors.transparent,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: Text(
              'Journal',
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.clip,
              style: AppTextStyle.bold(
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        filterForm(),
        SizedBox(height: AppSizes.padding),
        TableHistoryTransaction(),
        SizedBox(height: AppSizes.padding),
      ],
    );
  }

  Widget filterForm() {
    return Padding(
      padding: EdgeInsets.all(AppSizes.padding),
      child: AppExpansionListTile(
        title: 'Filter Journal',
        expand: true,
        isDisabled: true,
        showExpandButton: false,
        backgroundColor: AppColors.white,
        paddingChild: EdgeInsets.all(AppSizes.padding),
        children: [
          AppDropDown(
            onTapItem: (item) {
              _gender = gender.firstWhere((e) => e.codeGender == item.value);
            },
            hintText: 'Pilih Periode',
            hintStyle: AppTextStyle.bold(size: 14, color: AppColors.black),
            selectedItem: _gender.textGender,
            items: List.generate(
              gender.length,
              (i) => DropDownModel(text: gender[i].textGender, value: gender[i].codeGender),
            ),
            itemsBuilder: (item) {
              return Text(
                item.text,
                style: AppTextStyle.semibold(size: 12),
              );
            },
          ),
          // ==================================
          SizedBox(
            height: AppSizes.padding,
          ),
          AppDropDown(
            onTapItem: (item) {
              _gender = gender.firstWhere((e) => e.codeGender == item.value);
            },
            hintText: 'Pilih Outlet',
            hintStyle: AppTextStyle.bold(size: 14, color: AppColors.black),
            selectedItem: _gender.textGender,
            items: List.generate(
              gender.length,
              (i) => DropDownModel(text: gender[i].textGender, value: gender[i].codeGender),
            ),
            itemsBuilder: (item) {
              return Text(
                item.text,
                style: AppTextStyle.semibold(size: 12),
              );
            },
          ),
          // ==================================
          SizedBox(
            height: AppSizes.padding,
          ),
          AppDropDown(
            onTapItem: (item) {
              _gender = gender.firstWhere((e) => e.codeGender == item.value);
            },
            hintText: 'Pilih AKun',
            selectedItem: _gender.textGender,
            items: List.generate(
              gender.length,
              (i) => DropDownModel(text: gender[i].textGender, value: gender[i].codeGender),
            ),
            hintStyle: AppTextStyle.bold(size: 14, color: AppColors.black),
            itemsBuilder: (item) {
              return Text(
                item.text,
                style: AppTextStyle.semibold(size: 12),
              );
            },
          ),
          SizedBox(height: AppSizes.padding),
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
            hintText: 'Cara berdasarkan deskripsi',
            type: AppTextFieldType.search,
          ),
          SizedBox(height: AppSizes.padding),
          AppButton(
              text: 'Terapkan',
              onTap: () {
                // TODO
              })
        ],
      ),
    );
  }
}
