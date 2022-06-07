import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:usa_in_ua/pages/presentation_page/widgets/delivery_screen.dart';
import 'package:usa_in_ua/pages/presentation_page/widgets/first_screen.dart';
import 'package:usa_in_ua/pages/presentation_page/widgets/purchase_and_delivery_screen.dart';
import 'package:usa_in_ua/pages/presentation_page/widgets/second_screen.dart';
import 'package:usa_in_ua/resources/app_colors.dart';

import '../../resources/app_images.dart';

class PresentationPage extends StatelessWidget {
  PresentationPage({Key? key}) : super(key: key);
  static const routeName = '/presentation_page';
  final PageController controller = PageController();
  final List<Widget> screen = [
    FirstScreen(),
    SecondScreen(),
    DeliveryScreen(),
    PurchaseAndDeliveryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 10,
            child: PageView(
              controller: controller,
              children: screen,
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Назад'),
                    ),
                    Row(
                      children: [],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Далее'),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
