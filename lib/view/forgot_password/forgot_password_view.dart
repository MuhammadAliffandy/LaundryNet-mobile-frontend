import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_dialog.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
// import 'package:alvamind_library/widget/molecule/app_snackbar.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/assets/app_assets.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class ForgotPasswordView extends StatefulWidget {
  static const routeName = '/forgot-password-screen';

  const ForgotPasswordView({
    super.key,
  });

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: buttonBottom(),
      body: AppNestedScrollView(
        title: appBar(),
        body: body(),
        padding: EdgeInsets.only(
          top: AppSizes.padding * 6,
          right: AppSizes.padding,
          left: AppSizes.padding,
        ),
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
          'Lupa Password',
          style: AppTextStyle.bold(
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppAsset.forgetPasswordImage),
        SizedBox(height: AppSizes.padding * 7),
        Text(
          'Masukkan email anda untuk menerima password baru. ',
          style: AppTextStyle.medium(size: 18),
        ),
        SizedBox(
          height: AppSizes.padding,
        ),
        AppTextField(
          suffixIcon: Icons.mail_outline,
          hintText: 'Masukkan Email',
          onChanged: (value) {
            // TODO
          },
        ),
      ],
    );
  }

  Widget buttonBottom() {
    return SizedBox(
      height: 100,
      child: AppCardContainer(
        backgroundColor: AppColors.transparent,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: AppColors.blueLv4,
            offset: Offset(0, 4),
            blurRadius: 24,
            spreadRadius: -18,
          ),
        ],
        child: AppButton(
          text: 'Selanjutnya',
          rounded: true,
          buttonColor: AppColors.primary,
          onTap: () {
            // TODO
            final navigator = Navigator.of(context);

            AppDialog.show(
              navigator,
              padding: const EdgeInsets.all(0),
              backgroundColor: Colors.transparent,
              child: AppDialogCustomWidget(
                backgroundColor: AppColors.white,
                image: AppAssets.info,
                title: 'Reset password berhasil!',
                titleColor: AppColors.primary,
                subtitle: 'Harap periksa email anda untuk melihat password terbaru.',
                subtitleColor: AppColors.black,
                textButton: 'Buka Email',
                textSecondButton: 'Kembali',
                onTapButton: () {
                  // TODO
                },
                onTapSecondButton: () {
                  // TODO
                  Navigator.pop(context);
                },
              ),
            );

            // AppSnackbar.show(
            //   navigator,
            //   icon: Icons.info,
            //   title: '324142: Gagal terkoneksi server. Harap periksa Internet anda',
            //   titleStyle: AppTextStyle.bold(size: 10, color: AppColors.white),
            //   backgroundColor: AppColors.redLv1,
            //   showCloseButton: true,
            // );
          },
        ),
      ),
    );
  }
}
