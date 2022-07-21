import 'package:flutter/cupertino.dart';
import 'package:usa_in_ua/resources/app_colors.dart';
import 'package:usa_in_ua/resources/app_icons.dart';

import '../../../../widgets/button_enter.dart';
import '../../../../widgets/icon_link.dart';

class DeliveryTracking extends StatelessWidget {
  const DeliveryTracking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,),
      child: Column(
        children: [
          Flexible(
            flex: 8,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  IconLink(
                    mainAxisAlignment: MainAxisAlignment.center,
                    icon: AppIcons.arrowRight,
                    color: AppColors.blue,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    text: 'Расчет стоимости',),
                  IconLink(
                    icon: AppIcons.arrowRight,
                    color: AppColors.blue,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'Готов к оплате',),
                  IconLink(
                    icon: AppIcons.arrowRight,
                    color: AppColors.blue,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'Оплачено, в обработке',),
                  IconLink(
                    icon: AppIcons.arrowRight,
                    color: AppColors.blue,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'Ожидаем доставку на склад США',),
                  IconLink(
                    icon: AppIcons.arrowRight,
                    color: AppColors.blue,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'Доставлено на склад США / Европы',),
                  IconLink(
                    icon: AppIcons.arrowRight,
                    color: AppColors.blue,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'Отправлено в Украине',),
                  IconLink(
                    icon: AppIcons.arrowRight,
                    color: AppColors.blue,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'Поступило в Украину',),
                  IconLink(
                    icon: AppIcons.arrowRight,
                    color: AppColors.blue,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'Отправлено по Украине / готово к самовывозу',),
                  IconLink(
                    icon: AppIcons.arrowRight,
                    color: AppColors.blue,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'Заказ доставлен',),
                ],
              ),
            ),
          ),
          const Flexible(flex: 1, child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Text('Ориентировочная дата получения заказа 13.12.20'),
          )),
          const Flexible(
            flex: 2,
            child: ButtonEnter(
              text: 'ТТН    ХХХХХХХХХХ',
              color: AppColors.bass,
              colorText: AppColors.text,
            ),
          ),
        ],
      ),
    );
  }
}
