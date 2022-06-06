import 'package:flutter/material.dart';

import '../../../../resources/app_images.dart';
import '../../../../widgets/button_enter.dart';
import '../../../main_page.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40.0,
            left: 20.0,
            right: 20.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    child: Center(
                  child: Image.asset(
                    AppImages.welcome,
                  ),
                )),
                SizedBox(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60.0,
                      ),
                      ButtonEnter(
                        onPressed: () =>
                            Navigator.pushNamed(context, MainPage.routeName),
                        text: 'ПРОДОЛЖЫТЬ',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
