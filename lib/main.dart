import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form/firebase_options.dart';
import 'package:form/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'constants/app_colors.dart';
import 'app/home/home_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.navyBlue,
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
        ),
        primarySwatch: Colors.blue,
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.navyBlue,
          ),
        ),
      ),
      initialRoute: Routes.HOME,
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
    );
  }
}
