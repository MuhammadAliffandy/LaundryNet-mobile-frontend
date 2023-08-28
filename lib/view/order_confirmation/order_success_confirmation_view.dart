import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_progress_indicator.dart';

import 'package:alvamind_library/widget/molecule/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';

import '../../app/theme/app_colors.dart';

class OrderSuccessConfirmationView extends StatefulWidget {
  static const routeName = '/order-success-confirmation-screen';

  const OrderSuccessConfirmationView({super.key});

  @override
  State<OrderSuccessConfirmationView> createState() => _OrderSuccessConfirmationViewState();
}

class _OrderSuccessConfirmationViewState extends State<OrderSuccessConfirmationView> {
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
        image: AppAssets.success,
        title: 'Berhasil!',
        titleColor: AppColors.greenLv1,
        subtitle: 'Pesanan ada telah terkirim untuk ditindaklajuti oleh Toko.',
        subtitleColor: AppColors.black,
        textButton: 'Lihat Status Pesanan',
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
