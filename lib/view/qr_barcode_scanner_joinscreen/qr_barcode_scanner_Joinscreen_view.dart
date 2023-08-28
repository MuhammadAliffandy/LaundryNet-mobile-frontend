import 'dart:developer';
import 'dart:io';

import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/app/theme/app_sizes.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class QRBarcodeScannerJoinscreen extends StatefulWidget {
  static const routeName = '/qr-barcode-scanner-joinscreen';

  const QRBarcodeScannerJoinscreen({Key? key}) : super(key: key);

  @override
  State<QRBarcodeScannerJoinscreen> createState() => _QRBarcodeScannerJoinscreenState();
}

class _QRBarcodeScannerJoinscreenState extends State<QRBarcodeScannerJoinscreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlueLv5,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.transparent,
        elevation: 0,
        leading: AppIconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: AppColors.white,
          ),
          onTap: () {
            // TODO
            Navigator.of(context).pop();
          },
          buttonColor: AppColors.transparent,
        ),
        bottom: PreferredSize(child: headText(), preferredSize: Size.fromHeight(120)),
      ),
      body: Stack(
        children: <Widget>[
          _buildQrView(context),
          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: bottomButton(),
          ),
        ],
      ),
    );
  }

  Widget headText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Barcode Scanner',
            style: AppTextStyle.bold(
              size: 32,
              color: AppColors.white,
            ),
          ),
          SizedBox(
            height: AppSizes.padding,
          ),
          Text(
            'Arahkan kamera ke Barcode Code dan tahan beberapa saat.',
            textAlign: TextAlign.center,
            style: AppTextStyle.medium(
              size: 18,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400) ? 350.0 : 300.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(borderColor: AppColors.primary, borderRadius: 10, borderLength: 50, borderWidth: 10, cutOutSize: scanArea, overlayColor: Color(0xFF35383F).withOpacity(0.95)),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  Widget bottomButton() {
    return Padding(
      padding: EdgeInsets.all(AppSizes.padding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AppIconButton(
                icon: const Icon(
                  Icons.photo,
                  color: AppColors.primary,
                ),
                onTap: () {},
                buttonColor: AppColors.white,
                padding: EdgeInsets.all(AppSizes.padding),
              ),
              SizedBox(
                width: AppSizes.padding * 1.5,
              ),
              AppIconButton(
                icon: const Icon(
                  CustomIcon.scanIcon,
                  color: AppColors.white,
                  size: 40,
                ),
                onTap: () {},
                buttonColor: AppColors.primary,
                padding: EdgeInsets.all(AppSizes.padding * 1.5),
              ),
              SizedBox(
                width: AppSizes.padding * 1.5,
              ),
              AppIconButton(
                icon: const Icon(
                  Icons.folder,
                  color: AppColors.primary,
                ),
                onTap: () {},
                buttonColor: AppColors.white,
                padding: EdgeInsets.all(AppSizes.padding),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
