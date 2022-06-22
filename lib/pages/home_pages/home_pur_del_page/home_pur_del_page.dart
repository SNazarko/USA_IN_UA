import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../resources/app_images.dart';
import '../../../widgets/button_enter.dart';
import '../../../widgets/icon_link.dart';
import '../home_tariff_page/home_tariff_page.dart';

class HomePurDelPage extends StatelessWidget {
  const HomePurDelPage({Key? key}) : super(key: key);
  static const routeName = '/home_pur_del_page';

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
          'Покупка и доставка',
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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.0,
              ),
              child: Text(
                'Текст о безопастности и всем таком, что отличает покупку и доставку от просто доставки',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const IconLink(
              text: 'Выберите желаемые товары в интернет-магазинах США/Европы.',
              color: AppColors.green,
              icon: AppIcons.buy,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            const IconLink(
              text: 'Скопируйте ссылки на выбранные товары в форму заказа.',
              color: AppColors.green,
              icon: AppIcons.copyLink,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            const IconLink(
              text:
                  'В течение 30 минут в кабинете появится расчёт стоимости покупки товаров с доставкой.',
              color: AppColors.green,
              icon: AppIcons.moneyBag,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            const IconLink(
              text:
                  'Мы выкупим Ваш заказ, и привезем его к Вам. Вы сможете отслеживать его в личном кабинете.',
              color: AppColors.green,
              icon: AppIcons.location,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            ButtonEnter(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const HomeTariffPage(
                    isSwishDelivery: false,
                    isSwishPurDel: true,
                  );
                }),
              ),
              color: AppColors.green,
              text: 'РАССЧИТАТЬ ПОКУПКУ И ДОСТАВКУ',
              colorText: AppColors.brown,
            ),
          ],
        ),
      ),
    );
  }
}
