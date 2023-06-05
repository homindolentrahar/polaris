import 'package:get/get.dart';
import 'package:polaris/admin/presentation/pages/detail/main_detail_event_binding.dart';
import 'package:polaris/admin/presentation/pages/detail/main_detail_event_page.dart';
import 'package:polaris/admin/presentation/pages/main/main_events_binding.dart';
import 'package:polaris/admin/presentation/pages/main/main_events_page.dart';
import 'package:polaris/admin/presentation/pages/main/main_binding.dart';
import 'package:polaris/admin/presentation/pages/main/main_page.dart';
import 'package:polaris/admin/presentation/pages/create_event_page.dart';
import 'package:polaris/auth/presentation/pages/forgot_password/forgot_password_binding.dart';
import 'package:polaris/auth/presentation/pages/forgot_password/forgot_password_page.dart';
import 'package:polaris/auth/presentation/pages/landing/landing_page.dart';
import 'package:polaris/auth/presentation/pages/login/fragments/login_email_binding.dart';
import 'package:polaris/auth/presentation/pages/login/fragments/login_email_fragment.dart';
import 'package:polaris/auth/presentation/pages/login/fragments/login_phone_binding.dart';
import 'package:polaris/auth/presentation/pages/login/fragments/login_phone_fragment.dart';
import 'package:polaris/auth/presentation/pages/login/login_binding.dart';
import 'package:polaris/auth/presentation/pages/login/login_page.dart';
import 'package:polaris/auth/presentation/pages/otp/otp_binding.dart';
import 'package:polaris/auth/presentation/pages/otp/otp_page.dart';
import 'package:polaris/auth/presentation/pages/register/register_binding.dart';
import 'package:polaris/auth/presentation/pages/register/register_page.dart';
import 'package:polaris/auth/presentation/pages/verification/verification_binding.dart';
import 'package:polaris/auth/presentation/pages/verification/verification_page.dart';
import 'package:polaris/core/presentation/pages/loader/loader_binding.dart';
import 'package:polaris/core/presentation/pages/loader/loader_page.dart';
import 'package:polaris/guest/presentation/pages/detail/fragments/detail_event_info_fragment.dart';
import 'package:polaris/guest/presentation/pages/detail/fragments/detail_event_register_fragment.dart';
import 'package:polaris/guest/presentation/pages/detail/detail_event_binding.dart';
import 'package:polaris/guest/presentation/pages/detail/detail_event_page.dart';
import 'package:polaris/guest/presentation/pages/eticket/eticket_binding.dart';
import 'package:polaris/guest/presentation/pages/eticket/eticket_page.dart';
import 'package:polaris/guest/presentation/pages/home/home_binding.dart';
import 'package:polaris/guest/presentation/pages/home/home_page.dart';
import 'package:polaris/guest/presentation/pages/payment/payment_binding.dart';
import 'package:polaris/guest/presentation/pages/payment/fragments/payment_confirm_fragment.dart';
import 'package:polaris/guest/presentation/pages/payment/fragments/payment_method_fragment.dart';
import 'package:polaris/guest/presentation/pages/payment/payment_page.dart';
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

  static const email = "/email";
  static const phone = "/phone";
  // Guest
  static const guest = "/guest";
  static const searchKey = "/search-key";
  static const searchResult = "/search-result";
  static const eTicket = "/e-ticket";

  static const info = "/info";
  static const signup = "/signup";
  static const method = "/method";
  static const confirm = "/confirm";

  // Admin
  static const admin = "/admin";

  static const home = "/home";
  static const analytics = "/analytics";
  static const transactions = "/transactions";
  // General
  static const events = "events";
  static const payment = "payment";
  static const create = "create";

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
      page: () => const LandingPage(),
    ),
    GetPage(
      name: login,
      transition: Transition.rightToLeftWithFade,
      binding: LoginBinding(),
      page: () => const LoginPage(),
      children: [
        GetPage(
          name: email,
          transition: Transition.noTransition,
          binding: LoginEmailBinding(),
          page: () => const LoginEmailFragment(),
        ),
        GetPage(
          name: phone,
          transition: Transition.noTransition,
          binding: LoginPhoneBinding(),
          page: () => const LoginPhoneFragment(),
        ),
      ],
    ),
    GetPage(
      name: register,
      transition: Transition.rightToLeftWithFade,
      binding: RegisterBinding(),
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: forgotPassword,
      transition: Transition.rightToLeftWithFade,
      binding: ForgotPasswordBinding(),
      page: () => const ForgotPasswordPage(),
    ),
    GetPage(
      name: otp,
      transition: Transition.rightToLeftWithFade,
      binding: OtpBinding(),
      page: () => const OtpPage(),
    ),
    GetPage(
      name: verification,
      transition: Transition.rightToLeftWithFade,
      binding: VerificationBinding(),
      page: () => const VerificationPage(),
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
      name: "$guest/$events/:id",
      transition: Transition.rightToLeftWithFade,
      binding: DetailEventBinding(),
      page: () => const DetailEventPage(),
      children: [
        GetPage(
          name: info,
          transition: Transition.noTransition,
          page: () => const DetailEventInfoFragment(),
        ),
        GetPage(
          name: signup,
          transition: Transition.noTransition,
          page: () => const DetailEventRegisterFragment(),
        ),
      ],
    ),
    GetPage(
      name: "$guest/$payment/:id",
      transition: Transition.rightToLeftWithFade,
      binding: PaymentBinding(),
      page: () => const PaymentPage(),
      children: [
        GetPage(
          name: method,
          transition: Transition.noTransition,
          page: () => const PaymentMethodFragment(),
        ),
        GetPage(
          name: confirm,
          transition: Transition.noTransition,
          page: () => const PaymentConfirmFragment(),
        ),
      ],
    ),
    GetPage(
      name: eTicket,
      transition: Transition.downToUp,
      binding: EticketBinding(),
      page: () => const EticketPage(),
    ),
    GetPage(
      name: admin,
      transition: Transition.rightToLeftWithFade,
      binding: MainBinding(),
      page: () => const MainPage(),
    ),
    GetPage(
      name: "$admin/$events",
      transition: Transition.rightToLeftWithFade,
      binding: MainEventsBinding(),
      page: () => const MainEventsPage(),
    ),
    GetPage(
      name: "$admin/$events/$create",
      transition: Transition.downToUp,
      page: () => const CreateEventPage(),
    ),
    GetPage(
      name: "$admin/$events/:id",
      transition: Transition.rightToLeftWithFade,
      binding: MainDetailEventBinding(),
      page: () => const MainDetailEventPage(),
    ),
  ];
}
