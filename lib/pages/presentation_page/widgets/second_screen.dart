import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../resources/app_images.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 100.0,
                    left: 16.0,
                    right: 16.0,
                    bottom: 20.0,
                  ),
                  child: Image.asset(
                    AppImages.nike,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            AppIcons.arrowLeft,
                            color: AppColors.text,
                            width: 30.0,
                            height: 30.0,
                          ),
                          const Text(
                            'Nike Pegasus Trail 2',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SvgPicture.asset(
                            AppIcons.arrowRight,
                            color: AppColors.text,
                            width: 30.0,
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Цена в Украине',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      '202',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Icon(
                                      Icons.attach_money,
                                      size: 20.0,
                                      color: AppColors.text,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Цена в США',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      '130',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Icon(
                                      Icons.attach_money,
                                      size: 20.0,
                                      color: AppColors.text,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Экономия',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Row(
                          children: const [
                            Text(
                              '72',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.green,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(
                              Icons.attach_money_rounded,
                              size: 30.0,
                              color: AppColors.green,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 40.0,
                ),
                child: SizedBox(
                  child: Center(
                    child: Text(
                      'Срок доставки примерно 10 дней',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
