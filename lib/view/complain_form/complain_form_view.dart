import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/app/const/problem.dart';
import 'package:alvamind_library/app/const/solution.dart';
import 'package:alvamind_library/model/complain_model.dart';
import 'package:alvamind_library/model/drop_down_model.dart';
import 'package:alvamind_library/widget/atom/app_image.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_chips.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_drop_down.dart';
import 'package:alvamind_library/widget/molecule/app_expansion_list_tile.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_modal.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_text_field.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list_selected.dart';
import 'package:alvamind_library/widget/organism/order_card/order_card.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class ComplainFormView extends StatefulWidget {
  static const routeName = '/complain-form-screen';

  const ComplainFormView({
    super.key,
  });

  @override
  State<ComplainFormView> createState() => _ComplainFormViewState();
}

bool selected = false;
ScrollController? _controller;
ComplainModel _problem = problem.first;
ComplainModel _solution = solution.first;

class _ComplainFormViewState extends State<ComplainFormView> {
  @override
  void initState() {
    _controller = ScrollController();
    _controller?.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller!.offset >= _controller!.position.maxScrollExtent && !_controller!.position.outOfRange) {
      setState(() {});
      final navigator = Navigator.of(context);
      AppModal.show(
        navigator,
        backgroundColor: AppColors.white,
        price: false,
        children: [
          Expanded(
            child: AppButton(
              onTap: () {},
              text: 'Ajukan Komplain',
              rounded: true,
            ),
          ),
        ],
      );
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
    return AppColumnInk(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppIconButton(
              icon: const Icon(Icons.arrow_back),
              buttonColor: AppColors.transparent,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Buat Komplain',
                  style: AppTextStyle.bold(size: 24),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Toko Barokah Laundry',
                  style: AppTextStyle.medium(size: 12),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      children: [
        alert(),
        SizedBox(height: AppSizes.padding * 1.5),
        orderCard(),
        SizedBox(height: AppSizes.padding * 1.5),
        selectItem(),
        SizedBox(height: AppSizes.padding * 1.5),
        photoProof(),
        SizedBox(height: AppSizes.padding * 1.5),
        selectProblem(),
        SizedBox(height: AppSizes.padding * 1.5),
        problemDescription(),
        SizedBox(height: AppSizes.padding * 1.5),
        selectSolution(),
        SizedBox(height: AppSizes.padding * 6),
      ],
    );
  }

  Widget selectSolution() {
    return AppExpansionListTile(
      title: 'Solusi Yang Anda Harapkan',
      expand: true,
      backgroundColor: Colors.white,
      paddingChild: EdgeInsets.all(AppSizes.padding),
      children: [
        dropDownSolution()
      ],
    );
  }

  Widget problemDescription() {
    return AppExpansionListTile(
      title: 'Deskripsikan Masalah',
      expand: true,
      backgroundColor: Colors.white,
      paddingChild: EdgeInsets.all(AppSizes.padding),
      isDisabled: true,
      children: [
        AppTextField(
          hintText: 'Deskripkan masalah anda ...',
          maxLines: 7,
          onChanged: (value) {
            // TODO
          },
        )
      ],
    );
  }

  Widget selectProblem() {
    return AppExpansionListTile(
      title: 'Pilih Masalah',
      expand: true,
      backgroundColor: Colors.white,
      paddingChild: EdgeInsets.all(AppSizes.padding),
      children: [
        dropDownProblem()
      ],
    );
  }

  Widget photoProof() {
    return AppExpansionListTile(
      subtitle: 'Bukti Foto',
      backgroundColor: AppColors.white,
      expand: true,
      isDisabled: true,
      showExpandButton: false,
      paddingChild: EdgeInsets.all(AppSizes.padding),
      moreItem: AppChips(
        fontSize: 14,
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.padding / 2,
          horizontal: AppSizes.padding,
        ),
        text: 'Upload',
        leftIcon: CustomIcon.downloadIcon,
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        isSelected: selected,
      ),
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(3, (index) {
                return Padding(
                  padding: index == 2 ? const EdgeInsets.all(0) : EdgeInsets.only(right: AppSizes.padding),
                  child: const AppImage(
                    image: randomImage,
                    width: 100,
                    height: 100,
                    borderRadius: 20,
                  ),
                );
              })
            ],
          ),
        )
      ],
    );
  }

  Widget selectItem() {
    return AppExpansionListTile(
      paddingChild: EdgeInsets.all(AppSizes.padding),
      backgroundColor: AppColors.white,
      subtitle: 'Item Yang Bermasalah',
      expand: true,
      isDisabled: true,
      showExpandButton: false,
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv7,
          offset: Offset(0, 4),
          blurRadius: 60,
          spreadRadius: -10,
        ),
      ],
      moreItem: AppChips(
        fontSize: 14,
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.padding / 2,
          horizontal: AppSizes.padding,
        ),
        text: 'Ubah',
        leftIcon: CustomIcon.editPenIcon,
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        isSelected: selected,
      ),
      children: const [
        ItemCardListSelected(
          starImageCount: '50',
          title: 'Cuci Kering',
          isList: false,
          textPrice: '2',
          statusPrice: 'item',
          typeItem: 'Pakaian',
          dateProgress: '2 Agustus 2023',
          textLeftButton: 'Detail Pesanan',
          textRightButton: 'Lacak Pengiriman',
          boxShadow: [
            BoxShadow(
              color: AppColors.blackLv7,
              offset: Offset(0, 4),
              blurRadius: 60,
              spreadRadius: -10,
            ),
          ],
        ),
      ],
    );
  }

  Widget orderCard() {
    return OrderCard(
      starImageCount: '50',
      title: 'Barokah Laundry',
      isProgress: true,
      textPrice: 'Rp42.431',
      statusPrice: '/00 days',
      dateProgress: '2 Agustus 2023',
      textLeftButton: 'Detail Pesanan',
      textRightButton: 'Lacak Pengiriman',
      labelingCount: 40,
      showButton: false,
      tagBorderColor: AppColors.greenLv1,
      tagText: 'Selesai',
      tagTextColor: AppColors.greenLv1,
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv7,
          offset: Offset(0, 4),
          blurRadius: 60,
          spreadRadius: -10,
        ),
      ],
      customWidget: [
        Expanded(
          child: AppButton(
            onTap: () {},
            text: 'Baca ulang Syarat & Ketentuan Toko',
            rounded: true,
            textColor: AppColors.primary,
            borderWidth: 2,
            buttonColor: AppColors.white,
            borderColor: AppColors.primary,
            padding: EdgeInsets.symmetric(
              vertical: AppSizes.padding / 2.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget alert() {
    return AppCardContainer(
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv7,
          offset: Offset(0, 4),
          blurRadius: 60,
          spreadRadius: -10,
        ),
      ],
      backgroundColor: AppColors.yellowLv1,
      child: Row(
        children: [
          const Icon(
            Icons.info,
            color: AppColors.white,
            size: 20,
          ),
          SizedBox(
            width: AppSizes.padding,
          ),
          Expanded(
            child: Text(
              'Lorem ipsum dolor sit amet consectetur. Senectus faucibus quis viverra tortor consequat mauris fusce. In mi aliquam ultricies tellus aliquam duis. Id suspendisse lorem erat vulputate sagittis odio eu facilisis. Sed egestas sit at in in nunc ipsum et.',
              style: AppTextStyle.regular(
                size: 10,
              ),
              softWrap: true,
              overflow: TextOverflow.clip,
            ),
          )
        ],
      ),
    );
  }

  Widget dropDownProblem() {
    return AppDropDown(
      onTapItem: (item) {
        _problem = problem.firstWhere((e) => e.codeComplain == item.value);
      },
      hintText: 'Pilih Masalah',
      selectedItem: _problem.textComplain,
      hintStyle: AppTextStyle.bold(size: 14, color: AppColors.black),
      iconsColor: AppColors.black,
      items: List.generate(
        problem.length,
        (i) => DropDownModel(text: problem[i].textComplain, value: problem[i].codeComplain),
      ),
      itemsBuilder: (item) {
        return Text(
          item.text,
          style: AppTextStyle.semibold(size: 12),
        );
      },
    );
  }

  Widget dropDownSolution() {
    return AppDropDown(
      onTapItem: (item) {
        _solution = solution.firstWhere((e) => e.codeComplain == item.value);
      },
      hintText: 'Pilih Solusi',
      selectedItem: _solution.textComplain,
      hintStyle: AppTextStyle.bold(size: 14, color: AppColors.black),
      iconsColor: AppColors.black,
      items: List.generate(
        solution.length,
        (i) => DropDownModel(text: solution[i].textComplain, value: solution[i].codeComplain),
      ),
      itemsBuilder: (item) {
        return Text(
          item.text,
          style: AppTextStyle.semibold(size: 12),
        );
      },
    );
  }
}
