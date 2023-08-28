import 'package:alvamind_library/app/asset/app_assets.dart';
import 'package:alvamind_library/widget/atom/app_image.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:alvamind_library/widget/molecule/app_message_bubble.dart';
import 'package:alvamind_library/widget/molecule/app_modal.dart';
import 'package:alvamind_library/widget/molecule/app_nested_body.dart';
import 'package:alvamind_library/widget/molecule/app_tags.dart';
import 'package:alvamind_library/widget/organism/chat_form/chat_form.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list_selected.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class ChatRoomView extends StatefulWidget {
  static const routeName = '/chat-room-screen';

  const ChatRoomView({
    super.key,
  });

  @override
  State<ChatRoomView> createState() => _ChatRoomViewState();
}

List<Map<String, dynamic>> messages = [
  {
    'is_me': true,
    'is_readed': true,
    'message': 'Kyowa arigato ne',
    'time_stamp': DateTime.now(),
  },
  {
    'is_me': false,
    'user_name': 'Toyama Nao',
    'is_readed': false,
    'message': 'Are, dare desu ka?',
    'time_stamp': DateTime.now(),
  },
  {
    'is_me': true,
    'is_readed': true,
    'message': 'Eurisu desu',
    'time_stamp': DateTime.now(),
  },
  {
    'is_me': false,
    'user_name': 'Toyama Nao',
    'is_readed': false,
    'message': 'Ee, gomen gomen.. ',
    'time_stamp': DateTime.now(),
  },
  {
    'is_me': false,
    'user_name': 'Toyama Nao',
    'is_readed': false,
    'message': 'Kyowa no sora ni kirei da ne',
    'time_stamp': DateTime.now(),
  },
  {
    'is_me': true,
    'is_readed': true,
    'message': 'Sokka?',
    'time_stamp': DateTime.now(),
  },
  {
    'is_me': false,
    'user_name': 'Toyama Nao',
    'is_readed': false,
    'message': 'Mo kieteru yo!',
    'time_stamp': DateTime.now(),
  },
];

class _ChatRoomViewState extends State<ChatRoomView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AppNestedScrollView(
            title: appBar(),
            body: body(),
          ),
          bottomChatForm(),
        ],
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Natasya Wilodra',
              style: AppTextStyle.bold(size: 24),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'subtitle section',
              style: AppTextStyle.medium(size: 12),
            ),
          ],
        )
      ],
    );
  }

  Widget body() {
    return AppColumnInk(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        dateTag(),
        SizedBox(height: AppSizes.padding),
        itemCardSelected(),
        SizedBox(height: AppSizes.padding),
        chatBubbleList(),
      ],
    );
  }

  Widget chatBubbleList() {
    return AppColumnInk(
      children: [
        ...List.generate(
          messages.length,
          (i) => AppMessageBubble(
            isMe: messages[i]['is_me'],
            userName: messages[i]['user_name'],
            isReaded: messages[i]['is_readed'],
            message: messages[i]['message'],
            timeStamp: messages[i]['time_stamp'],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ...List.generate(2, (i) {
              return Padding(
                padding: i != 2 ? EdgeInsets.only(right: AppSizes.padding / 2) : EdgeInsets.all(0),
                child: const AppImage(
                  image: randomImage,
                  width: 100,
                  height: 100,
                  borderRadius: 24,
                  backgroundColor: AppColors.blueLv5,
                ),
              );
            }),
          ],
        ),
        SizedBox(
          height: AppSizes.padding * 6,
        )
      ],
    );
  }

  Widget itemCardSelected() {
    return ItemCardListSelected(
      starImageCount: '50',
      title: 'Cuci Kering',
      textPrice: 'Rp7rb',
      statusPrice: '/kg',
      dateProgress: '2 Agustus 2023',
      textLeftButton: 'Detail Pesanan',
      textRightButton: 'Lacak Pengiriman',
      typeItem: 'Pakaian',
      timeWork: '3 Hari Kerja',
      isStatus: true,
      boxShadow: const [
        BoxShadow(
          color: AppColors.blackLv7,
          offset: Offset(0, 4),
          blurRadius: 60,
          spreadRadius: -10,
        ),
      ],
      onTapLeftButton: () {
        // TODO
      },
      onTapRightButton: () {
        // TODO
      },
    );
  }

  Widget dateTag() {
    return const AppTags(
      text: '2 Agustus 2023',
      color: AppColors.blackLv8,
      textColor: AppColors.blackLv3,
    );
  }

  Widget bottomChatForm() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
      color: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.padding / 2),
            child: ChatForm(
              textPlaceholder: 'Type a message ....',
              onTapAddButton: () {
                // TODO
              },
              onTapCameraButton: () {
                // TODO
                final navigator = Navigator.of(context);
                cameraModalPopUp(navigator);
              },
              onTapSendButton: () {
                // TODO
              },
            ),
          ),
        ],
      ),
    );
  }

  cameraModalPopUp(NavigatorState navigator) {
    AppModal.show(
      navigator,
      backgroundColor: AppColors.white,
      miniTitle: 'Ingin Upload Gambar darimana?',
      subtitleColor: AppColors.black,
      directionButton: Axis.horizontal,
      price: false,
      children: [
        Expanded(
          child: AppButton(
            onTap: () {},
            leftIcon: Icons.folder,
            text: 'Gallery',
            textColor: AppColors.primary,
            buttonColor: AppColors.blueLv5,
            rounded: true,
          ),
        ),
        SizedBox(width: AppSizes.padding / 2),
        Expanded(
          child: AppButton(
            leftIcon: CustomIcon.cameraIcon,
            onTap: () {},
            text: 'Camera',
            rounded: true,
          ),
        ),
      ],
    );
  }
}
