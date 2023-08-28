import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_logo.dart';
import 'package:alvamind_library/widget/molecule/app_Checkbox.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';

import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_colors.dart';

import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class LoginView extends StatefulWidget {
  static const routeName = '/login-screen';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

bool checkbocSelected = false;
bool isTyping = false;

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: AppIconButton(
          buttonColor: AppColors.transparent,
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
          onTap: () {
            Navigator.pop(context);
            setState(() {
              isTyping = false;
            });
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          setState(() {
            isTyping = false;
          });
          return true;
        },
        child: body(),
      ),
    );
  }

  Widget body() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        logo(),
        loginForm()
      ],
    );
  }

  Widget loginForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Hi, Selamat Datang',
          style: AppTextStyle.bold(size: 32, color: AppColors.white),
        ),
        SizedBox(
          height: AppSizes.padding,
        ),
        AppCardContainer(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.padding,
            vertical: AppSizes.padding * 2,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppTextField(
                prefixIcon: Icons.mail,
                hintText: 'Email',
                onChanged: (value) {
                  // TODO
                  setState(() {
                    isTyping = true;
                  });
                },
              ),
              SizedBox(height: AppSizes.padding),
              AppTextField(
                prefixIcon: Icons.lock,
                hintText: 'Password',
                type: AppTextFieldType.password,
                onChanged: (value) {
                  // TODO
                  setState(() {
                    isTyping = true;
                  });
                },
              ),
              SizedBox(height: AppSizes.padding),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppCheckbox(
                    value: checkbocSelected,
                    onChanged: (val) {
                      checkbocSelected = val!;
                      setState(() {});
                    },
                    title: 'Ingatkan Saya',
                  ),
                ],
              ),
              SizedBox(height: AppSizes.padding),
              AppCardContainer(
                padding: const EdgeInsets.all(0),
                backgroundColor: AppColors.transparent,
                borderRadius: BorderRadius.circular(100),
                boxShadow: isTyping == true
                    ? const [
                        BoxShadow(
                          color: AppColors.blueLv4,
                          offset: Offset(0, 4),
                          blurRadius: 24,
                          spreadRadius: 0,
                        ),
                      ]
                    : [],
                child: AppButton(
                  text: 'Masuk',
                  rounded: true,
                  buttonColor: isTyping == true ? AppColors.primary : AppColors.blackLv6,
                  onTap: () {},
                ),
              ),
              SizedBox(height: AppSizes.padding * 1.5),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot The Password',
                    style: AppTextStyle.bold(
                      size: 16,
                      color: AppColors.primary,
                    ),
                  )),
              SizedBox(height: AppSizes.padding * 1.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum memiliki akun?',
                    style: AppTextStyle.medium(
                      size: 14,
                      color: AppColors.blackLv6,
                    ),
                  ),
                  SizedBox(
                    width: AppSizes.padding / 2,
                  ),
                  AppButton(
                    padding: EdgeInsets.zero,
                    buttonColor: AppColors.white,
                    text: 'Daftar',
                    fontSize: 14,
                    textColor: AppColors.primary,
                    onTap: () {},
                  )
                ],
              ),
              SizedBox(height: AppSizes.padding / 2),
            ],
          ),
        ),
      ],
    );
  }

  Widget logo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: AppSizes.padding * 6,
        ),
        Center(
          child: AppLogo(
            title: 'LaundryNet',
            image: AppAssets.logoCircle,
            withText: true,
            size: 60,
            titleStyle: AppTextStyle.bold(
              size: 40,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
