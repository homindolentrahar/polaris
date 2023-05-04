import 'package:get/get.dart';
import 'package:polaris/auth/presentation/page/landing_page.dart';
import 'package:polaris/core/presentation/page/loader_page.dart';

class AppRoutes {
  static const loader = "/";
  static const landing = "/landing";

  static List<GetPage> pages = [
    GetPage(
      name: loader,
      page: () {
        return const LoaderPage();
      },
    ),
    GetPage(
      name: landing,
      transition: Transition.rightToLeftWithFade,
      page: () {
        return const LandingPage();
      },
    ),
  ];
}
