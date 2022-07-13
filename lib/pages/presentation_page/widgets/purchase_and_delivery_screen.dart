import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/resources/app_colors.dart';

import '../../../resources/app_icons.dart';
import '../../../widgets/icon_link.dart';
import '../../../widgets/swish_link.dart';
import 'back_and_forth_button.dart';

class PurchaseAndDeliveryScreen extends StatefulWidget {
  const PurchaseAndDeliveryScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final PageController controller;

  @override
  State<PurchaseAndDeliveryScreen> createState() =>
      _PurchaseAndDeliveryScreenState();
}

class _PurchaseAndDeliveryScreenState extends State<PurchaseAndDeliveryScreen> {
  bool isSwish = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 5,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 70.0,
                left: 25.0,
              ),
              child: Column(
                children: [
                  Swish(
                    text: 'Покупка и доставка',
                    onTap: () {
                      isSwish = !isSwish;
                      setState(() {});
                    },
                    contour: isSwish ? true : false,
                    color: AppColors.green,
                  ),
                  Swish(
                    text: 'Только доставка',
                    onTap: () {
                      isSwish = !isSwish;
                      setState(() {});
                    },
                    contour: isSwish ? false : true,
                    color: AppColors.blue,
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0,),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconLink(
                    text: isSwish
                        ? 'Выберите желаемые товары в интернет-магазинах США/Европы.'
                        : 'Скопируйте адреса складов, на которые Вы сможете доставлять самостоятельно купленные заказы',
                    color: isSwish ? AppColors.green : AppColors.blue,
                    icon: isSwish ? AppIcons.buy : AppIcons.copyLocation,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  IconLink(
                    text: isSwish
                        ? 'Скопируйте ссылки на выбранные товары в форму заказа.'
                        : 'Введите трекинг-номер, полученный от магазина.',
                    color: isSwish ? AppColors.green : AppColors.blue,
                    icon: isSwish ? AppIcons.copyLink : AppIcons.edit,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  IconLink(
                    text: isSwish
                        ? 'В течение 30 минут в кабинете появится расчёт стоимости покупки товаров с доставкой.'
                        : 'Выберите способ доставки и оплатите заказ.',
                    color: isSwish ? AppColors.green : AppColors.blue,
                    icon: isSwish ? AppIcons.moneyBag : AppIcons.moneyBag,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  IconLink(
                    text: isSwish
                        ? 'Мы выкупим Ваш заказ, и привезем его к Вам. Вы сможете отслеживать его в личном кабинете.'
                        : 'Теперь остается всего немного подождать, и посылка у Вас! PS.... можете отслеживать ее в своем кабинете',
                    color: isSwish ? AppColors.green : AppColors.blue,
                    icon: isSwish ? AppIcons.location : AppIcons.location,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
