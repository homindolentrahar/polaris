import 'package:flutter/widgets.dart';

class NavigationItemModel {
  final int index;
  final String route;
  final String title;
  final Widget icon;
  final Widget activeIcon;
  final Widget fragment;

  NavigationItemModel({
    required this.index,
    required this.route,
    required this.title,
    required this.icon,
    required this.activeIcon,
    required this.fragment,
  });
}
