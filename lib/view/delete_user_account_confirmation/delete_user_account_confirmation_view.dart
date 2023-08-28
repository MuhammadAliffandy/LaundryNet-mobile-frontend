import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_image.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';

import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';

import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class DeleteUserAccountConfirmationView extends StatefulWidget {
  static const routeName = '/delete-user-account-confirmation-screen';

  const DeleteUserAccountConfirmationView({super.key});

  @override
  State<DeleteUserAccountConfirmationView> createState() => _DeleteUserAccountConfirmationViewState();
}

class _DeleteUserAccountConfirmationViewState extends State<DeleteUserAccountConfirmationView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.redLv2,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar(),
        backgroundColor: AppColors.redLv2,
        elevation: 0,
      ),
      body: body(),
    );
  }

  Widget appBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppIconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
          buttonColor: AppColors.transparent,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        Text(
          'Hapus Akun',
          style: AppTextStyle.bold(
            size: 24,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget body() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: AppSizes.padding * 2),
            headLine(),
            SizedBox(height: AppSizes.padding * 2),
            formConfirmation(),
          ],
        ),
      ),
    );
  }

  Widget headLine() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AppImage(
          image: AppAssets.failed,
          imgProvider: ImgProvider.assetImage,
          width: 150,
          height: 150,
        ),
        SizedBox(height: AppSizes.padding * 2),
        textAbout('Hapus Akun', 'Apa Anda Serius Ingin mengahapus akun? jika anda serius ketik “Hapus” pada kolom dibawah.'),
      ],
    );
  }

  Widget formConfirmation() {
    return AppColumnInk(
      children: [
        AppTextField(
          hintText: 'Hapus',
          fillColor: AppColors.white,
          onChanged: (text) {
            // TODO
          },
        ),
        SizedBox(height: AppSizes.padding * 1.5),
        AppButton(
          text: 'Hapus Akun',
          buttonColor: AppColors.redLv1,
          onTap: () {
            // TODO
          },
        ),
        SizedBox(height: AppSizes.padding * 1.5),
        AppButton(
          text: 'Batal',
          buttonColor: AppColors.white,
          textColor: AppColors.black,
          onTap: () {
            // TODO
          },
        ),
      ],
    );
  }

  Widget textAbout(
    String title,
    String subtitle,
  ) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyle.bold(
            size: 18,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: AppSizes.padding),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyle.medium(
            size: 16,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
