import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/button_enter.dart';
import '../../../widgets/icon_link.dart';
import '../home_tariff_page/home_tariff_page.dart';

class HomeDeliveryPage extends StatelessWidget {
  const HomeDeliveryPage({Key? key}) : super(key: key);
  static const routeName = '/home_delivery_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              AppIcons.arrowLeft,
            ),
          ),
        ),
        title: const Text(
          'Только доставка',
          style: TextStyle(
            color: AppColors.text,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 16.0,
            ),
            child: SvgPicture.asset(
              AppIcons.menu,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Text(
              'Текст о мейлфорвардинге и о том что мы доставим супер быстро но такие покупи менее защищены',
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            children: [
              const IconLink(
                text:
                    'Скопируйте адреса складов, на которые Вы сможете доставлять самостоятельно купленные заказы',
                color: AppColors.blue,
                icon: AppIcons.copyLocation,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(left: 75.0, top: 5.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.storageAddress),
                      const Text('Адреса складов')
                    ],
                  ),
                ),
              )
            ],
          ),
          const IconLink(
            text: 'Введите трекинг-номер, полученный от магазина.',
            color: AppColors.blue,
            icon: AppIcons.edit,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          const IconLink(
            text:
                'В течение 30 минут в кабинете появится расчёт стоимости покупки товаров с доставкой.',
            color: AppColors.blue,
            icon: AppIcons.moneyBag,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          const IconLink(
            text:
                'Мы выкупим Ваш заказ, и привезем его к Вам. Вы сможете отслеживать его в личном кабинете.',
            color: AppColors.blue,
            icon: AppIcons.location,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: ButtonEnter(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const HomeTariffPage(
                    isSwishDelivery: true,
                    isSwishPurDel: false,
                  );
                }),
              ),
              color: AppColors.blue,
              text: 'РАССЧИТАТЬ ТОЛЬКО ДОСТАВКУ',
              colorText: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
