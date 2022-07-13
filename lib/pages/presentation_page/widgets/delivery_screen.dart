import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:usa_in_ua/resources/app_colors.dart';

import '../../../resources/app_images.dart';
import 'back_and_forth_button.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 5,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                    left: 16.0,
                    right: 16.0,
                    bottom: 20.0,
                  ),
                  child: Image.asset(
                    AppImages.manWithABox,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _Link(
                      data: '8 лет на рынке',
                    ),
                    _Link(
                      data: 'Более 1.000.000 доставленных товаров',
                    ),
                    _Link(
                      data: '200.000 пользователей',
                    ),
                    _Link(
                      data:
                          '4,6 из 5 - Рейтинг основанный на более \n                      1000 отзывов',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Link extends StatelessWidget {
  const _Link({Key? key, required this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.check,
          color: AppColors.green,
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(data),
      ],
    );
  }
}
