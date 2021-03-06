import 'package:flutter/material.dart';
import 'package:usa_in_ua/pages/profile_pages/profile_recipient_page/profile_recipient_add_page/profile_recipient_add_page.dart';
import 'package:usa_in_ua/pages/profile_pages/profile_recipient_page/profile_recipient_page.dart';

import '../pages/authorisations_pages/authorisation_page/authorisations_page.dart';
import '../pages/authorisations_pages/registration_page/registration_page.dart';
import '../pages/delivery_page/delivery_calculation_page/delivery_calculation_page.dart';
import '../pages/delivery_page/delivery_order_page/delivery_order_page.dart';
import '../pages/delivery_page/delivery_page.dart';
import '../pages/home_pages/home_delivery_page/home_delivery_page.dart';
import '../pages/home_pages/home_page.dart';
import '../pages/home_pages/home_pur_del_page/home_pur_del_page.dart';
import '../pages/home_pages/home_tariff_page/home_tariff_page.dart';
import '../pages/main_page.dart';
import '../pages/order_page/order_delivery_page/order_add_delivery_page/order_add_delivery_page.dart';
import '../pages/order_page/order_delivery_page/order_delivery_page.dart';
import '../pages/order_page/order_pur_del_page/order_add_pur_del_page/order_add_pur_del_page.dart';
import '../pages/order_page/order_pur_del_page/order_pur_del_page.dart';
import '../pages/presentation_page/presentation_page.dart';
import '../pages/profile_pages/profile_bank_cards_pages/profile_add_cards_page/profile_add_cards_page.dart';
import '../pages/profile_pages/profile_bank_cards_pages/profile_bank_cards_page.dart';
import '../pages/profile_pages/profile_earn_with_us_page/profile_earn_with_us_page.dart';
import '../pages/profile_pages/profile_edit_person_data_page/profile_edit_person_data_page.dart';
import '../pages/profile_pages/profile_finance_page/profile_finance_page.dart';
import '../pages/profile_pages/profile_google_maps_page/profile_google_maps_page.dart';
import '../pages/profile_pages/profile_page.dart';
import '../pages/profile_pages/profile_warehouse _add/profile_warehouse _add.dart';
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

    // delivery_page/delivery_order_page/delivery_calculation_page
      case DeliveryCalculationPage.routeName:
        final DeliveryCalculationPageArguments args =
        arguments as DeliveryCalculationPageArguments;
        builder = (_) => DeliveryCalculationPage(
          isSwish: args.isSwish,
          status: args.status,
          details: args.details,
          link: args.link,
          quality: args.quality,
          additionalServices: args.additionalServices,
          purDel: args.purDel,
          id: args.id,
        );
        break;



    //delivery_page/delivery_order_page
      case DeliveryOrderPage.routeName:
        final DeliveryOrderPageArguments args =
        arguments as DeliveryOrderPageArguments;
        builder = (_) => DeliveryOrderPage(
          isSwish: args.isSwish,
          status: args.status,
          details: args.details,
          link: args.link,
          quality: args.quality,
          additionalServices: args.additionalServices,
          purDel: args.purDel,
        id: args.id,
        );
        break;




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


        // order_page

        //order_delivery_page
      case OrderDeliveryPage.routeName:
        builder = (_) => OrderDeliveryPage();
        break;


        //order_delivery_page/order_add_delivery_page';
      case OrderAddDeliveryPage.routeName:
        builder = (_) => OrderAddDeliveryPage();
        break;


        // order_pur_del_page
      case OrderPurDelPage.routeName:
        builder = (_) => OrderPurDelPage();
        break;


        //order_pur_del_page/order_add_pur_del_page';
      case OrderAddPurDelPage.routeName:
        builder = (_) => OrderAddPurDelPage();
        break;



      // PresentationPage
      case PresentationPage.routeName:
        builder = (_) => PresentationPage();
        break;

      // purchase_page
      case PurchasePage.routeName:
        builder = (_) => PurchasePage();
        break;

      // profile_pages

      // profile_bank_cards_pages

      // profile_add_cards_page
      case ProfileAddCardsPage.routeName:
        builder = (_) => ProfileAddCardsPage();
        break;

    // profile_earn_with_us_page
      case ProfileEarnWithUsPage.routeName:
        builder = (_) => ProfileEarnWithUsPage();
        break;

      // profile_bank_cards_page
      case ProfileBankCardsPage.routeName:
        builder = (_) => ProfileBankCardsPage();
        break;

      // profile_edit_person_data_page
      case ProfileEditPersonDataPage.routeName:
        builder = (_) => ProfileEditPersonDataPage();
        break;

      // profile_edit_person_data_page
      case ProfileFinancePage.routeName:
        builder = (_) => const ProfileFinancePage();
        break;

      // profile_recipient_add_page
      case ProfileRecipientAddressesPage.routeName:
        final ProfileRecipientAddressesPageArguments args =
        arguments as ProfileRecipientAddressesPageArguments;
        builder = (_) =>  ProfileRecipientAddressesPage(
          name: args.name, 
          phoneNumber: args.phoneNumber, 
          departmentNP: args.departmentNP, 
          street: args.street, 
          region: args.region, 
          country: args.country, 
          city: args.city, 
          addressName: args.addressName, 
          surname: args.surname, 
          houseNumber: args.houseNumber, 
          flatNumber: args.flatNumber, isCard: args.isCard,
           userCard: args.userCard,);
        break;

    // profile_recipient_add_page
      case ProfileRecipientAddressFormPage.routeName:
        builder = (_) =>  ProfileRecipientAddressFormPage();
        break;

      // profile_google_maps_page
      case ProfileGoogleMapsPage.routeName:
        builder = (_) =>  const ProfileGoogleMapsPage();
        break;


        // profile_warehouse _add
      case ProfileWarehouseAddress.routeName:
        builder = (_) =>  const ProfileWarehouseAddress();
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
