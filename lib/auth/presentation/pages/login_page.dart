import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:polaris/auth/presentation/application/login_page_controller.dart';
import 'package:polaris/auth/presentation/fragments/login_email_fragment.dart';
import 'package:polaris/auth/presentation/fragments/login_phone_fragment.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/tabbar.dart';
import 'package:polaris/gen/assets.gen.dart';

final loginFragments = [
  {
    'title': "Email",
    'fragment': const LoginEmailFragment(),
  },
  {
    'title': "Phone",
    'fragment': const LoginPhoneFragment(),
  },
];

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 240,
              color: Theme.of(context).colorScheme.background,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      Assets.images.login,
                      alignment: Alignment.center,
                    ),
                  ),
                  const Positioned(
                    top: 16,
                    left: 24,
                    child: PrimaryBackButton(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GetBuilder(
                  init: LoginPageController(),
                  builder: (controller) {
                    return Column(
                      children: [
                        PrimaryTabBar(
                          currentIndex: controller.tabIndex,
                          titles: controller.titles,
                          onTabChanged: (index) {
                            controller.onTabChanged(index);
                          },
                        ),
                        const SizedBox(height: 32),
                        Expanded(
                          child: PageView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: controller.pageController,
                            itemCount: loginFragments.length,
                            itemBuilder: (ctx, index) {
                              return loginFragments[index]['fragment']
                                  as Widget;
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
