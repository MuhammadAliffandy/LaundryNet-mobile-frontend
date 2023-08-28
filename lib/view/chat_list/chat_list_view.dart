import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_logo.dart';
import 'package:alvamind_library/widget/molecule/app_account_list.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_ink_container.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/organism/button_bar_customer/button_bar_customer%20.dart';
import 'package:alvamind_library/widget/organism/tags_organism.dart/tags_organism.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class ChatListView extends StatefulWidget {
  static const routeName = '/chat-list-screen';

  const ChatListView({
    super.key,
  });

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

int _index = -1;
var faker = new Faker();

class _ChatListViewState extends State<ChatListView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: buttonBottomBar(),
      body: AppNestedScrollView(
        titleFlexible: appBar(),
        body: body(),
        padding: EdgeInsets.all(0),
        collapseHeight: 120,
        titlePadding: EdgeInsets.only(top: AppSizes.padding * 2),
      ),
    );
  }

  Widget appBar() {
    return AppColumnInk(
      children: [
        AppLongCard(
          backgroundColor: AppColors.transparent,
          padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppLogo(
                  title: 'LaundryNet',
                  image: AppAssets.logo,
                  withText: false,
                  size: 25,
                ),
                SizedBox(width: AppSizes.padding / 1.5),
                Text(
                  'Inbox',
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
              ],
            ),
          ],
        ),
        SizedBox(
          height: AppSizes.padding / 2,
        ),
        TagsOrganism(
          paddingTagsBody: EdgeInsets.only(left: AppSizes.padding),
          listChips: const [
            'Semua',
            'Chat Pemesanan',
            'Diskusi Komplain',
            'Customer Service'
          ],
          onTap: (value) {
            // TODO
          },
        ),
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        accountLists(),
      ],
    );
  }

  Widget accountLists() {
    return AppColumnInk(
      children: [
        ...List.generate(15, (index) {
          return AppInkContainer(
            backgroundColor: AppColors.transparent,
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.padding,
              vertical: AppSizes.padding / 2,
            ),
            borderRadius: BorderRadius.circular(0),
            child: AccountList(
              padding: const EdgeInsets.all(0),
              rightButton: false,
              image: 'https://picsum.photos/22$index/300',
              title: faker.person.name(),
              subtitle: faker.lorem.sentence(),
              rightItem: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  index > 4
                      ? const SizedBox.shrink()
                      : CircleAvatar(
                          maxRadius: 12,
                          backgroundColor: AppColors.blueLv2,
                          child: Text(
                            '3',
                            style: AppTextStyle.regular(
                              size: 10,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                  SizedBox(
                    height: AppSizes.padding / 2,
                  ),
                  Text(
                    index > 10
                        ? 'Yesterday'
                        : index > 4
                            ? '12/12/2023'
                            : '20.00',
                    style: AppTextStyle.medium(
                      size: 14,
                      color: AppColors.blackLv4,
                    ),
                  )
                ],
              ),
            ),
          );
        })
      ],
    );
  }

  Widget buttonBottomBar() {
    return SizedBox(
      height: 100,
      child: ButtonBarCustomer(
        index: _index,

        //
        iconLeftOut: CustomIcon.homeIcon,
        textLeftOut: 'Beranda',
        onTapButtonLeftOut: () {
          // TODO
          setState(() {
            _index = 0;
          });
        },
        //
        iconLeftIn: CustomIcon.documentIcon,
        textLeftIn: 'Order',
        onTapButtonLeftIn: () {
          // TODO
          setState(() {
            _index = 1;
          });
        },
        //
        iconCenter: CustomIcon.scanIcon,
        textCenter: 'Scan',
        iconCenterColor: AppColors.white,
        textCenterColor: AppColors.white,
        iconCenterBackgroundColor: AppColors.primary,
        onTapButtonCenter: () {
          // TODO
        },
        //
        iconRightIn: CustomIcon.chatIcon,
        textRightIn: 'Chat',
        onTapButtonRightIn: () {
          // TODO
          setState(() {
            _index = 3;
          });
        },
        //
        iconRightOut: Icons.settings,
        textRightOut: 'Pengaturan',
        onTapButtonRightOut: () {
          // TODO
          setState(() {
            _index = 4;
          });
        },
        //
      ),
    );
  }
}
