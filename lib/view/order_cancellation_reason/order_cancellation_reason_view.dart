import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/app/const/gender.dart';
import 'package:alvamind_library/model/drop_down_model.dart';
import 'package:alvamind_library/model/gender_model.dart';
import 'package:alvamind_library/widget/molecule/app_Checkbox.dart';

import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_drop_down.dart';
import 'package:alvamind_library/widget/molecule/app_expansion_list_tile.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_tags.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list_selected.dart';
import 'package:alvamind_library/widget/organism/transaction_review_card/list_card_progress.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class OrderCancellationReasonView extends StatefulWidget {
  static const routeName = '/order-cancellation-reason-screen';

  const OrderCancellationReasonView({super.key});

  @override
  State<OrderCancellationReasonView> createState() => _OrderCancellationReasonViewState();
}

class _OrderCancellationReasonViewState extends State<OrderCancellationReasonView> {
  GenderModel _gender = gender.first;
  bool checkBoxSelected = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AppNestedScrollView(
        title: appBar(),
        body: body(),
      ),
    );
  }

  Widget appBar() {
    return AppLongCard(
      backgroundColor: AppColors.transparent,
      padding: EdgeInsets.zero,
      children: [
        Row(
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
              'Cancel Order',
              style: AppTextStyle.bold(size: 24),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: AppSizes.padding),
            AppIconButton(
              icon: const Icon(
                CustomIcon.notificationIcon,
                color: AppColors.primary,
              ),
              buttonColor: AppColors.transparent,
              onTap: () {},
            ),
            AppIconButton(
              icon: const Icon(
                Icons.pending_outlined,
              ),
              buttonColor: AppColors.transparent,
              onTap: () {},
            ),
            SizedBox(
              width: 12,
            )
          ],
        ),
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        dropService(),
        SizedBox(height: AppSizes.padding * 1.5),
        statusComplain(),
        SizedBox(height: AppSizes.padding * 1.5),
        itemOrderPanel(),
        SizedBox(height: AppSizes.padding * 1.5),
        text(),
        SizedBox(height: AppSizes.padding * 1.5),
        checkList(),
        SizedBox(height: AppSizes.padding * 4),
      ],
    );
  }

  Widget dropService() {
    return AppDropDown(
      prefixIcon: Icons.person,
      iconsSize: 20,
      onTapItem: (item) {
        _gender = gender.firstWhere((e) => e.codeGender == item.value);
      },
      hintText: 'Drop Service',
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
    );
  }

  Widget statusComplain() {
    return ListCard(
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv7,
          offset: Offset(0, 4),
          blurRadius: 60,
          spreadRadius: -10,
        ),
      ],
      leftIcon: CustomIcon.walletBoldIcon,
      rightIcon: Icons.chevron_right_rounded,
      title: 'Selasa, 23 Juni 2023',
      subtitle: 'Status Complain',
      textTags: 'Proses',
      onTapChevronButton: () {
        // TODO
      },
      onTapCard: () {
        // TODO
      },
    );
  }

  Widget itemOrderPanel() {
    return AppExpansionListTile(
      paddingChild: EdgeInsets.all(AppSizes.padding),
      backgroundColor: AppColors.white,
      title: 'Item Pemesanan',
      expand: true,
      moreItem: const AppTags(
        text: '3 Item',
        color: AppColors.transparent,
        borderWidth: 1,
        borderColor: AppColors.blackLv5,
        textColor: AppColors.blackLv5,
      ),
      children: [
        ...List.generate(3, (index) {
          return Padding(
            padding: index == 3
                ? const EdgeInsets.all(0)
                : EdgeInsets.only(
                    bottom: AppSizes.padding,
                  ),
            child: ItemCardListSelected(
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackLv7.withOpacity(0.5),
                  offset: Offset(0, 4),
                  blurRadius: 60,
                  spreadRadius: 0,
                ),
              ],
              starImageCount: '50',
              title: 'Cuci Kering',
              typeItem: 'Pakaian',
              textPrice: '4',
              statusPrice: '/pcs',
              dateProgress: '2 Agustus 2023',
              textLeftButton: 'Lacak Status',
              textRightButton: 'Next Status',
              isStatus: true,
              showLabel: false,
            ),
          );
        })
      ],
    );
  }

  Widget text() {
    return Text(
      'Lolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut Read more...',
      style: AppTextStyle.medium(size: 14),
    );
  }

  Widget checkList() {
    return AppColumnInk(
      children: [
        AppCheckbox(
          value: checkBoxSelected,
          onChanged: (val) {
            checkBoxSelected = val!;
            setState(() {});
          },
          title: 'Saya Menemukan Toko Lain',
        ),
        SizedBox(
          height: AppSizes.padding / 2,
        ),
        AppCheckbox(
          value: checkBoxSelected,
          onChanged: (val) {
            checkBoxSelected = val!;
            setState(() {});
          },
          title: 'Unchecked',
        ),
        SizedBox(
          height: AppSizes.padding / 2,
        ),
        AppCheckbox(
          value: checkBoxSelected,
          onChanged: (val) {
            checkBoxSelected = val!;
            setState(() {});
          },
          title: 'Unchecked',
        ),
      ],
    );
  }
}
