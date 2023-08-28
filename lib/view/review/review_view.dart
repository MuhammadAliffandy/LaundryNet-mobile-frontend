import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_avatar.dart';
import 'package:alvamind_library/widget/atom/app_divider.dart';
import 'package:alvamind_library/widget/atom/app_image.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_modal.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:alvamind_library/widget/organism/review/star_checked.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class ReviewView extends StatefulWidget {
  static const routeName = '/review-screen';

  const ReviewView({super.key});

  @override
  State<ReviewView> createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  @override
  void initState() {
    _showReview();
    super.initState();
  }

  _showReview() {
    setState(() {});
    final navigator = Navigator.of(context);
    AppModal.show(
      navigator,
      backgroundColor: AppColors.white,
      isScrolled: true,
      title: 'Berikan Ulasan Anda',
      miniTitle: 'Bagaimana Menurut Anda Dengan Layanan Yang Diberikan Barokah Laundry?',
      subtitleColor: AppColors.black,
      directionButton: Axis.horizontal,
      price: false,
      moreWidget: [
        reviewForm(),
      ],
      children: [
        Expanded(
          child: AppButton(
            onTap: () {},
            text: 'Mungkin Nanti',
            textColor: AppColors.primary,
            buttonColor: AppColors.blueLv5,
            rounded: true,
          ),
        ),
        SizedBox(width: AppSizes.padding / 2),
        Expanded(
          child: AppButton(
            onTap: () {},
            text: 'Kirim Ulasan',
            rounded: true,
            buttonColor: AppColors.blackLv7,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
      ),
    );
  }

  Widget reviewForm() {
    return AppColumnInk(
      children: [
        SizedBox(height: AppSizes.padding * 1.5),
        textHeadline(
            'Kebersihan',
            [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.padding * 2),
                child: StarChecked(onTapStar: (value) {
                  // TODO
                }),
              ),
            ],
            CrossAxisAlignment.center),
        SizedBox(height: AppSizes.padding * 1.5),
        textHeadline(
            'Kualitas',
            [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.padding * 2),
                child: StarChecked(onTapStar: (value) {
                  // TODO
                }),
              ),
            ],
            CrossAxisAlignment.center),
        SizedBox(height: AppSizes.padding * 1.5),
        textHeadline(
            'Kecepatan',
            [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.padding * 2),
                child: StarChecked(onTapStar: (value) {
                  // TODO
                }),
              ),
            ],
            CrossAxisAlignment.center),
        const AppDivider(
          thickness: 2,
          color: AppColors.blackLv8,
        ),
        textHeadline(
            'Unggah Foto',
            [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(3, (index) {
                    return AppAvatar(
                      size: 100,
                      image: randomImage,
                      showIconButton: index == 2 ? false : true,
                      icon: CustomIcon.editPenIcon,
                      borderWidth: 0,
                      onTap: () {
                        // TODO
                      },
                    );
                  })
                ],
              )
            ],
            CrossAxisAlignment.start),
        const AppDivider(
          thickness: 2,
          color: AppColors.blackLv8,
        ),
        textHeadline(
            'Tuliskan Review Ke Toko Ini',
            [
              AppTextField(
                hintText: 'Masukkan Review disini...',
                maxLines: 5,
                onChanged: (value) {
                  // TODO
                },
              ),
            ],
            CrossAxisAlignment.start),
        SizedBox(height: AppSizes.padding * 1.5),
      ],
    );
  }

  Widget textHeadline(String title, List<Widget> widget, CrossAxisAlignment crossAxisAlignment) {
    return AppColumnInk(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(title, style: AppTextStyle.bold(size: 18)),
        SizedBox(height: AppSizes.padding),
        ...widget,
      ],
    );
  }
}
