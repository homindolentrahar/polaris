import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';

class AuthImageBanner extends StatelessWidget {
  final String asset;
  final double height;
  final bool withBackButton;

  const AuthImageBanner({
    super.key,
    required this.asset,
    this.height = 240,
    this.withBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
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
              asset,
              alignment: Alignment.center,
            ),
          ),
          Visibility(
            visible: withBackButton,
            child: const Positioned(
              top: 16,
              left: 24,
              child: PrimaryBackButton(),
            ),
          ),
        ],
      ),
    );
  }
}
