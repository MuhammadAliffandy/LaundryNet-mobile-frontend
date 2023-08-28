import 'package:alvamind_library/app/locale/app_locale.dart';
import 'package:alvamind_library/app/service/locator/service_locator.dart';
import 'package:alvamind_library/app/service/network_checker/network_checker_service.dart';
import 'package:alvamind_library/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:laundrynet_mobile_frontend/view/list_menu_view.dart';
import 'package:provider/provider.dart';

import 'app/route/app_routes.dart';

Future<void> main() async {
  // Initialize binding
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize date formatting
  initializeDateFormatting();

  // Setup service locator
  setupServiceLocator();

  // Initialize Firebase (google-service.json required)
  // await Firebase.initializeApp();

  // Initialize FCM service (google-service.json required)
  // await FcmService.initNotification();

  // Initialize local notification service
  // await LocalNotifService.initLocalNotifService();

  // Set/lock orientationgvhvgj
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  // Set overlay style
  SystemChrome.setSystemUIOverlayStyle(AppTheme.lightOverlayStyle);

  // runApp()
  runApp(const MyApp());
}

// Root widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Providers
        ChangeNotifierProvider(create: (_) => locator<NetworkCheckerService>()),
      ],
      child: MaterialApp(
        title: 'LaundryNet',
        theme: AppTheme.themeSelector(),
        debugShowCheckedModeBanner: false,
        locale: AppLocale.defaultLocale,
        supportedLocales: AppLocale.supportedLocales,
        localizationsDelegates: AppLocale.localizationsDelegates,
        home: const ListMenuView(),
        initialRoute: ListMenuView.routeName,
        routes: AppRoutes.routes,
      ),
    );
  }
}
