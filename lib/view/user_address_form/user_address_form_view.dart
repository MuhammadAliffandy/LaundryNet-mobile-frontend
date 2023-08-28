import 'dart:async';

import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/app/const/countries.dart';
import 'package:alvamind_library/app/utility/console_log.dart';
import 'package:alvamind_library/widget/atom/app_divider.dart';

import 'package:alvamind_library/widget/molecule/app_Checkbox.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';

import '../../app/theme/app_colors.dart';

class UserAddressFormView extends StatefulWidget {
  static const routeName = '/user-address-form-screen';

  const UserAddressFormView({super.key});

  @override
  State<UserAddressFormView> createState() => _UserAddressFormViewState();
}

class _UserAddressFormViewState extends State<UserAddressFormView> {
  bool checkboxSelected = false;
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  //

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          child: GoogleMap(
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
              target: LatLng(30.488774662306618, 31.032559163868427),
              zoom: 9,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
        form()
      ],
    );
  }

  Widget form() {
    return AppCardContainer(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppDivider(
            thickness: 4,
            color: AppColors.blackLv7,
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: AppSizes.padding * 8.5,
            ),
          ),
          SizedBox(height: AppSizes.padding),
          AppTextField(
            hintText: 'Masukan Alamat Lengkap ',
            maxLines: 7,
            onChanged: (String) {
              // TODO
            },
          ),
          SizedBox(height: AppSizes.padding),
          AppTextField(
            hintText: 'Label  Alamat',
            prefixIcon: CustomIcon.homeIcon,
            onChanged: (String) {
              // TODO
            },
          ),
          Column(
            children: [
              SizedBox(height: AppSizes.padding),
              AppTextField(
                hintText: 'Nama Penerima',
                prefixIcon: Icons.person,
                onChanged: (String) {
                  // TODO
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

                  setState(() {});
                },
              ),
              SizedBox(height: AppSizes.padding),
              AppButton(
                leftIcon: Icons.location_on_rounded,
                text: 'Pin Poin Alamat',
                textColor: AppColors.primary,
                buttonColor: AppColors.blueLv5,
                onTap: () {},
              ),
              const AppDivider(thickness: 2, color: AppColors.blackLv9),
              AppCheckbox(
                value: checkboxSelected,
                onChanged: (val) {
                  checkboxSelected = val!;
                  setState(() {});
                },
                title: 'Jadikan Sebagai Alamat Utama',
              ),
            ],
          ),
          const AppDivider(thickness: 2, color: AppColors.blackLv9),
          AppButton(
            text: 'Simpan',
            rounded: true,
            onTap: () {
              // TODO
            },
          ),
          SizedBox(height: AppSizes.padding),
        ],
      ),
    );
  }
}
