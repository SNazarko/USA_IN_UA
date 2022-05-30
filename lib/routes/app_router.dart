import 'package:flutter/material.dart';

import '../pages/authorisations_pages/authorisation_page/authorisations_page.dart';
import '../pages/authorisations_pages/registration_pages/registration_pages.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? arguments = settings.arguments;

    WidgetBuilder builder;
    // authorisations_pages

    switch (settings.name) {
      case AuthorisationsPages.routeName:
        builder = (_) => AuthorisationsPages();
        break;

      // registration_pages
      case RegistrationPages.routeName:
        builder = (_) => RegistrationPages();
        break;

      //
      // // main_page.dart
      //   case MainPage.routeName:
      //     builder = (_) => const MainPage();
      //     break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
