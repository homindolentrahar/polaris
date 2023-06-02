import 'package:get/get.dart';
import 'package:polaris/admin/presentation/pages/admin_detail_event_page.dart';
import 'package:polaris/admin/presentation/pages/admin_events_page.dart';
import 'package:polaris/admin/presentation/pages/admin_home_page.dart';
import 'package:polaris/admin/presentation/pages/create_event_page.dart';
import 'package:polaris/auth/presentation/pages/forgot_password/forgot_password_page.dart';
import 'package:polaris/auth/presentation/pages/landing/landing_page.dart';
import 'package:polaris/auth/presentation/pages/login/login_page.dart';
import 'package:polaris/auth/presentation/pages/otp/otp_page.dart';
import 'package:polaris/auth/presentation/pages/register/register_page.dart';
import 'package:polaris/auth/presentation/pages/verification/verification_page.dart';
import 'package:polaris/core/presentation/pages/loader/loader_binding.dart';
import 'package:polaris/core/presentation/pages/loader/loader_page.dart';
import 'package:polaris/guest/presentation/pages/detail_event_page.dart';
import 'package:polaris/guest/presentation/pages/eticket_page.dart';
import 'package:polaris/guest/presentation/pages/home/home_binding.dart';
import 'package:polaris/guest/presentation/pages/home/home_page.dart';
import 'package:polaris/guest/presentation/pages/payment_page.dart';
import 'package:polaris/guest/presentation/pages/search/search_key_binding.dart';
import 'package:polaris/guest/presentation/pages/search/search_key_page.dart';
import 'package:polaris/guest/presentation/pages/search/search_result_binding.dart';
import 'package:polaris/guest/presentation/pages/search/search_result_page.dart';

class AppRoutes {
  // Auth
  static const loader = "/";
  static const landing = "/landing";
  static const login = "/login";
  static const register = "/register";
  static const forgotPassword = "/forgot-password";
  static const otp = "/otp";
  static const verification = "/verificiation";

  static const guest = "/guest";
  static const searchKey = "/search-key";
  static const searchResult = "/search-result";
  static const event = "/events";
  static const payment = "/payment";
  static const eTicket = "/e-ticket";
  static const admin = "/admin";
  static const adminEvents = "/admin/events";
  static const adminCreate = "/admin/create";

  static List<GetPage> pages = [
    GetPage(
      name: loader,
      transition: Transition.rightToLeftWithFade,
      binding: LoaderBinding(),
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
      name: guest,
      transition: Transition.rightToLeftWithFade,
      binding: HomeBinding(),
      page: () {
        return const HomePage();
      },
    ),
    GetPage(
      name: searchKey,
      transition: Transition.rightToLeftWithFade,
      binding: SearchKeyBinding(),
      page: () {
        return const SearchKeyPage();
      },
    ),
    GetPage(
      name: searchResult,
      transition: Transition.rightToLeftWithFade,
      binding: SearchResultBinding(),
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
    GetPage(
      name: admin,
      transition: Transition.rightToLeftWithFade,
      page: () {
        return const AdminHomePage();
      },
    ),
    GetPage(
      name: adminEvents,
      transition: Transition.rightToLeftWithFade,
      page: () {
        return const AdminEventsPage();
      },
    ),
    GetPage(
      name: adminCreate,
      transition: Transition.downToUp,
      page: () {
        return const CreateEventPage();
      },
    ),
    GetPage(
      name: "$adminEvents/:id",
      transition: Transition.rightToLeftWithFade,
      page: () {
        return const AdminDetailEventPage();
      },
    ),
  ];
}
