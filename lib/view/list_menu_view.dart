import 'package:alvamind_library/app/theme/app_colors.dart';
import 'package:alvamind_library/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

import '../app/route/app_routes.dart';

class ListMenuView extends StatelessWidget {
  static const routeName = 'main-view';

  const ListMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          ...List.generate(AppRoutes.routes.length, (index) {
            return ListTile(
              tileColor: index.isOdd ? AppColors.blackLv10 : null,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 12,
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.routes.entries.elementAt(index).key,
                );
              },
              title: Text(
                AppRoutes.routes.entries.elementAt(index).key.substring(1).replaceAll('-', ' ').toUpperCase(),
                style: AppTextStyle.bold(size: 14),
              ),
              trailing: const Icon(
                Icons.arrow_forward,
                color: AppColors.black,
              ),
            );
          }),
        ],
      )),
    ));
  }
}
