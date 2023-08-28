import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_progress_indicator.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_dialog.dart';
import 'package:alvamind_library/widget/molecule/app_modal.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';

import '../../app/theme/app_colors.dart';

class ModalView extends StatefulWidget {
  static const routeName = '/modal-screen';

  const ModalView({super.key});

  @override
  State<ModalView> createState() => _ModalViewState();
}

class _ModalViewState extends State<ModalView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
      height: MediaQuery.of(context).size.height,
      color: Color(0xFF09101D),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              text: 'Modal Popup',
              onTap: () {
                final navigator = Navigator.of(context);
                modalLoading(navigator);
              },
            ),
            SizedBox(
              height: AppSizes.padding,
            ),
            AppButton(
              text: 'Modal Logout',
              onTap: () {
                final navigator = Navigator.of(context);
                modalLogout(navigator);
              },
            ),
          ],
        ),
      ),
    );
  }

  modalLoading(NavigatorState navigator) {
    return AppDialog.show(
      navigator,
      showButtons: false,
      padding: const EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      child: const AppDialogCustomWidget(
        backgroundColor: AppColors.white,
        image: AppAssets.info,
        title: 'Berhasil',
        titleColor: AppColors.primary,
        subtitle: 'Akun berhasil dibuat, anda akan dialihkan ke halaman dashboard dalam beberapa detik',
        subtitleColor: AppColors.black,
        itemBottom: [
          AppProgressIndicator(
            showMessage: false,
            size: 80,
          ),
        ],
      ),
    );
  }

  modalLogout(NavigatorState navigator) {
    return AppModal.show(
      navigator,
      backgroundColor: AppColors.white,
      title: 'Logout',
      titleColor: AppColors.redLv1,
      miniTitle: 'Are you sure you want to log out?',
      directionButton: Axis.horizontal,
      price: false,
      children: [
        Expanded(
          child: AppButton(
            onTap: () {},
            text: 'Cancel',
            textColor: AppColors.primary,
            buttonColor: AppColors.blueLv5,
            rounded: true,
          ),
        ),
        SizedBox(width: AppSizes.padding / 2),
        Expanded(
          child: AppButton(
            onTap: () {},
            text: 'Ya, Logout',
            rounded: true,
          ),
        ),
      ],
    );
  }
}
