import 'package:alvamind_library/app/asset/app_assets.dart';

import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_chips.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';

import 'package:alvamind_library/widget/molecule/app_expansion_list_tile.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/organism/accordion/accordion_question_card.dart';
import 'package:alvamind_library/widget/organism/time_field/time_field.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class DateTimePickerView extends StatefulWidget {
  static const routeName = '/date-time-picker-screen';

  const DateTimePickerView({
    super.key,
  });

  @override
  State<DateTimePickerView> createState() => _DateTimePickerViewState();
}

List<DateTime?> _dates = [
  DateTime.now(),
];

class _DateTimePickerViewState extends State<DateTimePickerView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: buttonBottom(),
      body: AppNestedScrollView(
        padding: EdgeInsets.only(top: AppSizes.padding),
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
          'Pilih Tanggal',
          style: AppTextStyle.bold(size: 24),
        ),
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
          child: Text(
            'Pilih Tanggal',
            style: AppTextStyle.bold(size: 20),
          ),
        ),
        SizedBox(height: AppSizes.padding),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
          child: AppCardContainer(
            padding: EdgeInsets.all(AppSizes.padding / 2),
            backgroundColor: AppColors.blueLv5,
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                controlsTextStyle: AppTextStyle.bold(
                  size: 14,
                  color: AppColors.black,
                ),
                weekdayLabelTextStyle: AppTextStyle.bold(size: 14, color: AppColors.black),
                dayTextStyle: AppTextStyle.medium(size: 14, color: AppColors.black),
                nextMonthIcon: const Icon(
                  CustomIcon.iconArrowRight,
                  color: AppColors.primary,
                ),
                lastMonthIcon: const Icon(
                  CustomIcon.arrowLeftIcon,
                  color: AppColors.primary,
                ),
              ),
              value: _dates,
              onValueChanged: (dates) => _dates = dates,
            ),
          ),
        ),
        SizedBox(height: AppSizes.padding),
        timeField(),
        SizedBox(height: AppSizes.padding * 1.5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
          child: timeInfo(),
        ),
        SizedBox(height: AppSizes.padding * 2),
      ],
    );
  }

  List chipsSelected = [
    ...List.generate(4, (index) {
      return false;
    }),
  ];

  Widget timeField() {
    return TimeField(
      showTimeField: false,
      onChangedStartCalendar: (String) {},
      onChangedEndCalendar: (String) {},
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
      paddingScroll: EdgeInsets.only(left: AppSizes.padding),
      listTimeChips: [
        ...List.generate(4, (index) {
          return AppChips(
            text: '${9 + index}.00 AM',
            onTap: () {
              chipsSelected[index] = !chipsSelected[index];
              setState(() {});
            },
            isSelected: chipsSelected[index],
          );
        })
      ],
    );
  }

  Widget timeInfo() {
    return AppExpansionListTile(
      backgroundColor: AppColors.white,
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv7,
          offset: Offset(0, 4),
          blurRadius: 24,
          spreadRadius: -10,
        ),
      ],
      title: 'Keterangan',
      isDisabled: true,
      expand: true,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: QuestionText(
            padding: EdgeInsets.all(0),
            backgroundColor: AppColors.transparent,
            text: 'Anda memilih tanggal 23',
          ),
        )
      ],
    );
  }

  Widget buttonBottom() {
    return SizedBox(
      height: 100,
      child: AppCardContainer(
        padding: EdgeInsets.all(AppSizes.padding),
        backgroundColor: AppColors.transparent,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: AppColors.blueLv4,
            offset: Offset(0, 4),
            blurRadius: 24,
            spreadRadius: -20,
          ),
        ],
        child: AppButton(
          text: 'Selanjutnya',
          rounded: true,
          buttonColor: AppColors.primary,
          onTap: () {},
        ),
      ),
    );
  }
}
