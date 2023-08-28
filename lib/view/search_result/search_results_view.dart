import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/app/theme/app_colors.dart';
import 'package:alvamind_library/app/theme/app_sizes.dart';
import 'package:alvamind_library/app/theme/app_text_style.dart';
import 'package:alvamind_library/widget/molecule/app_account_list.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_dialog.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_ink_container.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list_selected.dart';
import 'package:alvamind_library/widget/organism/notification_list_body/search_not_found.dart';
import 'package:alvamind_library/widget/organism/tags_organism.dart/tags_organism.dart';
import 'package:flutter/material.dart';

import '../../app/assets/app_assets.dart';

class SearchResultView extends StatefulWidget {
  const SearchResultView({super.key});

  static const routeName = '/search-result-screen';

  @override
  State<SearchResultView> createState() => _SearchResultViewState();
}

String dummySearch = '';
int tagSelected = 0;

class _SearchResultViewState extends State<SearchResultView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppNestedScrollView(
        pinned: true,
        collapseHeight: 130,
        title: appBar(),
        titleFlexible: tag(),
        titlePadding: EdgeInsets.zero,
        body: body(),
        bgMainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }

  Widget tag() {
    return Padding(
      padding: EdgeInsets.all(AppSizes.padding),
      child: TagsOrganism(
        listChips: const [
          'Toko Laundry',
          'Layanan Laundry',
        ],
        onTap: (value) {
          // TODO
          setState(() {
            tagSelected = value;
          });
        },
      ),
    );
  }

  Widget appBar() {
    return AppLongCard(
      children: [
        AppIconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
          buttonColor: AppColors.transparent,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        SizedBox(
          width: AppSizes.padding,
        ),
        Expanded(
          child: AppTextField(
            onChanged: (value) {
              // TODO
              setState(() {
                dummySearch = value;
              });
            },
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
        )
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        dummySearch == ''
            ? const SizedBox.shrink()
            : dummySearch == 'laundry'
                ? countHeadline(523)
                : countHeadline(0),
        dummySearch == ''
            ? tagSelected == 0
                ? outletList()
                : serviceList()
            : dummySearch == 'laundry'
                ? selectedView()
                : dataNotFound(),
        SizedBox(height: AppSizes.padding * 2)
      ],
    );
  }

  Widget selectedView() {
    return AppColumnInk(children: [
      accountLists(),
      SizedBox(height: AppSizes.padding),
      outletList(),
    ]);
  }

  Widget countHeadline(int count) {
    return AppLongCard(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.padding,
      ),
      children: [
        Text('Ditemukan $count', style: AppTextStyle.bold(size: 20)),
        count > 0
            ? Row(
                children: [
                  AppIconButton(
                    icon: const Icon(
                      CustomIcon.documentBoldIcon,
                      color: AppColors.primary,
                      size: 20,
                    ),
                    onTap: () {},
                    padding: const EdgeInsets.all(0),
                    buttonColor: AppColors.transparent,
                  ),
                  SizedBox(width: AppSizes.padding / 1.5),
                  AppIconButton(
                    icon: const Icon(
                      CustomIcon.categoryIcon,
                      color: AppColors.blackLv6,
                      size: 20,
                    ),
                    onTap: () {},
                    padding: const EdgeInsets.all(0),
                    buttonColor: AppColors.transparent,
                  ),
                ],
              )
            : const SizedBox.shrink()
      ],
    );
  }

  Widget accountLists() {
    return AppColumnInk(
      children: [
        ...List.generate(4, (index) {
          return AppInkContainer(
            backgroundColor: AppColors.transparent,
            padding: index == 3
                ? const EdgeInsets.all(0)
                : EdgeInsets.only(
                    bottom: AppSizes.padding,
                  ),
            borderRadius: BorderRadius.circular(0),
            child: AccountList(
              rightButton: false,
              image: 'https://picsum.photos/22$index/300',
              title: 'Barokah Laundry',
              subtitle: 'Sebaiknya memint......',
              rightItem: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
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
                    '20.00',
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

  Widget outletList() {
    return AppColumnInk(children: [
      ...List.generate(3, (index) {
        return Padding(
          padding: index == 3 ? const EdgeInsets.all(0) : EdgeInsets.only(bottom: AppSizes.padding),
          child: ItemCardList(
            image: 'https://picsum.photos/25$index/300',
            starImageCount: '50',
            title: 'Barokah\nLaundry',
            isList: true,
            textPrice: 'Rp.00',
            statusPrice: '/00 days',
            dateProgress: '2 Agustus 2023',
            textLeftButton: 'Detail Pesanan',
            textRightButton: 'Lacak Pengiriman',
            boxShadow: [
              BoxShadow(
                color: AppColors.blackLv7.withOpacity(0.5),
                offset: Offset(0, 4),
                blurRadius: 60,
                spreadRadius: 0,
              ),
            ],
            onTapCard: () {
              // TODO
            },
          ),
        );
      }),
    ]);
  }

  Widget serviceList() {
    return AppColumnInk(children: [
      ...List.generate(4, (index) {
        return Padding(
          padding: index == 3 ? const EdgeInsets.all(0) : EdgeInsets.only(bottom: AppSizes.padding),
          child: ItemCardListSelected(
            starImageCount: '50',
            image: 'https://picsum.photos/22$index/300',
            title: 'Cuci Kering',
            isList: true,
            textPrice: 'Rp7rb',
            statusPrice: '/kg',
            typeItem: 'Pakaian',
            timeWork: '3 Hari Kerja',
            dateProgress: '2 Agustus 2023',
            boxShadow: [
              BoxShadow(
                color: AppColors.blackLv7.withOpacity(0.5),
                offset: Offset(0, 4),
                blurRadius: 60,
                spreadRadius: 0,
              ),
            ],
            onTapCard: () {
              // TODO
            },
          ),
        );
      })
    ]);
  }

  Widget dataNotFound() {
    return const NotFoundWidget(
      image: AppAsset.dataNotFoundImages,
      title: 'Data tidak ditemukan',
      subtitle: 'Maaf, kata kunci yang anda masukkan tidak dapat ditemukan, harap periksa lagi atau gunakan kata kunci lain',
    );
  }
}
