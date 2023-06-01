import 'package:flutter/widgets.dart';

class NavigationItemModel {
  final int index;
  final String title;
  final Widget icon;
  final Widget activeIcon;

  NavigationItemModel({
    required this.index,
    required this.title,
    required this.icon,
    required this.activeIcon,
  });
}
