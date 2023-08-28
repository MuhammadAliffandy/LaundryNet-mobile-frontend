import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/organism/operasional_card/operasional_card.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class NotificationSettingCustomerView extends StatefulWidget {
  static const viewAsCustomer = '/notification-setting-customer-screen';

  const NotificationSettingCustomerView({super.key});

  @override
  State<NotificationSettingCustomerView> createState() => _NotificationSettingCustomerViewState();
}

class _NotificationSettingCustomerViewState extends State<NotificationSettingCustomerView> {
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
              'Pengaturan Notifikasi',
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
            const SizedBox(
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
        OperasionalCard(
          isCustom: true,
          title: 'Tampilkan Notifikasi',
          time: '08.00 - 17.00',
          onChanged: (value) {
            // TODO
          },
        ),
        SizedBox(height: AppSizes.padding * 1.5),
        OperasionalCard(
          isCustom: true,
          title: 'Getar & Dering',
          time: '08.00 - 17.00',
          onChanged: (value) {
            // TODO
          },
        ),
        SizedBox(height: AppSizes.padding * 1.5),
        OperasionalCard(
          isCustom: true,
          title: 'Pembaruan Aplikasi',
          time: '08.00 - 17.00',
          withSubtitle: false,
          onChanged: (value) {
            // TODO
          },
        ),
      ],
    );
  }
}
