import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/view/samples/review_tabs_samples_view.dart';
import 'package:alvamind_library/widget/atom/app_avatar.dart';
import 'package:alvamind_library/widget/atom/app_image.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_dialog.dart';
import 'package:alvamind_library/widget/molecule/app_expansion_list_tile.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';

import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:alvamind_library/widget/organism/accordion/accordion_question_card.dart';
import 'package:alvamind_library/widget/organism/comments_and_reviews/comments_list.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list.dart';
import 'package:alvamind_library/widget/organism/order_card/order_card.dart';
import 'package:alvamind_library/widget/organism/order_list/order_list.dart';
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

class UserProfileCustomerView extends StatefulWidget {
  static const viewAsCustomer = '/user-profile-customer-screen';

  const UserProfileCustomerView({super.key});

  @override
  State<UserProfileCustomerView> createState() => _UserProfileCustomerViewState();
}

class _UserProfileCustomerViewState extends State<UserProfileCustomerView> {
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
        lengthTab: 6,
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
                  'Konsumen',
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
      padding: EdgeInsets.only(top: AppSizes.padding / 1.5),
      color: AppColors.white,
      child: TabBarDetailOutlet(
        padding: EdgeInsets.only(left: AppSizes.padding),
        controller: _tabController,
        leftIcon: const [
          CustomIcon.chartCurvedIcon,
          CustomIcon.timesquareIcon,
          CustomIcon.timesquareIcon,
          CustomIcon.documentIcon,
          Icons.star_border_rounded,
          Icons.image_outlined,
          Icons.image_outlined,
        ],
        listTabBar: const [
          'Ringkasan',
          'Pemesanan',
          'Riwayat Wallet',
          'Favorit',
          'Ulasan',
          'Komplain'
        ],
        onTap: (value) {
          // TODO
        },
      ),
    );
  }

  Widget body() {
    return TabBarView(
      controller: _tabController,
      children: [
        userDataProfile(),
        orderList(),
        userTableHistory(),
        outerListBody(),
        reviewTabs(),
        complainList(),
      ],
    );
  }

  Widget userTableHistory() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: AppColumnInk(children: [
        SizedBox(height: AppSizes.padding * 1.5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
          child: Row(
            children: [
              Expanded(
                child: AppTextField(
                  suffixIcon: Icons.search,
                  hintText: 'Search..',
                  onChanged: (value) {},
                  onEditingComplete: () {},
                ),
              ),
              SizedBox(
                width: AppSizes.padding / 2,
              ),
              AppIconButton(
                borderRadius: 15,
                icon: const Icon(
                  Icons.sim_card_download_rounded,
                  color: AppColors.white,
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
  Widget userDataProfile() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
        child: AppColumnInk(
          children: [
            SizedBox(
              height: AppSizes.padding * 1.5,
            ),
            ListTransaction(
              email: 'nakama@gmail.com',
              number: '+62534234432',
              gender: 'Perempuan',
              registerDate: '19 Mei 2023',
              status: 'Aktif',
              statusColor: AppColors.greenLv1,
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackLv7.withOpacity(0.5),
                  offset: Offset(0, -10),
                  blurRadius: 60,
                  spreadRadius: 0,
                ),
              ],
            ),
            SizedBox(height: AppSizes.padding * 1.5),
            ...List.generate(3, (i) {
              return Padding(
                padding: EdgeInsets.only(bottom: AppSizes.padding * 1.5),
                child: ListCard(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blackLv7.withOpacity(0.5),
                      offset: Offset(0, 4),
                      blurRadius: 60,
                      spreadRadius: 0,
                    ),
                  ],
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
            })
          ],
        ),
      ),
    );
  }

//
  Widget reviewTabs() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: StickyHeader(
        header: Container(
          color: AppColors.white,
          padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
          child: TagsOrganism(
            paddingTagsBody: EdgeInsets.only(left: AppSizes.padding),
            leftIcon: Icons.star_rounded,
            selectedColor: [
              ...List.generate(5, (index) {
                return AppColors.primary;
              })
            ],
            listChips: const [
              'Semua',
              '5',
              '4',
              '3',
              '2',
            ],
            onTap: (value) {
              // TODO
            },
          ),
        ),
        content: listComment(),
      ),
    );
  }

  Widget listComment() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: Column(
        children: [
          ...List.generate(3, (i) {
            return Column(
              children: [
                CommentListCard(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
                  isComment: true,
                  titleUser: dummyName[i],
                  subtitleUser: 'Occuptaion',
                  countLike: '431',
                  countStaruser: '${i + 3}',
                  imageAvatar: 'https://picsum.photos/id/1$i/100/200',
                  textComment: 'Adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore o eiusmod tempor incididunt ut labore et dolore.',
                  dateComment: '6 hours ago',
                  isImage: true,
                  image: Row(
                    children: [
                      ...List.generate(3, (i) {
                        return Padding(
                          padding: i != 3 ? EdgeInsets.only(right: AppSizes.padding / 2) : EdgeInsets.only(bottom: AppSizes.padding * 4),
                          child: AppImage(
                            image: 'https://picsum.photos/id/2$i/200/200',
                            width: 70,
                            height: 70,
                            borderRadius: 24,
                            backgroundColor: AppColors.redLv5,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                i == 0
                    ? Padding(
                        padding: EdgeInsets.only(bottom: AppSizes.padding),
                        child: AppExpansionListTile(
                          backgroundColor: AppColors.transparent,
                          paddingChild: EdgeInsets.all(AppSizes.padding),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.transparent,
                              offset: Offset(0, 0),
                              blurRadius: 0,
                              spreadRadius: 0,
                            ),
                          ],
                          leftItem: Padding(
                            padding: EdgeInsets.only(right: AppSizes.padding / 1.5),
                            child: const AppAvatar(
                              image: randomImage,
                              size: 40,
                            ),
                          ),
                          divider: false,
                          title: 'Full Name',
                          children: [
                            QuestionText(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.blackLv7.withOpacity(0.5),
                                  offset: Offset(0, 4),
                                  blurRadius: 60,
                                  spreadRadius: 0,
                                ),
                              ],
                              padding: EdgeInsets.only(
                                top: 0,
                                right: AppSizes.padding,
                                left: AppSizes.padding,
                                bottom: AppSizes.padding,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.',
                            )
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            );
          }),
          SizedBox(height: AppSizes.padding * 4)
        ],
      ),
    );
  }

//
  Widget orderList() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: AppColumnInk(
        children: [
          SizedBox(height: AppSizes.padding),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
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
              hintText: 'Cari Layanan',
              type: AppTextFieldType.search,
            ),
          ),
          StickyHeader(
              header: Container(
                color: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
                child: TagsOrganism(
                  paddingTagsBody: EdgeInsets.only(
                    left: AppSizes.padding,
                  ),
                  listChips: const [
                    'Semua',
                    'Menunggu Konfirmasi',
                    'Ambil',
                    'Proses',
                    'Antar',
                    'Selesai',
                    'Komplain',
                    'Batal'
                  ],
                  onTap: (value) {
                    // TODO
                    setState(() {
                      tagSelected = value;
                    });
                  },
                ),
              ),
              content: AppColumnInk(
                children: [
                  ...List.generate(5, (i) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: AppSizes.padding,
                        right: AppSizes.padding,
                        left: AppSizes.padding,
                      ),
                      child: OrderList(
                        title: 'Alasan',
                        dateTime: '12 : 30 PM',
                        location: 'Tokyo, Jepang',
                        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.blackLv7,
                            offset: Offset(0, 4),
                            blurRadius: 30,
                            spreadRadius: -10,
                          ),
                        ],
                        orderCard: OrderCard(
                          image: 'https://picsum.photos/id/3$i/200/400',
                          padding: EdgeInsets.all(0),
                          backgroundColor: AppColors.transparent,
                          starImageCount: '50',
                          title: i == 1 ? 'Zarie Baptista' : 'Barokah Laundry',
                          isProgress: true,
                          textPrice: '20 Kg',
                          statusPrice: 'Estimasi Selesai 7 hari',
                          dateProgress: '2 Agustus 2023',
                          textLeftButton: i == 1 ? 'Order Outlet Lain' : 'Detail Pesanan',
                          textRightButton: i == 1 ? 'Batalkan Pesanan' : 'Lacak Pengiriman',
                          labelingCount: 40,
                          tagText: i == 1
                              ? 'HomeService'
                              : i == 2
                                  ? 'SelfService'
                                  : 'Delivery',
                          tagTextColor: AppColors.white,
                          tagColor: i == 1
                              ? AppColors.orangeLv1
                              : i == 2
                                  ? AppColors.yellowLv1
                                  : AppColors.greenLv3,
                          tagBorderWidth: 0,
                          leftButtonColor: i == 1 ? AppColors.blackLv7 : null,
                          rightButtonColor: i == 1 ? AppColors.redLv1 : null,
                          rightButtonTextColor: i == 1 ? AppColors.white : null,
                          leftButtonBorderColor: i == 1 ? AppColors.blackLv7 : null,
                          rightButtonBorderColor: i == 1 ? AppColors.redLv1 : null,
                          onTapLeftButton: () {
                            // TODO
                          },
                          onTapRightButton: () {
                            // TODO
                          },
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: AppSizes.padding * 4)
                ],
              ))
        ],
      ),
    );
  }

//
  Widget complainList() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
        child: AppColumnInk(
          children: [
            SizedBox(
              height: AppSizes.padding,
            ),
            ...List.generate(3, (i) {
              return Padding(
                padding: i == 2 ? const EdgeInsets.all(0) : EdgeInsets.only(bottom: AppSizes.padding),
                child: OrderCard(
                  image: 'https://picsum.photos/23$i/300',
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.blackLv7,
                      offset: Offset(0, 4),
                      blurRadius: 60,
                      spreadRadius: -10,
                    ),
                  ],
                  starImageCount: '50',
                  title: 'Barokah Laundry',
                  isProgress: true,
                  showProgressLine: false,
                  textPrice: 'Rp42.431',
                  statusPrice: '/00 days',
                  dateProgress: '2 Agustus 2023',
                  textLeftButton: 'Detail Pesanan',
                  textRightButton: 'Lacak Pengiriman',
                  tagText: i == 0
                      ? 'Solusi Ditolak'
                      : i == 1
                          ? 'Solusi Diajukan'
                          : 'Selesai',
                  tagBorderColor: i == 0
                      ? AppColors.redLv1
                      : i == 1
                          ? AppColors.primary
                          : AppColors.greenLv1,
                  tagTextColor: i == 0
                      ? AppColors.redLv1
                      : i == 1
                          ? AppColors.primary
                          : AppColors.greenLv1,
                  labelingCount: 40,
                  onTapLeftButton: () {
                    // TODO
                  },
                  onTapRightButton: () {
                    // TODO
                  },
                  showButton: false,
                  customWidget: [
                    Expanded(
                      child: AppButton(
                        onTap: () {},
                        text: 'Lihat Detail',
                        rounded: true,
                        textColor: AppColors.white,
                        borderWidth: 2,
                        buttonColor: AppColors.primary,
                        borderColor: AppColors.primary,
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.padding / 2.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppSizes.padding / 2,
                    ),
                    Expanded(
                      child: AppButton(
                        onTap: () {},
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.padding / 2.5,
                        ),
                        leftIcon: CustomIcon.chatBoldIcon,
                        text: 'Diskusi (2)',
                        textColor: AppColors.primary,
                        borderWidth: 2,
                        buttonColor: AppColors.white,
                        borderColor: AppColors.primary,
                        rounded: true,
                      ),
                    ),
                  ],
                ),
              );
            }),
            SizedBox(height: AppSizes.padding * 4)
          ],
        ),
      ),
    );
  }

//
  Widget outerListBody() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: AppColumnInk(
        children: [
          SizedBox(height: AppSizes.padding),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
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
              hintText: 'Cari Layanan',
              type: AppTextFieldType.search,
            ),
          ),
          StickyHeader(
            header: Container(
              color: AppColors.white,
              width: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
              child: TagsOrganism(
                paddingTagsBody: EdgeInsets.only(
                  left: AppSizes.padding,
                ),
                listChips: const [
                  'Semua',
                  'Reguler',
                  'Premium',
                ],
                onTap: (value) {
                  // TODO
                  setState(() {
                    tagSelected = value;
                  });
                },
              ),
            ),
            content: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
              child: AppColumnInk(
                children: [
                  Text(
                    '3 Toko',
                    style: AppTextStyle.bold(size: 20),
                  ),
                  SizedBox(height: AppSizes.padding),
                  ...List.generate(
                      tagSelected1 == 1
                          ? 1
                          : tagSelected1 == 2
                              ? 2
                              : 10, (i) {
                    return Padding(
                      padding: i == 2 ? EdgeInsets.all(0) : EdgeInsets.only(bottom: AppSizes.padding),
                      child: ItemCardList(
                        image: 'https://picsum.photos/20$i/300/',
                        starImageCount: '50',
                        title: 'Barokah Laundry',
                        dateProgress: '2 Agustus 2023',
                        textLeftButton: 'Detail Pesanan',
                        textRightButton: 'Lacak Pengiriman',
                        address: 'Jl. Sukamenak DPR RI KOM...',
                        isProfile: true,
                        tagText: tagSelected1 == 1
                            ? 'Reguler'
                            : tagSelected1 == 0 && i == 1
                                ? 'Reguler'
                                : 'Premium',
                        tagColor: tagSelected1 == 1
                            ? AppColors.greenLv1
                            : tagSelected1 == 0 && i == 1
                                ? AppColors.greenLv2
                                : AppColors.orangeLv1,
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.blackLv7,
                            offset: Offset(0, 4),
                            blurRadius: 60,
                            spreadRadius: -10,
                          ),
                        ],
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
          ),
        ],
      ),
    );
  }
}
