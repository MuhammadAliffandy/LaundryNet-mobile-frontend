import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_progress_indicator.dart';

import 'package:alvamind_library/widget/molecule/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';

import '../../app/theme/app_colors.dart';

class OrderLoadingView extends StatefulWidget {
  static const routeName = '/order-loading-screen';

  const OrderLoadingView({super.key});

  @override
  State<OrderLoadingView> createState() => _OrderLoadingViewState();
}

class _OrderLoadingViewState extends State<OrderLoadingView> {
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
      child: const AppDialogCustomWidget(
        backgroundColor: AppColors.white,
        image: AppAssets.info,
        title: 'Harap Menunggu',
        titleColor: AppColors.primary,
        subtitle: 'Order anda sedang diproses',
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
}
