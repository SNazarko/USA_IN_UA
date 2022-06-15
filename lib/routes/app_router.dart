import 'package:flutter/material.dart';

import '../pages/authorisations_pages/authorisation_page/authorisations_page.dart';
import '../pages/authorisations_pages/registration_page/registration_page.dart';
import '../pages/delivery_page/delivery_page.dart';
import '../pages/home_pages/home_delivery_page/home_delivery_page.dart';
import '../pages/home_pages/home_page.dart';
import '../pages/home_pages/home_pur_del_page/home_pur_del_page.dart';
import '../pages/home_pages/home_tariff_page/home_tariff_page.dart';
import '../pages/main_page.dart';
import '../pages/presentation_page/presentation_page.dart';
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
              phoneController: args.phoneController,
            );
        break;

      // delivery_page
      case DeliveryPage.routeName:
        builder = (_) => DeliveryPage();
        break;

      // home_pages
      // home_delivery_page.dart
      case HomeDeliveryPage.routeName:
        builder = (_) => HomeDeliveryPage();
        break;

      // home_pur_del_page
      case HomePurDelPage.routeName:
        builder = (_) => HomePurDelPage();
        break;

      // home_tariff_page
      case HomeTariffPage.routeName:
        final HomeTariffPageArguments args =
            arguments as HomeTariffPageArguments;
        builder = (_) => HomeTariffPage(
              isSwishDelivery: args.isSwishDelivery,
              isSwishPurDel: args.isSwishPurDel,
            );
        break;

      // home_page
      case HomePage.routeName:
        builder = (_) => HomePage();
        break;

      // PresentationPage
      case PresentationPage.routeName:
        builder = (_) => PresentationPage();
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
