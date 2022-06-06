import 'package:flutter/material.dart';

import '../pages/authorisations_pages/authorisation_page/authorisations_page.dart';
import '../pages/authorisations_pages/registration_page/registration_page.dart';
import '../pages/delivery_page/delivery_page.dart';
import '../pages/home_page/home_page.dart';
import '../pages/main_page.dart';
import '../pages/profile_page/profile_page.dart';
import '../pages/purchase_page/purchase_page.dart';
import '../pages/test.dart';

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

      // registration
      case RegistrationPage.routeName:
        final RegistrationPagesArguments args =
            arguments as RegistrationPagesArguments;
        builder = (_) => RegistrationPage(
              nameController: args.nameController,
              emailController: args.emailController,
            );
        break;

      // delivery_page
      case DeliveryPage.routeName:
        builder = (_) => DeliveryPage();
        break;

      // home_page
      case HomePage.routeName:
        builder = (_) => HomePage();
        break;

      // purchase_page
      case PurchasePage.routeName:
        builder = (_) => PurchasePage();
        break;

      // profile_page
      case ProfilePage.routeName:
        builder = (_) => ProfilePage();
        break;

      // main_page.dart
      case MainPage.routeName:
        builder = (_) => const MainPage();
        break;

      // Test
      case Test.routeName:
        builder = (_) => const Test();
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
