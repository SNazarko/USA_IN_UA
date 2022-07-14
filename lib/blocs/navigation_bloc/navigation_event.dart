import 'package:flutter/cupertino.dart';

@immutable
abstract class NavigationEvent {}

class NavigateTab extends NavigationEvent {
  NavigateTab({
    required this.tabIndex,
    required this.route,
  });

  final int tabIndex;
  final String route;
}
class NavigateMenu extends NavigationEvent {
  NavigateMenu({
    required this.menuIndex,
    required this.route,
  });

  final int menuIndex;
  final String route;
}