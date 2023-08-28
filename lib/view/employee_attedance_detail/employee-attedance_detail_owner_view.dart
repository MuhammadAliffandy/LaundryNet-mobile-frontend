import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_expansion_list_tile.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';
import 'package:alvamind_library/widget/molecule/app_modal.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:alvamind_library/widget/organism/order_card/order_card.dart';
import 'package:alvamind_library/widget/organism/order_list/order_list.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class EmployeeAttedanceDetailOwnerView extends StatefulWidget {
  static const viewAsOwner = '/employee-attedance-detail-owner-screen';

  const EmployeeAttedanceDetailOwnerView({super.key});

  @override
  State<EmployeeAttedanceDetailOwnerView> createState() => _EmployeeAttedanceDetailOwnerViewState();
}

class _EmployeeAttedanceDetailOwnerViewState extends State<EmployeeAttedanceDetailOwnerView> {
  ScrollController? _controller;
  @override
  void initState() {
    _controller = ScrollController();
    _controller?.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller!.offset >= _controller!.position.maxScrollExtent && !_controller!.position.outOfRange) {
      setState(() {});
      final navigator = Navigator.of(context);
      AppModal.show(
        navigator,
        backgroundColor: AppColors.white,
        price: false,
        children: [
          Expanded(
            child: AppButton(
              onTap: () {},
              text: 'Absen',
              rounded: true,
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AppNestedScrollView(
        controller: _controller,
        body: body(),
        title: appBar(),
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
              'Detail Absensi',
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
        operasionalCard(),
        SizedBox(height: AppSizes.padding * 1.5),
        checkIn(),
        SizedBox(height: AppSizes.padding * 1.5),
        checkOut(),
        SizedBox(height: AppSizes.padding * 4),
      ],
    );
  }

  Widget operasionalCard() {
    return AppExpansionListTile(
      backgroundColor: AppColors.white,
      title: '2 Agustus 2023',
      expand: true,
      isDisabled: false,
      showExpandButton: false,
      paddingChild: EdgeInsets.all(AppSizes.padding),
      children: [
        AppLongCard(
          padding: EdgeInsets.zero,
          children: [
            Expanded(
                child: textHeadline(
              'Jadwal Masuk',
              [
                AppTextField(
                  hintText: 'Sen - Min',
                  hintStyle: AppTextStyle.bold(size: 14),
                ),
              ],
              CrossAxisAlignment.start,
            )),
            SizedBox(
              width: AppSizes.padding,
            ),
            Expanded(
                child: textHeadline(
              'Defisit',
              [
                AppTextField(
                  hintText: '+30min',
                  hintStyle: AppTextStyle.bold(size: 14),
                ),
              ],
              CrossAxisAlignment.end,
            )),
          ],
        )
      ],
    );
  }

  Widget checkIn() {
    return const OrderList(
      title: 'Alasan',
      dateTime: '12 : 30 PM',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      location: 'Tokyo, Jepang',
      boxShadow: [
        BoxShadow(
          color: AppColors.blackLv8,
          offset: Offset(4, 8),
          blurRadius: 24,
          spreadRadius: 0,
        ),
      ],
      orderCard: OrderCard(
        padding: EdgeInsets.all(0),
        backgroundColor: AppColors.transparent,
        starImageCount: '50',
        title: 'Check In',
        isProgress: true,
        textPrice: '08:00 AM',
        labelingCount: 40,
        tagColor: AppColors.greenLv3,
        tagBorderWidth: 0,
        showButton: false,
      ),
    );
  }

  Widget checkOut() {
    return const OrderList(
      title: 'Alasan',
      dateTime: '12 : 30 PM',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      location: 'Tokyo, Jepang',
      boxShadow: [
        BoxShadow(
          color: AppColors.blackLv8,
          offset: Offset(4, 8),
          blurRadius: 24,
          spreadRadius: 0,
        ),
      ],
      orderCard: OrderCard(
        padding: EdgeInsets.all(0),
        backgroundColor: AppColors.transparent,
        starImageCount: '50',
        title: 'Check Out',
        isProgress: true,
        textPrice: '18:00 PM',
        labelingCount: 40,
        tagColor: AppColors.greenLv3,
        tagBorderWidth: 0,
        showButton: false,
      ),
    );
  }

  Widget textHeadline(String title, List<Widget> widget, CrossAxisAlignment crossAxisAlignment) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(title, style: AppTextStyle.bold(size: 20)),
        SizedBox(height: AppSizes.padding),
        ...widget,
      ],
    );
  }
}
