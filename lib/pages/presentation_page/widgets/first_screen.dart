import 'package:flutter/material.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_images.dart';
import 'back_and_forth_button.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 6,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: Image.asset(
                AppImages.girlInChair,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    'Покупка и доставка товаров в США и Европе \n с нами легко',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Нада сюди придумати пару строчок тексту просто привітального',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'USAIN.UA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
