import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/pages/main_page.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../resources/app_images.dart';
import '../../../widgets/button_enter.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 7,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
                left: 16.0,
                right: 16.0,
              ),
              child: Center(
                child: Image.asset(
                  AppImages.tree,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: SizedBox(
              child: Column(
                children: [
                  const Text(
                    'Наша плантация деревьев ежегодно:',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: const [
                        _IconsLink(
                          icon: AppIcons.carbonDioxide_1,
                          text1: 'Поглощено',
                          text2: ' 130 тон ',
                          text3: 'углекислого газа',
                        ),
                        _IconsLink(
                          icon: AppIcons.carbonDioxide_2,
                          text1: 'Произведено',
                          text2: ' 36 тон ',
                          text3: 'кислород',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              right: 25.0,
              bottom: 20.0,
            ),
            child: ButtonEnter(
              onPressed: () => Navigator.pushNamed(
                context,
                MainPage.routeName,
              ),
              color: AppColors.green,
              text: 'НАЧАТЬ',
              colorText: AppColors.brown,
            ),
          ),
        ),
      ],
    );
  }
}

class _IconsLink extends StatelessWidget {
  const _IconsLink(
      {Key? key,
      required this.icon,
      required this.text1,
      required this.text2,
      required this.text3})
      : super(key: key);
  final String icon;
  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: 30.0,
          height: 30.0,
          color: AppColors.blue,
        ),
        const SizedBox(
          width: 10.0,
        ),
        RichText(
          text: TextSpan(
            text: text1,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: AppColors.text,
            ),
            children: [
              TextSpan(
                text: text2,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blue,
                ),
              ),
              TextSpan(
                text: text3,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
