import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:test_modernvet/config/config.dart';
import 'package:test_modernvet/routes/routes.dart';
import 'package:test_modernvet/utils/theme_controller.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: StringsValue.appTitle,
          theme: themeController.themeData(ThemeConfig.darkTheme),
          darkTheme: themeController.themeData(ThemeConfig.darkTheme),
          themeMode: ThemeMode.system,
          initialRoute: Routes.root,
          getPages: routes,
        );
      },
    );
  }

}
  