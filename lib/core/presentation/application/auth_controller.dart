import 'package:get/get.dart';
import 'package:polaris/core/domain/model/auth_state.dart';
import 'package:polaris/core/util/constants/app_constants.dart';
import 'package:polaris/core/util/helper/storage_helper.dart';
import 'package:polaris/route/app_route.dart';

class AuthController extends GetxController {
  final Rxn<AuthState> authState = Rxn<AuthState>();
  final StorageHelper storage = StorageHelper.instance;

  AuthState? get state => authState.value;

  @override
  void onInit() {
    authState.value = const AuthState.initial();

    ever(authState, onAuthStateChanged);

    super.onInit();
  }

  @override
  void onReady() {
    onAuthStateChanged(state);
    super.onReady();
  }

  void onAuthStateChanged(AuthState? state) async {
    state?.maybeWhen(
      initial: () {
        final appMode = storage.read<String>(AppConstants.appModeKey);

        if (appMode != null) {
          // authState.value = getStateByMode(
          //   AppMode.values.firstWhere((element) => element.name == appMode),
          // );
          authState.value = const AuthState.admin();
        } else {
          authState.value = const AuthState.unautheticated();
        }
      },
      unautheticated: () {
        clearAuthData();
        Get.offAllNamed(AppRoutes.login);
      },
      admin: () {
        Get.offAllNamed(AppRoutes.admin);
      },
      // guest: () {
      //   Get.offAllNamed(AppRoutes.guest);
      // },
      orElse: () {
        Get.toNamed(AppRoutes.loader);
      },
    );
  }

  AuthState getStateByMode(AppMode mode) {
    if (mode == AppMode.admin) {
      return authState.value = const AuthState.admin();
    } else if (mode == AppMode.guest) {
      return authState.value = const AuthState.guest();
    } else {
      return authState.value = const AuthState.unautheticated();
    }
  }

  void login(AppMode mode) async {
    saveAppMode(mode);
    authState.value = getStateByMode(mode);
  }

  void logout() {
    authState.value = const AuthState.unautheticated();
  }

  Future<void> saveAppMode(AppMode mode) async {
    await storage.write(key: AppConstants.appModeKey, value: mode.name);
    authState.value = getStateByMode(mode);
  }

  Future<void> clearAuthData() async {
    await storage.remove(AppConstants.appModeKey);
  }
}
