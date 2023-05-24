import 'package:get/get.dart';
import 'package:polaris/auth/presentation/pages/landing_page.dart';
import 'package:polaris/auth/presentation/pages/login_page.dart';

class AppRoutes {
  static const landing = "/";
  static const login = "/login";

  static List<GetPage> pages = [
    GetPage(
      name: landing,
      transition: Transition.rightToLeftWithFade,
      page: () {
        return const LandingPage();
      },
    ),
    GetPage(
      name: login,
      transition: Transition.rightToLeftWithFade,
      page: () {
        return const LoginPage();
      },
    ),
  ];
}
