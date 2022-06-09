import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:usa_in_ua/pages/presentation_page/widgets/delivery_screen.dart';
import 'package:usa_in_ua/pages/presentation_page/widgets/finish_screen.dart';
import 'package:usa_in_ua/pages/presentation_page/widgets/first_screen.dart';
import 'package:usa_in_ua/pages/presentation_page/widgets/purchase_and_delivery_screen.dart';
import 'package:usa_in_ua/pages/presentation_page/widgets/second_screen.dart';

class PresentationPage extends StatefulWidget {
  const PresentationPage({Key? key}) : super(key: key);
  static const routeName = '/presentation_page';

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  final PageController controller = PageController();

  final List<Widget> screen = [];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: [
            FirstScreen(
              controller: controller,
            ),
            SecondScreen(
              controller: controller,
            ),
            DeliveryScreen(
              controller: controller,
            ),
            PurchaseAndDeliveryScreen(
              controller: controller,
            ),
            FinishScreen(),
          ],
        ),
      ),
    );
  }
}
