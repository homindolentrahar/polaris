import 'package:get/get.dart';
import 'package:polaris/auth/presentation/pages/forgot_password_page.dart';
import 'package:polaris/auth/presentation/pages/landing_page.dart';
import 'package:polaris/auth/presentation/pages/login_page.dart';
import 'package:polaris/auth/presentation/pages/register_page.dart';

class AppRoutes {
  static const landing = "/";
  static const login = "/login";
  static const register = "/register";
  static const forgotPassword = "/forgot-password";

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
    GetPage(
      name: register,
      transition: Transition.rightToLeftWithFade,
      page: () {
        return const RegisterPage();
      },
    ),
    GetPage(
      name: forgotPassword,
      transition: Transition.rightToLeftWithFade,
      page: () {
        return const ForgotPasswordPage();
      },
    ),
  ];
}
