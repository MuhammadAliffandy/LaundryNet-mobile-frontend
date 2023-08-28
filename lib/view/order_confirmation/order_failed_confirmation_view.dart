import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_progress_indicator.dart';

import 'package:alvamind_library/widget/molecule/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';

import '../../app/theme/app_colors.dart';

class OrderFailedConfirmationView extends StatefulWidget {
  static const routeName = '/order-failed-confirmation-screen';

  const OrderFailedConfirmationView({super.key});

  @override
  State<OrderFailedConfirmationView> createState() => _OrderFailedConfirmationViewState();
}

class _OrderFailedConfirmationViewState extends State<OrderFailedConfirmationView> {
  @override
  void initState() {
    super.initState();
    _showModal();
  }

  _showModal() {
    final navigator = Navigator.of(context);
    modalLoading(navigator);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
      height: MediaQuery.of(context).size.height,
      color: Color(0xFF09101D),
    );
  }

  modalLoading(NavigatorState navigator) {
    return AppDialog.show(
      navigator,
      showButtons: false,
      padding: const EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      child: AppDialogCustomWidget(
        backgroundColor: AppColors.white,
        image: AppAssets.failed,
        title: 'Gagal',
        titleColor: AppColors.redLv1,
        subtitle: 'Pesanan anda gagal kami proses karena beberapa hal.',
        subtitleColor: AppColors.black,
        textButton: 'Coba lagi',
        textSecondButton: 'Kembali ke Beranda',
        onTapButton: () {
          // TODO
        },
        onTapSecondButton: () {
          // TODO
        },
        moreitem: Padding(
          padding: EdgeInsets.only(top: AppSizes.padding),
          child: const AppProgressIndicator(
            showMessage: false,
            size: 80,
          ),
        ),
      ),
    );
  }
}
