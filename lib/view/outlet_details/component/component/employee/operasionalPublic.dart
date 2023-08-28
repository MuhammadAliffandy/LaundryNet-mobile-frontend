import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_modal.dart';
import 'package:alvamind_library/widget/organism/operasional_card/operasional_card_edit.dart';
import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_sizes.dart';

class OperasionalPublic extends StatefulWidget {
  @override
  State<OperasionalPublic> createState() => _OperasionalPublicState();
}

class _OperasionalPublicState extends State<OperasionalPublic> {
  @override
  Widget build(BuildContext context) {
    List<String> dayList = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu',
    ];

    // TODO: implement build
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: AppColumnInk(
        children: [
          SizedBox(height: AppSizes.padding),
          ...List.generate(7, (index) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: AppSizes.padding,
              ),
              child: OperasionalCardEdit(
                dayTitle: dayList[index],
                time: '08.00 - 17.00',
                isDisabled: index == 4 ? true : false,
                onChangedToggle: (value) {},
                onChangedEnd: (value) {
                  // TODO
                  if (value.length == 5) {
                    final navigator = Navigator.of(context);
                    AppModal.show(
                      navigator,
                      backgroundColor: AppColors.white,
                      price: false,
                      children: [
                        Expanded(
                          child: AppButton(
                            onTap: () {},
                            text: 'Simpan',
                            rounded: true,
                          ),
                        ),
                      ],
                    );
                  }
                },
                onEditingCompleteEnd: () {
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
    );
  }
}
