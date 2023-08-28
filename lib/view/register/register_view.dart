import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/app/const/countries.dart';
import 'package:alvamind_library/app/const/gender.dart';
import 'package:alvamind_library/app/utility/console_log.dart';
import 'package:alvamind_library/model/drop_down_model.dart';
import 'package:alvamind_library/model/gender_model.dart';
import 'package:alvamind_library/widget/atom/app_avatar.dart';
import 'package:alvamind_library/widget/atom/app_image.dart';
import 'package:alvamind_library/widget/molecule/app_Checkbox.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_drop_down.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';
import 'package:laundrynet_mobile_frontend/view/login/login_view.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class RegisterView extends StatefulWidget {
  static const routeName = '/register-screen';

  const RegisterView({
    super.key,
  });

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

bool isTyping = false;
GenderModel _gender = gender.first;

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        isTyping = false;
        setState(() {});
        return true;
      },
      child: Scaffold(
        body: AppNestedScrollView(
          body: body(),
          title: appBar(),
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
            isTyping = false;
            setState(() {});
          },
        ),
        Text(
          'Registrasi Pengguna',
          style: AppTextStyle.bold(size: 24),
        ),
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AppAvatar(
          size: 140,
          image: randomImage,
          showIconButton: true,
          icon: CustomIcon.editPenIcon,
          borderWidth: 0,
        ),
        SizedBox(height: AppSizes.padding),
        form(),
      ],
    );
  }

  Widget form() {
    return AppColumnInk(
      children: [
        AppTextField(
          hintText: 'Nama lengkap',
          onChanged: (value) {
            // TODO
            isTyping = true;
            setState(() {});
          },
        ),
        SizedBox(height: AppSizes.padding),
        AppTextField(
          hintText: 'Email',
          suffixIcon: Icons.email_outlined,
          onChanged: (value) {
            // TODO
            isTyping = true;
            setState(() {});
          },
        ),
        SizedBox(height: AppSizes.padding),
        AppTextField(
          hintText: 'Input phone number',
          prefixIcon: Icons.lock,
          type: AppTextFieldType.phone,
          selectedCountry: countries.first,
          onTapCountry: (country) {
            cl(country.phoneCode);
          },
          onChanged: (value) {
            // TODO
            isTyping = true;
            setState(() {});
          },
        ),
        SizedBox(height: AppSizes.padding),
        AppTextField(
          type: AppTextFieldType.password,
          hintText: 'Password',
          onChanged: (value) {
            // TODO
            isTyping = true;
            setState(() {});
          },
        ),
        SizedBox(height: AppSizes.padding),
        AppTextField(
          type: AppTextFieldType.password,
          hintText: 'Konfirmasi Password',
          onChanged: (value) {
            // TODO
            isTyping = true;
            setState(() {});
          },
        ),
        SizedBox(height: AppSizes.padding),
        AppDropDown(
          onTapItem: (item) {
            _gender = gender.firstWhere((e) => e.codeGender == item.value);
          },
          hintText: 'Gender',
          selectedItem: _gender.textGender,
          items: List.generate(
            gender.length,
            (i) => DropDownModel(text: gender[i].textGender, value: gender[i].codeGender),
          ),
          itemsBuilder: (item) {
            return Text(
              item.text,
              style: AppTextStyle.semibold(size: 12),
            );
          },
        ),
        SizedBox(height: AppSizes.padding),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCheckbox(
              value: checkbocSelected,
              onChanged: (val) {
                checkbocSelected = val!;
                setState(() {});
              },
              title: 'Saya setuju dengan Terms & Conditions',
            ),
            AppCheckbox(
              value: checkbocSelected,
              onChanged: (val) {
                checkbocSelected = val!;
                setState(() {});
              },
              title: 'Saya setuju dengan Privacy Policy',
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
            text: 'Registrasi',
            rounded: true,
            buttonColor: isTyping == true ? AppColors.primary : AppColors.blackLv6,
            onTap: () {},
          ),
        ),
        SizedBox(height: AppSizes.padding * 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sudah memiliki akun?',
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
              text: 'Login',
              fontSize: 14,
              textColor: AppColors.primary,
              onTap: () {},
            )
          ],
        ),
      ],
    );
  }
}
