import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_dialog.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_tags.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:alvamind_library/widget/organism/attedance_card/attedance_card.dart';
import 'package:alvamind_library/widget/organism/showcase_card/showcase_user_profile_card.dart';
import 'package:alvamind_library/widget/organism/tab%20_detail_outlet/tab_detail_outlet.dart';
import 'package:alvamind_library/widget/organism/table_organism/table_history_trasaction.dart';
import 'package:alvamind_library/widget/organism/tags_organism.dart/tags_organism.dart';
import 'package:alvamind_library/widget/organism/transaction_review_card/list_card_progress.dart';
import 'package:alvamind_library/widget/organism/transaction_review_card/list_transaction.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class UserProfileEmployeeView extends StatefulWidget {
  static const viewAsEmployee = '/user-profile-employee-screen';

  const UserProfileEmployeeView({super.key});

  @override
  State<UserProfileEmployeeView> createState() => _UserProfileEmployeeViewState();
}

class _UserProfileEmployeeViewState extends State<UserProfileEmployeeView> {
  TabController? _tabController;
  int tagSelected = 0;
  int tagSelected1 = 0;
  int tabBarSelected = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(),
        elevation: 0,
      ),
      body: AppNestedScrollView(
        lengthTab: 4,
        expandedHeight: 180,
        background: userProfileCard(),
        bgMainAxisAlignment: MainAxisAlignment.center,
        pinned: false,
        isScroll: false,
        body: StickyHeader(
          header: tabBar(),
          content: body(),
        ),
      ),
    );
  }

  Widget userProfileCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: UserProfileCard(
        onlyUser: true,
        nameUser: 'Amber Winston',
        idUser: 'ID Profil 5457383979',
        onTapCopyButton: () {
          // TODO
        },
      ),
    );
  }

  Widget appBar() {
    return AppLongCard(
      padding: EdgeInsets.only(right: AppSizes.padding / 1.5),
      borderRadius: BorderRadius.circular(0),
      backgroundColor: AppColors.white,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profil Pengguna',
                  style: AppTextStyle.bold(size: 24),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Konsumen Barokah Laundry',
                  style: AppTextStyle.medium(size: 12),
                ),
              ],
            )
          ],
        ),
        AppIconButton(
          icon: const Icon(
            CustomIcon.notificationIcon,
            color: AppColors.primary,
          ),
          buttonColor: AppColors.transparent,
          onTap: () {},
        ),
      ],
    );
  }

  Widget tabBar() {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.only(top: AppSizes.padding / 1.5),
      child: TabBarDetailOutlet(
        padding: EdgeInsets.only(left: AppSizes.padding),
        leftIcon: const [
          CustomIcon.chartCurvedIcon,
          CustomIcon.timesquareIcon,
          CustomIcon.timesquareIcon,
          CustomIcon.timesquareIcon,
        ],
        listTabBar: const [
          'Ringkasan',
          'Presensi',
          'Gaji',
          'Komisi',
        ],
        onTap: (value) {
          // TODO
        },
      ),
    );
  }

  Widget body() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: TabBarView(
        controller: _tabController,
        children: [
          userProfileTabContainer(),
          employeeAttedanceListBody(),
          tableHistory(),
          tableHistory(),
        ],
      ),
    );
  }

  Widget userProfileTabContainer() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
        child: AppColumnInk(
          children: [
            SizedBox(height: AppSizes.padding),
            const ListTransaction(
              email: 'nakama@gmail.com',
              number: '+62534234432',
              gender: 'Perempuan',
              registerDate: '19 Mei 2023',
              status: 'Aktif',
              statusColor: AppColors.greenLv1,
            ),
            SizedBox(height: AppSizes.padding * 1.5),
            ...List.generate(3, (i) {
              return Padding(
                padding: EdgeInsets.only(bottom: AppSizes.padding * 1.5),
                child: ListCard(
                  isSubtitle: i == 0 ? false : null,
                  leftIcon: i == 0 ? Icons.location_on_rounded : CustomIcon.walletBoldIcon,
                  leftIconColor: i == 0 ? AppColors.greenLv1 : null,
                  rightIcon: Icons.chevron_right_rounded,
                  title: i == 0
                      ? 'Alamat'
                      : i == 1
                          ? 'No Rekening'
                          : 'Selasa, 23 Juni 2023',
                  subtitle: 'Status Complain',
                  textTags: i == 0 ? '4' : 'Proses',
                  onTapChevronButton: () {
                    // TODO
                  },
                  onTapCard: () {
                    // TODO
                  },
                ),
              );
            }),
            SizedBox(
              height: AppSizes.padding * 4,
            )
          ],
        ),
      ),
    );
  }
// ======

  Widget tableHistory() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: AppColumnInk(children: [
        SizedBox(height: AppSizes.padding),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
          child: Row(
            children: [
              Expanded(
                child: AppTextField(
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
                  hintText: 'Search...',
                  type: AppTextFieldType.search,
                ),
              ),
              SizedBox(
                width: AppSizes.padding / 2,
              ),
              AppIconButton(
                buttonColor: AppColors.transparent,
                borderRadius: 15,
                icon: const Icon(
                  CustomIcon.downloadIcon,
                  color: AppColors.primary,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppSizes.padding,
        ),
        TableHistoryTransaction(),
        SizedBox(
          height: AppSizes.padding * 4,
        ),
      ]),
    );
  }

//
  Widget employeeAttedanceListBody() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: AppColumnInk(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: AppSizes.padding),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
            child: ListCard(
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
          ),
          StickyHeader(
            header: Container(
              color: AppColors.white,
              padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
              child: TagsOrganism(
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
            ),
            content: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: AppSizes.padding * 1.5),
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
              ),
            ),
          ),
          SizedBox(
            height: AppSizes.padding * 4,
          )
        ],
      ),
    );
  }
}
