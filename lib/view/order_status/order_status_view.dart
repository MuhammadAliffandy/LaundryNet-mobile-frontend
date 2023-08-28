import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/app/utility/date_formatter.dart';
import 'package:alvamind_library/model/steps_model.dart';
import 'package:alvamind_library/widget/atom/app_divider.dart';
import 'package:alvamind_library/widget/atom/app_image.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_expansion_list_tile.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_steps.dart';
import 'package:alvamind_library/widget/molecule/app_transaction_info.dart';
import 'package:alvamind_library/widget/organism/outlet_hero/outlet_hero_category.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_text_style.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';

class OrderStatusView extends StatefulWidget {
  const OrderStatusView({
    super.key,
  });

  static const routeName = '/order-status-screen';

  @override
  State<OrderStatusView> createState() => _OrderStatusViewState();
}

class _OrderStatusViewState extends State<OrderStatusView> {
  List<StepsModel> basicSteps = [
    ...List.generate(
      5,
      (i) => StepsModel(
        title: i == 0
            ? 'Selesai'
            : i == 1
                ? 'Delivery'
                : i == 2
                    ? 'Shipped'
                    : i == 3
                        ? 'Sedang Proses'
                        : 'Ordered',
        subtitle: DateFormatter.slashDateShortedYearWithClock(DateTime.now().toIso8601String()),
        isActive: i < 5 ? true : false,
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.white,
      body: AppNestedScrollView(
        padding: EdgeInsets.only(
          top: AppSizes.padding,
          right: AppSizes.padding,
          left: AppSizes.padding,
        ),
        title: appBar(),
        body: body(),
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
          'Order Status',
          style: AppTextStyle.bold(size: 24),
        ),
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        headBody(),
        complainStatistic(),
        trackingExpanel(),
        buttonDown(),
        SizedBox(height: AppSizes.padding * 2)
      ],
    );
  }

  Widget headBody() {
    return Column(
      children: [
        const AppImage(
          image: AppAssets.info,
          imgProvider: ImgProvider.assetImage,
        ),
        SizedBox(height: AppSizes.padding),
        Text(
          'Status Pesanan',
          style: AppTextStyle.bold(size: 16),
        ),
        SizedBox(height: AppSizes.padding / 2),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.padding * 5),
          child: const AppTransactionInfo(
            dotChillPadding: EdgeInsets.all(0),
            dotColor: AppColors.transparent,
            textTitle: 'Order ID',
            transactionId: '7868550',
            transactionStatus: 'Paid',
            onlyTrasactionId: true,
          ),
        ),
        Text(
          'Komplain anda sudah selesai',
          style: AppTextStyle.bold(size: 24),
        ),
        SizedBox(height: AppSizes.padding / 1.5),
        Text(
          'Terima Kasih',
          style: AppTextStyle.medium(size: 14),
        )
      ],
    );
  }

  Widget complainStatistic() {
    return Column(
      children: [
        AppDivider(
          color: AppColors.blackLv8,
          thickness: 2,
          padding: EdgeInsets.only(top: AppSizes.padding),
        ),
        OutletHeroCategory(
          leftTitle: '5457383979',
          centerTitle: '2 - 3 days',
          rightTitle: '2,4 kg',
          onTapCenterButton: () {},
          onTapLeftButton: () {},
          onTapRightButton: () {},
        ),
        AppDivider(
          color: AppColors.blackLv8,
          thickness: 2,
          padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
        ),
      ],
    );
  }

  Widget trackingExpanel() {
    return AppExpansionListTile(
      isDisabled: true,
      expand: true,
      backgroundColor: AppColors.white,
      title: 'Tracking',
      paddingChild: EdgeInsets.all(AppSizes.padding),
      children: [
        SizedBox(
          height: AppSizes.screenSize.width,
          child: AppSteps(
            steps: basicSteps,
            direction: Axis.vertical,
          ),
        ),
      ],
    );
  }

  Widget buttonDown() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.padding * 2),
      child: AppCardContainer(
        padding: const EdgeInsets.all(0),
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: AppColors.blueLv4,
            offset: Offset(4, 8),
            blurRadius: 24,
            spreadRadius: 0,
          ),
        ],
        child: AppButton(
          text: 'Kembali',
          textColor: AppColors.primary,
          buttonColor: AppColors.blueLv5,
          rounded: true,
          onTap: () {},
        ),
      ),
    );
  }
}
