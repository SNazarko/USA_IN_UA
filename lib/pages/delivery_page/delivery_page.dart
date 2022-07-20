import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/resources/app_icons.dart';
import 'package:usa_in_ua/resources/app_images.dart';

import '../../resources/app_colors.dart';
import '../../widgets/button_enter.dart';
import '../../widgets/icon_link.dart';
import '../../widgets/prise_dollar.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({Key? key}) : super(key: key);
  static const routeName = '/delivery_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Мои заказы',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 100.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _LinkMenu(
                      title: 'Не оплечено',
                      icon: AppIcons.moneyBag,
                    ),
                    _LinkMenu(
                      title: 'Ожидает на отправку',
                      icon: AppIcons.delivery,
                    ),
                    _LinkMenu(
                      title: 'Отправлен Вам',
                      icon: AppIcons.aeroplane,
                    ),
                    _LinkMenu(
                      title: 'Успешно получен',
                      icon: AppIcons.tickSquare,
                    ),
                    _LinkMenu(
                      title: 'Оставлен отзыв',
                      icon: AppIcons.done,
                    ),
                  ],
                ),
              ),
              _LinkGoodsModel(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LinkMenu extends StatelessWidget {
  const _LinkMenu({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 95.0,
      height: 100.0,
      child: Column(
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            decoration: const BoxDecoration(
              color: AppColors.bass,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10.0,
                ),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 30,
                height: 30,
                color: AppColors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LinkGoodsModel extends StatelessWidget {
  const _LinkGoodsModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,),
      child: InkWell(
        onTap: () => ,
        child: Container(
          width: double.infinity,
          height: 150.0,
          decoration: const BoxDecoration(
            color: AppColors.bass,
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          const SizedBox(
                            width: 50.0,
                            height: 50.0,
                          ),
                          Image.asset(
                            AppImages.rectangle,
                            height: 41.0,
                          ),
                          Positioned(
                            top: 9.0,
                            left: 15.0,
                            child: Container(
                              width: 25.0,
                              height: 25.0,
                              decoration: const BoxDecoration(
                                color: AppColors.contour,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    15.0,
                                  ),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  '+2',
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 75.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  '№',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '73529',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.green,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 200.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  'Дата доставки',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '13/12/2021',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.text,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Expanded(child: IconLink(icon: AppIcons.ship, color: AppColors.blue, crossAxisAlignment: CrossAxisAlignment.center, text: 'Море',),),
                Expanded(child: Row(children: [
                  SvgPicture.asset(AppIcons.dollar2,
                  width: 20.0,),
                  const SizedBox(width: 15.0,),
                  const Text('99500.00',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,

                  ),),
                  SvgPicture.asset(AppIcons.dollar),
                ],)),
                      const Expanded(child: IconLink(icon: AppIcons.weight2, color: AppColors.blue, crossAxisAlignment: CrossAxisAlignment.center, text: '1000.0кг',),),

                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: const [
                      Expanded(child: Text('Готов к оплате',
                      style: TextStyle(
                        color: AppColors.blue,
                      ),)),
                      Expanded(
                          child: ButtonEnter(text: 'ОПЛАТИТЬ', colorText: AppColors.brown, color: AppColors.green,))
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
