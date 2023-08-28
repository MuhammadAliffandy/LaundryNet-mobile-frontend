import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_tags.dart';
import 'package:alvamind_library/widget/organism/attedance_card/attedance_card.dart';
import 'package:alvamind_library/widget/organism/showcase_card/showcase_user_profile_card.dart';
import 'package:alvamind_library/widget/organism/tags_organism.dart/tags_organism.dart';
import 'package:alvamind_library/widget/organism/transaction_review_card/list_card_progress.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class EmployeeAttedanceListEmployeeView extends StatefulWidget {
  static const viewAsEmployee = '/employee-attedance-list-employee-screen';

  const EmployeeAttedanceListEmployeeView({super.key});

  @override
  State<EmployeeAttedanceListEmployeeView> createState() => _EmployeeAttedanceListEmployeeViewState();
}

class _EmployeeAttedanceListEmployeeViewState extends State<EmployeeAttedanceListEmployeeView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AppNestedScrollView(
        title: appBar(),
        body: body(),
        background: userProfileCard(),
        titleFlexible: tag(),
        titlePadding: EdgeInsets.zero,
        bgMainAxisAlignment: MainAxisAlignment.center,
        collapseHeight: 130,
        expandedHeight: 480,
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
          Text(
            'Riwayat Presensi',
            style: AppTextStyle.bold(
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget tag() {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
      child: TagsOrganism(
        paddingTagsBody: EdgeInsets.only(left: AppSizes.padding),
        listChips: const [
          'Semua',
          'Terlambat',
          'Masuk Kerja',
          'Tidak Masuk Kerja',
          'Izin',
        ],
        onTap: (value) {
          // TODO
        },
      ),
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        employeeAttedanceListBody(),
      ],
    );
  }

  Widget userProfileCard() {
    return Padding(
      padding: EdgeInsets.only(
        right: AppSizes.padding,
        left: AppSizes.padding,
        bottom: AppSizes.padding / 1.5,
      ),
      child: Column(
        children: [
          UserProfileCard(
            onlyUser: true,
            nameUser: 'Amber Winston',
            idUser: 'ID Profil 5457383979',
            onlyEmployee: true,
            employeePlace: 'Barokah Laundry',
            employeeJob: 'Kasir, Produksi',
            onTapCopyButton: () {
              // TODO
            },
          ),
          SizedBox(height: AppSizes.padding * 1.5),
          ListCard(
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
          ),
        ],
      ),
    );
  }

  Widget employeeAttedanceListBody() {
    return AppColumnInk(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AppTags(
          text: '2 Agustus 2023',
          color: AppColors.blackLv8,
          textColor: AppColors.blackLv3,
        ),
        SizedBox(height: AppSizes.padding * 1.5),
        ...List.generate(3, (i) {
          return Padding(
            padding: i == 2
                ? EdgeInsets.all(0)
                : EdgeInsets.only(
                    bottom: AppSizes.padding,
                  ),
            child: AttedanceCard(
              dateAttedance: '2 Agustus 2023',
              timeStart: '08:00 AM',
              timeEnd: i == 1
                  ? '-'
                  : i == 2
                      ? '-'
                      : '18:00 PM',
              statusTags: AppTags(
                text: i == 1
                    ? 'Terlambat'
                    : i == 2
                        ? 'Tidak Masuk Kerja'
                        : 'Masuk Kerja',
                borderColor: i == 1
                    ? AppColors.yellowLv1
                    : i == 2
                        ? AppColors.redLv1
                        : AppColors.greenLv1,
                textColor: i == 1
                    ? AppColors.yellowLv1
                    : i == 2
                        ? AppColors.redLv1
                        : AppColors.greenLv1,
                borderWidth: 1,
                color: AppColors.transparent,
              ),
            ),
          );
        }),
      ],
    );
  }
}
