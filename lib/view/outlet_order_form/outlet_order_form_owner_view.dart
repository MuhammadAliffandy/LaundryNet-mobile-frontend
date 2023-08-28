import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/app/const/gender.dart';
import 'package:alvamind_library/model/drop_down_model.dart';
import 'package:alvamind_library/model/gender_model.dart';
import 'package:alvamind_library/widget/atom/app_divider.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_drop_down.dart';
import 'package:alvamind_library/widget/molecule/app_expansion_list_tile.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_long_card.dart';
import 'package:alvamind_library/widget/molecule/app_modal.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_tags.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:alvamind_library/widget/molecule/app_transaction_info.dart';
import 'package:alvamind_library/widget/molecule/app_validation.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list_selected.dart';
import 'package:alvamind_library/widget/organism/transaction_review_card/list_card_progress.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class OutletOrderFormOwnerView extends StatefulWidget {
  static const viewAsOwner = '/outlet-order-form-owner-screen';

  const OutletOrderFormOwnerView({super.key});

  @override
  State<OutletOrderFormOwnerView> createState() => _OutletOrderFormOwnerViewState();
}

class _OutletOrderFormOwnerViewState extends State<OutletOrderFormOwnerView> {
  ScrollController? _controller;
  GenderModel _gender = gender.first;
  List<bool> isSelected = [
    ...List.generate(5, (index) {
      return false;
    }),
  ];

  List<int> itemCount = [
    ...List.generate(5, (index) {
      return 0;
    })
  ];

  int itemWeight = 0;
  Color itemWeightColor = AppColors.blackLv5;
  int itemSelected = 0;

  @override
  void initState() {
    _controller = ScrollController();
    _controller?.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller!.offset >= _controller!.position.maxScrollExtent && !_controller!.position.outOfRange) {
      AppModal.show(
        Navigator.of(context),
        price: false,
        children: [],
        moreWidget: [
          AppColumnInk(
            children: [
              Text(
                'Estimasi Berat 2-4 Kg @ 3 Item',
                style: AppTextStyle.bold(size: 16),
              ),
              SizedBox(
                height: AppSizes.padding,
              ),
              AppLongCard(
                padding: EdgeInsets.all(0),
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Pesanan',
                        style: AppTextStyle.regular(size: 10),
                      ),
                      SizedBox(
                        height: AppSizes.padding / 2,
                      ),
                      Text(
                        'Rp35.000',
                        style: AppTextStyle.bold(size: 24, color: AppColors.primary),
                      )
                    ],
                  ),
                  SizedBox(
                    width: AppSizes.padding,
                  ),
                  Expanded(
                    child: AppButton(
                      rounded: true,
                      text: 'Metode Pembayaran',
                      onTap: () {
                        // TODO
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AppNestedScrollView(
        controller: _controller,
        title: appBar(),
        body: body(),
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
          },
        ),
        Text(
          'Buat Pesanan',
          style: AppTextStyle.bold(size: 24),
        ),
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        dropService(),
        SizedBox(height: AppSizes.padding * 1.5),
        consumenPanel(),
        SizedBox(height: AppSizes.padding * 1.5),
        orderListPanel(),
        SizedBox(height: AppSizes.padding * 1.5),
        productionProcess(),
        SizedBox(height: AppSizes.padding * 1.5),
        statusComplain(),
        SizedBox(height: AppSizes.padding * 1.5),
        weightItem(),
        SizedBox(height: AppSizes.padding * 1.5),
        employeeDetail(),
        SizedBox(height: AppSizes.padding * 1.5),
        validaton(),
        SizedBox(height: AppSizes.padding * 1.5),
        paymentDetail(),
        SizedBox(height: AppSizes.padding * 4),
      ],
    );
  }

  Widget dropService() {
    return AppDropDown(
      prefixIcon: Icons.person,
      iconsSize: 20,
      onTapItem: (item) {
        _gender = gender.firstWhere((e) => e.codeGender == item.value);
      },
      hintText: 'Drop Service',
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
    );
  }

  Widget consumenPanel() {
    return AppExpansionListTile(
      title: 'Konsumen',
      backgroundColor: AppColors.white,
      expand: true,
      paddingChild: EdgeInsets.all(AppSizes.padding),
      children: [
        ItemCardList(
          dateProfileItem: '+62 85177812345',
          starImageCount: '50',
          title: 'Anton Kurniawan',
          dateProgress: '2 Agustus 2023',
          address: 'Jl. Sukamenak DPR RI KOM Kabupaten Prov...',
          isProfile: true,
          isCustomer: true,
          isOwner: true,
          boxShadow: const [
            BoxShadow(
              color: AppColors.blackLv7,
              offset: Offset(0, 4),
              blurRadius: 60,
              spreadRadius: 0,
            ),
          ],
          customButton: AppColumnInk(
            children: [
              AppDivider(
                thickness: 2,
                color: AppColors.blackLv8,
              ),
              AppButton(
                borderWidth: 1,
                borderColor: AppColors.primary,
                buttonColor: AppColors.transparent,
                textColor: AppColors.primary,
                text: 'Ubah Konsumen',
                onTap: () {
                  // TODO
                },
                padding: EdgeInsets.symmetric(vertical: AppSizes.padding / 3),
                rounded: true,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget orderListPanel() {
    return AppExpansionListTile(
      backgroundColor: AppColors.white,
      expand: true,
      childrenColor: AppColors.transparent,
      title: 'Item Pesanan',
      paddingChild: EdgeInsets.symmetric(vertical: AppSizes.padding),
      moreItem: const AppTags(
        text: 'Tambah',
        borderColor: AppColors.primary,
        color: AppColors.white,
        textColor: AppColors.primary,
        borderWidth: 1,
      ),
      children: [
        ...List.generate(3, (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: AppSizes.padding),
            child: ItemCardListSelected(
              starImageCount: '50',
              title: 'Cuci Kering',
              isSelected: isSelected[index],
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackLv7.withOpacity(0.5),
                  offset: Offset(0, -10),
                  blurRadius: 60,
                  spreadRadius: 0,
                ),
              ],
              textPrice: 'Rp7rb',
              statusPrice: '/kg',
              typeItem: 'Pakaian',
              timeWork: '3 Hari Kerja',
              customSelectedButton: AppLongCard(
                backgroundColor: AppColors.transparent,
                padding: EdgeInsets.symmetric(horizontal: AppSizes.padding / 2),
                children: [
                  Text(
                    'Kuantitas',
                    style: AppTextStyle.bold(
                      size: 14,
                      color: AppColors.white,
                    ),
                  ),
                  Row(
                    children: [
                      AppIconButton(
                        buttonColor: AppColors.white,
                        icon: Icon(
                          Icons.horizontal_rule,
                          size: 16,
                        ),
                        onTap: () {
                          // TODO
                          itemCount[index] != 0 ? itemCount[index]-- : 0;
                          setState(() {});
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
                        child: Text(
                          '${itemCount[index]}',
                          style: AppTextStyle.bold(size: 14, color: AppColors.white),
                        ),
                      ),
                      AppIconButton(
                        buttonColor: AppColors.white,
                        icon: Icon(
                          Icons.add,
                          size: 16,
                        ),
                        onTap: () {
                          // TODO
                          itemCount[index]++;
                          setState(() {});
                        },
                      ),
                    ],
                  )
                ],
              ),
              onTapCard: () {
                isSelected[index] = !isSelected[index];

                setState(() {});
              },
            ),
          );
        })
      ],
    );
  }

  Widget productionProcess() {
    return AppExpansionListTile(
      backgroundColor: AppColors.white,
      title: 'Proses Produksi',
      paddingChild: EdgeInsets.all(AppSizes.padding),
      expand: true,
      children: [
        AppTextField(
          hintText: '23 Juni 2023 - 25 Juni 2023',
          hintStyle: AppTextStyle.bold(size: 14, color: AppColors.black),
          suffixIcon: CustomIcon.calendarIcon,
          iconsColor: AppColors.black,
          enabled: false,
          disabledColor: AppColors.blackLv9,
        ),
        SizedBox(
          height: AppSizes.padding,
        ),
        Text(
          'Pesanan anda akan diambil tanggal 23 Juni dan akan diantar pada 25 Juni',
          style: AppTextStyle.medium(size: 14, color: AppColors.black),
        )
      ],
    );
  }

  Widget statusComplain() {
    return ListCard(
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv7,
          offset: Offset(0, 4),
          blurRadius: 60,
          spreadRadius: -10,
        ),
      ],
      leftIcon: CustomIcon.walletBoldIcon,
      rightIcon: Icons.chevron_right_rounded,
      title: 'Selasa, 23 Juni 2023',
      subtitle: 'Status Complain',
      textTags: 'Proses',
      onTapChevronButton: () {
        // TODO
      },
      onTapCard: () {
        // TODO
      },
    );
  }

  Widget weightItem() {
    return AppExpansionListTile(
      backgroundColor: AppColors.white,
      title: 'Berat Timbangan Kasir',
      expand: true,
      paddingChild: EdgeInsets.all(AppSizes.padding),
      children: [
        AppLongCard(
          backgroundColor: AppColors.blackLv9,
          children: [
            AppIconButton(
              buttonColor: AppColors.transparent,
              icon: Icon(Icons.indeterminate_check_box_outlined),
              padding: EdgeInsets.all(0),
              onTap: () {
                // TODO
                itemWeightColor = AppColors.black;
                itemWeight == 0 ? 0 : itemWeight--;
                setState(() {});
              },
            ),
            Text(
              '$itemWeight kg',
              style: AppTextStyle.medium(
                size: 14,
                color: itemWeightColor,
              ),
            ),
            AppIconButton(
              buttonColor: AppColors.transparent,
              icon: Icon(Icons.add_box_outlined),
              padding: EdgeInsets.all(0),
              onTap: () {
                // TODO
                itemWeight++;
                itemWeightColor = AppColors.black;
                setState(() {});
              },
            ),
          ],
        ),
        SizedBox(
          height: AppSizes.padding,
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          style: AppTextStyle.medium(size: 14, color: AppColors.black),
        )
      ],
    );
  }

  Widget employeeDetail() {
    return AppCardContainer(
      padding: EdgeInsets.only(
        top: AppSizes.padding,
        right: AppSizes.padding,
        left: AppSizes.padding,
      ),
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv7,
          offset: Offset(0, 4),
          blurRadius: 60,
          spreadRadius: 0,
        ),
      ],
      child: AppColumnInk(
        children: [
          AppTransactionInfo(
            transactionId: 'Yuli',
            transactionStatus: 'Paid',
            textTitle: 'Petugas Kasir',
            onlyTrasactionId: true,
            withIcon: false,
            dotChillPadding: EdgeInsets.all(0),
            dotColor: AppColors.transparent,
          ),
          AppTransactionInfo(
            transactionId: '5457383979',
            transactionStatus: 'Paid',
            textTitle: 'ID User Petugas Kasir',
            onlyTrasactionId: true,
            dotChillPadding: EdgeInsets.all(0),
            dotColor: AppColors.transparent,
            onTapCopyButton: () {
              // TODO
            },
          ),
        ],
      ),
    );
  }

  Widget validaton() {
    return AppColumnInk(
      children: [
        AppValidation(text: 'Item pesanan tidak boleh kosong', icon: Icons.close),
        SizedBox(
          height: AppSizes.padding,
        ),
        AppValidation(text: 'Harap memilih konsumen', icon: Icons.close),
      ],
    );
  }

  Widget paymentDetail() {
    return AppCardContainer(
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv7,
          offset: Offset(0, 4),
          blurRadius: 60,
          spreadRadius: 0,
        ),
      ],
      child: AppColumnInk(
        children: [
          Text(
            'Ringkasan Pembayaran',
            style: AppTextStyle.bold(size: 16),
          ),
          SizedBox(
            height: AppSizes.padding,
          ),
          const AppTransactionInfo(
            textTitle: 'PLayanan 3 Item',
            transactionId: 'Rp 65.000',
            transactionStatus: 'Paid',
            onlyTrasactionId: true,
            dotChillPadding: EdgeInsets.all(0),
            dotColor: AppColors.transparent,
          ),
          AppDivider(
            thickness: 2,
            color: AppColors.blackLv8,
            padding: EdgeInsets.only(
              bottom: AppSizes.padding,
            ),
          ),
          AppTransactionInfo(
            textTitle: 'Diskon Voucher',
            transactionId: 'Rp -7.000',
            transactionStatus: 'Paid',
            onlyTrasactionId: true,
            dotChillPadding: EdgeInsets.all(0),
            dotColor: AppColors.transparent,
            onTapCopyButton: () {
              // TODO
            },
          ),
          AppTransactionInfo(
            textTitle: 'Ongkos Ambil & Antar',
            transactionId: 'Rp 4.300',
            transactionStatus: 'Belum Terbayar',
            dotChillPadding: EdgeInsets.all(0),
            dotColor: AppColors.transparent,
            transactionStatusColor: AppColors.redLv1,
            onTapCopyButton: () {
              // TODO
            },
          ),
        ],
      ),
    );
  }
}
