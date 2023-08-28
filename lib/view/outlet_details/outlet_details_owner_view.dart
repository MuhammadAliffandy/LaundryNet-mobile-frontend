import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_image.dart';
import 'package:alvamind_library/widget/molecule/app_carousel_slider.dart';

import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_tags.dart';
import 'package:alvamind_library/widget/organism/outlet_hero/outlet_hero.dart';
import 'package:alvamind_library/widget/organism/tab%20_detail_outlet/tab_detail_outlet.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_colors.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_text_style.dart';
import 'package:laundrynet_mobile_frontend/view/outlet_details/component/component/owner/summaryOwner.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import 'component/component/owner/galleryOwner.dart';
import 'component/component/owner/operasionalOwner.dart';
import 'component/component/owner/promoOwner.dart';
import 'component/component/owner/reviewOwner.dart';
import 'component/component/owner/serviceOwner.dart';
import 'component/component/owner/termsOwner.dart';

class OutletDetailsOwnerView extends StatefulWidget {
  static const viewAsOwner = '/outlet-details-owner-screen';

  const OutletDetailsOwnerView({super.key});

  @override
  State<OutletDetailsOwnerView> createState() => _OutletDetailsOwnerViewState();
}

class _OutletDetailsOwnerViewState extends State<OutletDetailsOwnerView> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  ScrollController? _scrollController;
  bool _showAppBar = false;

  void _handleTabChange() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
    _scrollController = ScrollController();
    _tabController?.addListener(_handleTabChange);
    _scrollController?.addListener(() {
      if (_scrollController?.position.userScrollDirection == ScrollDirection.reverse) {
        if (!_showAppBar) {
          setState(() {
            _showAppBar = true;
          });
        }
      } else if (_scrollController?.position.userScrollDirection == ScrollDirection.forward) {
        if (_showAppBar) {
          setState(() {
            _showAppBar = false;
          });
        }
      }
    });
    setState(() {});
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    _tabController?.dispose();
    _tabController?.removeListener(_handleTabChange);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.redLv1,
        title: appbar(),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: AppNestedScrollView(
        lengthTab: 7,
        body: body(),
        elevation: 0,
        background: contentSlider(),
        bgMainAxisAlignment: MainAxisAlignment.start,
        isScroll: false,
        pinned: false,
        moreHeaderSlivers: [
          SliverAppBar(
            backgroundColor: AppColors.white,
            automaticallyImplyLeading: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              expandedTitleScale: 1.0,
              background: outletHero(),
            ),
            expandedHeight: 300,
          )
        ],
        expandedHeight: 460,
      ),
    );
  }

  Widget appbar() {
    return AppLongCard(
      backgroundColor: AppColors.transparent,
      padding: EdgeInsets.only(right: AppSizes.padding),
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
            _tabController!.index > 0
                ? Text(
                    'Meta Laundromat',
                    style: AppTextStyle.bold(size: 24),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        AppIconButton(
          icon: Icon(
            CustomIcon.editIcon,
            color: _tabController!.index > 0 ? AppColors.primary : AppColors.black,
          ),
          buttonColor: AppColors.transparent,
          onTap: () {
            // TODO
          },
        ),
      ],
    );
  }

  Widget contentSlider() {
    return Column(
      children: [
        AppCarouselSlider(
          height: 400,
          indicatorActiveColor: AppColors.primary,
          indicatorColor: AppColors.white,
          contentList: [
            ...List.generate(5, (index) {
              return AppImage(
                width: MediaQuery.of(context).size.width,
                image: 'https://picsum.photos/20$index/300',
                fit: BoxFit.cover,
              );
            })
          ],
        ),
        AppLongCard(
          borderRadius: BorderRadius.circular(0),
          backgroundColor: AppColors.blueLv5,
          children: [
            Row(
              children: [
                const Icon(
                  CustomIcon.discountBoldIcon,
                  color: AppColors.primary,
                ),
                SizedBox(
                  width: AppSizes.padding / 2,
                ),
                Text(
                  'Promo Gratis Ongkir',
                  style: AppTextStyle.medium(
                    size: 12,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const AppTags(
              text: 'Diskon 50%',
              color: AppColors.redLv1,
              borderRadius: 20,
            )
          ],
        )
      ],
    );
  }

  Widget outletHero() {
    return Padding(
      padding: EdgeInsets.only(
        left: AppSizes.padding,
        right: AppSizes.padding,
        top: AppSizes.padding,
      ),
      child: OutletHero(
        nameOutlet: 'Meta Laundromat',
        address: '0.5 km - Grand City St. 100, New York, United States',
        countStar: '4.8',
        countReview: '120',
        tagStatus: 'Premium',
        descriptionText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et...',
        onTapDeliveryButton: () {
          // TODO
        },
        onTapDropButton: () {
          // TODO
        },
        onTapServiceButton: () {
          // TODO
        },
      ),
    );
  }

  Widget tabBar() {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.only(top: AppSizes.padding),
      child: TabBarDetailOutlet(
        controller: _tabController,
        padding: EdgeInsets.only(left: AppSizes.padding),
        leftIcon: const [
          CustomIcon.chartCurvedIcon,
          CustomIcon.timesquareIcon,
          CustomIcon.documentIcon,
          CustomIcon.documentIcon,
          Icons.image_outlined,
          Icons.star_border_rounded,
          CustomIcon.documentIcon,
        ],
        listTabBar: const [
          'Ringkasan',
          'Jadwal',
          'Layanan',
          'Promo',
          'Gallery',
          'Ulasan',
          'Ketentuan',
        ],
        onTap: (value) {
          // TODO

          setState(() {});
        },
      ),
    );
  }

  Widget body() {
    return StickyHeader(
      header: tabBar(),
      content: main(),
    );
  }

  Widget main() {
    return TabBarView(
      controller: _tabController,
      children: [
        SummaryOwner(),
        OperasionalOwner(),
        ServiceOwner(),
        PromoOwner(),
        GalleryOwner(),
        ReviewOwner(),
        TermsOwner(),
      ],
    );
  }
}
