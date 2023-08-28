import 'package:alvamind_library/widget/atom/app_image.dart';
import 'package:alvamind_library/widget/molecule/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_colors.dart';

class ImageViewerView extends StatelessWidget {
  static const routeName = '/image-viewer-screen';

  const ImageViewerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(randomImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.transparent,
                elevation: 0,
                leading: AppIconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.white,
                  ),
                  buttonColor: AppColors.transparent,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
