import 'package:get/get.dart';
import 'package:polaris/auth/presentation/pages/forgot_password_page.dart';
import 'package:polaris/auth/presentation/pages/landing_page.dart';
import 'package:polaris/auth/presentation/pages/login_page.dart';
import 'package:polaris/auth/presentation/pages/otp_page.dart';
import 'package:polaris/auth/presentation/pages/register_page.dart';
import 'package:polaris/auth/presentation/pages/verification_page.dart';
import 'package:polaris/guest/presentation/pages/detail_event_page.dart';
import 'package:polaris/guest/presentation/pages/eticket_page.dart';
import 'package:polaris/guest/presentation/pages/guest_home_page.dart';
import 'package:polaris/guest/presentation/pages/payment_page.dart';
import 'package:polaris/guest/presentation/pages/search_key_page.dart';
import 'package:polaris/guest/presentation/pages/search_result_page.dart';

class AppRoutes {
  static const landing = "/";
  static const login = "/login";
  static const register = "/register";
  static const forgotPassword = "/forgot-password";
  static const otp = "/otp";
  static const verification = "/verificiation";
  static const guestHome = "/guest";
  static const searchKey = "/search-key";
  static const searchResult = "/search-result";
  static const event = "/event";
  static const payment = "/payment";
  static const eTicket = "/e-ticket";

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
    GetPage(
      name: otp,
      transition: Transition.rightToLeftWithFade,
      page: () {
        return const OtpPage();
      },
    ),
    GetPage(
      name: verification,
      transition: Transition.rightToLeftWithFade,
      page: () {
        return const VerificationPage();
      },
    ),
    GetPage(
      name: guestHome,
      transition: Transition.rightToLeftWithFade,
      page: () {
        return const GuestHomePage();
      },
    ),
    GetPage(
      name: searchKey,
      transition: Transition.rightToLeftWithFade,
      page: () {
        return const SearchKeyPage();
      },
    ),
    GetPage(
      name: searchResult,
      transition: Transition.rightToLeftWithFade,
      page: () {
        return const SearchResultPage();
      },
    ),
    GetPage(
      name: "$event/:id",
      transition: Transition.rightToLeftWithFade,
      page: () {
        return const DetailEventPage();
      },
    ),
    GetPage(
      name: "$payment/:id",
      transition: Transition.rightToLeftWithFade,
      page: () {
        return const PaymentPage();
      },
    ),
    GetPage(
      name: eTicket,
      transition: Transition.downToUp,
      page: () {
        return const EticketPage();
      },
    ),
  ];
}
