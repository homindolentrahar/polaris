import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/core/ui/app_theme.dart';
import 'package:polaris/main.dart';
import 'package:polaris/route/app_route.dart';

class PolarisApp extends StatelessWidget {
  const PolarisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.theme,
      themeMode: AppTheme.mode,
      debugShowCheckedModeBanner: false,
      title: "Polaris",
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.loader,
      initialBinding: BindingsBuilder(
        () {
          injectAppModules();
        },
      ),
      navigatorObservers: [
        GetObserver(
          (routing) {
            // LogHelper.instance.info(
            //   "Routes History: ${Get.routeTree.routes.map((e) => e.name).toList()}",
            // );
          },
        )
      ],
    );
  }
}
