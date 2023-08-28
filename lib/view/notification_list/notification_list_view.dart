import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/app/theme/app_sizes.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/organism/notification_card/notification_card.dart';
import 'package:alvamind_library/widget/organism/notification_list_body/search_not_found.dart';
import 'package:alvamind_library/widget/organism/tags_organism.dart/tags_organism.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class NotificationListView extends StatefulWidget {
  static const routeName = '/notification-list-screen';

  const NotificationListView({
    super.key,
  });

  @override
  State<NotificationListView> createState() => _NotificationListViewState();
}

class _NotificationListViewState extends State<NotificationListView> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppNestedScrollView(
        body: itemNotification(selected),
        collapseHeight: 120,
        title: appBar(),
        titleFlexible: tag(),
        titlePadding: EdgeInsets.only(
          top: AppSizes.padding,
          bottom: AppSizes.padding,
        ),
        padding: EdgeInsets.zero,
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
          'Notifikasi',
          style: AppTextStyle.bold(size: 24),
        ),
      ],
    );
  }

  Widget tag() {
    return TagsOrganism(
      listChips: const [
        'Semua',
        'Order',
        'Promo',
        'Komplain',
      ],
      paddingTagsBody: EdgeInsets.only(left: AppSizes.padding),
      selected: selected,
      onTap: (value) {
        // TODO
        setState(() {
          selected = value;
        });
      },
    );
  }

  Widget itemNotification(int index) {
    return Column(
      children: [
        index == 1
            ? Column(
                children: [
                  ...List.generate(3, (index) {
                    return NotificationCard(
                      isNew: index > 1 ? false : true,
                      padding: EdgeInsets.symmetric(vertical: AppSizes.padding, horizontal: AppSizes.padding),
                      title: 'Pesanan Berhasil dibuat!',
                      dateNotification: '20 Dec, 2022',
                      timeNotification: '20:49 PM',
                      iconColor: AppColors.primary,
                      backgroundColorIcon: AppColors.blueLv5,
                      iconNotification: CustomIcon.documentBoldIcon,
                      textNotification: 'Selamat pesanan anda telah kami buat. anda bisa langsung mengceknya.',
                      onTap: () {
                        // TODO
                      },
                    );
                  }),
                ],
              )
            : index == 2
                ? Column(
                    children: [
                      ...List.generate(3, (index) {
                        return NotificationCard(
                          padding: EdgeInsets.symmetric(vertical: AppSizes.padding, horizontal: AppSizes.padding),
                          title: 'Ada Diskon Gratis Ongkir 7rb',
                          dateNotification: '20 Dec, 2022',
                          timeNotification: '20:49 PM',
                          iconColor: AppColors.orangeLv1,
                          backgroundColorIcon: Color(0xFFFACC15).withOpacity(0.2),
                          iconNotification: CustomIcon.discountBoldIcon,
                          textNotification: 'Anda bisa mendapatkan diskon sebesar 7rb. Syarat dan ketentuan berlaku.',
                          onTap: () {
                            // TODO
                          },
                        );
                      }),
                    ],
                  )
                : index == 3
                    ? Column(
                        children: [
                          ...List.generate(3, (index) {
                            return NotificationCard(
                              padding: EdgeInsets.symmetric(vertical: AppSizes.padding, horizontal: AppSizes.padding),
                              title: 'Komplain #123OJ',
                              dateNotification: '20 Dec, 2022',
                              timeNotification: '20:49 PM',
                              iconColor: AppColors.redLv1,
                              backgroundColorIcon: AppColors.redLv1.withOpacity(0.2),
                              iconNotification: CustomIcon.chatBoldIcon,
                              textNotification: 'Komplain anda berhasil ditanggapi. silahkan klik untuk mengetahui info selanjutnya.',
                              onTap: () {
                                // TODO
                              },
                            );
                          }),
                        ],
                      )
                    : const NotFoundWidget(
                        image: AppAssets.boardPaperImage,
                        title: 'Kosong',
                        subtitle: 'Anda belum memiliki notifikasi saat ini',
                      )
      ],
    );
  }
}
