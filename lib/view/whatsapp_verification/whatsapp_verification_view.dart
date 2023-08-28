import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class WhatsappVerificationView extends StatefulWidget {
  static const routeName = '/whatsapp-verification-screen';

  const WhatsappVerificationView({super.key});

  @override
  State<WhatsappVerificationView> createState() => _WhatsappVerificationViewState();
}

class _WhatsappVerificationViewState extends State<WhatsappVerificationView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: appBar(),
      ),
      body: body(),
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
          'Verifikasi No Whatsapp',
          style: AppTextStyle.bold(
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget body() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: AppColumnInk(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Kode OTP telah dikirim ke +62 111 ******99',
            style: AppTextStyle.medium(
              size: 18,
            ),
          ),
          SizedBox(height: AppSizes.padding * 4),
          inputFieldCode(),
          SizedBox(height: AppSizes.padding * 4),
          TextButton(
              onPressed: () {},
              child: Text(
                'Kirim Ulang Kode',
                style: AppTextStyle.bold(
                  size: 16,
                  color: AppColors.primary,
                ),
              )),
          SizedBox(height: AppSizes.padding * 6),
          AppButton(
            rounded: true,
            text: 'Verfikasi',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget inputFieldCode() {
    return Row(
      children: [
        Expanded(
          child: AppTextField(
            type: AppTextFieldType.number,
            maxLength: 1,
            contentPadding: EdgeInsets.symmetric(
              vertical: AppSizes.padding,
              horizontal: AppSizes.padding * 1.8,
            ),
            textStyle: AppTextStyle.bold(
              size: 16,
            ),
            onChanged: (value) {
              // TODO
            },
          ),
        ),
        SizedBox(
          width: AppSizes.padding,
        ),
        Expanded(
          child: AppTextField(
            type: AppTextFieldType.number,
            maxLength: 1,
            contentPadding: EdgeInsets.symmetric(
              vertical: AppSizes.padding,
              horizontal: AppSizes.padding * 1.8,
            ),
            textStyle: AppTextStyle.bold(
              size: 16,
            ),
            onChanged: (value) {
              // TODO
            },
          ),
        ),
        SizedBox(
          width: AppSizes.padding,
        ),
        Expanded(
          child: AppTextField(
            type: AppTextFieldType.number,
            maxLength: 1,
            contentPadding: EdgeInsets.symmetric(
              vertical: AppSizes.padding,
              horizontal: AppSizes.padding * 1.8,
            ),
            textStyle: AppTextStyle.bold(
              size: 16,
            ),
            onChanged: (value) {
              // TODO
            },
          ),
        ),
        SizedBox(
          width: AppSizes.padding,
        ),
        Expanded(
          child: AppTextField(
            type: AppTextFieldType.number,
            maxLength: 1,
            contentPadding: EdgeInsets.symmetric(
              vertical: AppSizes.padding,
              horizontal: AppSizes.padding * 1.8,
            ),
            textStyle: AppTextStyle.bold(
              size: 16,
            ),
            onChanged: (value) {
              // TODO
            },
          ),
        ),
      ],
    );
  }
}
