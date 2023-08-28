import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_modal.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/organism/terms_condition_list/terms_condition_list.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class PrivacyPolicyView extends StatefulWidget {
  static const routeName = '/privacy-policy-screen';

  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
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
        miniTitle: 'Apakah anda setuju?',
        subtitle: 'Lorem ipsum dolor sit amet hua qui lori ipsum sit ghui amet poety amet',
        subtitleColor: AppColors.black,
        directionButton: Axis.horizontal,
        price: false,
        children: [
          Expanded(
            child: AppButton(
              onTap: () {},
              text: 'Tidak',
              textColor: AppColors.primary,
              buttonColor: AppColors.blueLv5,
              rounded: true,
            ),
          ),
          SizedBox(width: AppSizes.padding / 2),
          Expanded(
            child: AppButton(
              onTap: () {},
              text: 'Ya, Setuju',
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: AppTextStyle.bold(size: 24),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Update Terakhir : 24 Mei 2023',
              style: AppTextStyle.medium(size: 12),
            ),
          ],
        )
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        const TermsConditionList(
          withHeadTitle: false,
          title: [
            '1. Lorep Ipsum ',
            '2. Lorep Ipsum ',
            '3. Lorep Ipsum ',
            '4. Lorep Ipsum ',
          ],
          subtitle: [
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua incididunt ut labore et dolore magna aliqua.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua incididunt ut labore et dolore magna aliqua.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua incididunt ut labore et dolore magna aliqua.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua incididunt ut labore et dolore magna aliqua.',
          ],
        ),
        SizedBox(
          height: AppSizes.padding * 18,
        )
      ],
    );
  }
}
