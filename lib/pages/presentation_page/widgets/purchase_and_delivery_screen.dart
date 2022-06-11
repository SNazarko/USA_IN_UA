import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/resources/app_colors.dart';

import '../../../resources/app_icons.dart';
import '../../../widgets/icon_link.dart';
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
              padding: const EdgeInsets.only(top: 70.0, left: 25.0),
              child: Column(
                children: [
                  _Swish(
                    text: 'Покупка и доставка',
                    onTap: () {
                      isSwish = !isSwish;
                      setState(() {});
                    },
                    contour: isSwish ? true : false,
                    color: AppColors.green,
                  ),
                  _Swish(
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
        Flexible(
          flex: 1,
          child: BackAndForthButton(
            screen4: true,
            controller: widget.controller,
          ),
        ),
      ],
    );
  }
}

class _Swish extends StatelessWidget {
  const _Swish(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.contour,
      required this.color})
      : super(key: key);
  final String text;
  final bool contour;
  final Color color;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: contour ? color : AppColors.contour,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                ),
                contour
                    ? Positioned(
                        top: 10.0,
                        left: 10.0,
                        child: Container(
                          width: 25.0,
                          height: 25.0,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              text,
              style: TextStyle(
                color: contour ? AppColors.text : AppColors.contour,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
