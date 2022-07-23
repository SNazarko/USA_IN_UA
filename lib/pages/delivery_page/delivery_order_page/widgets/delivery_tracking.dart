import 'package:flutter/cupertino.dart';
import 'package:usa_in_ua/resources/app_colors.dart';
import 'package:usa_in_ua/resources/app_icons.dart';

import '../../../../widgets/button_enter.dart';
import '../../../../widgets/icon_link.dart';

class DeliveryTracking extends StatelessWidget {
  const DeliveryTracking({
    Key? key,
    required this.status,
    required this.isSwish,
  }) : super(key: key);
  final List status;
  final bool isSwish;

  bool _status(List status, String element) {
    print(status);
    final bool statusList = status.contains(element);
    return statusList;
  }

  String _data(bool isSwish) {
    var now = DateTime.now();
    final date = now.add(Duration(days: isSwish ? 9 : 35));
    return '$date';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Column(
        children: [
          Flexible(
            flex: 8,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconLink(
                    mainAxisAlignment: MainAxisAlignment.center,
                    icon: AppIcons.arrowRight,
                    color: _status(status, 'Расчет стоимости')
                        ? AppColors.blue
                        : AppColors.white,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    text: 'Расчет стоимости',
                  ),
                  IconLink(
                    icon: AppIcons.arrowRight,
                    color: _status(status, 'Готов к оплате')
                        ? AppColors.blue
                        : AppColors.white,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'Готов к оплате',
                  ),
                  IconLink(
                    icon: AppIcons.arrowRight,
                    color: _status(status, 'Оплачено, в обработке')
                        ? AppColors.blue
                        : AppColors.white,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'Оплачено, в обработке',
                  ),
                  IconLink(
                    icon: AppIcons.arrowRight,
                    color: _status(status, 'Ожидаем доставку на склад США')
                        ? AppColors.blue
                        : AppColors.white,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'Ожидаем доставку на склад США',
                  ),
                  IconLink(
                    icon: AppIcons.arrowRight,
                    color: _status(status, 'Доставлено на склад США / Европы')
                        ? AppColors.blue
                        : AppColors.white,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'Доставлено на склад США / Европы',
                  ),
                  IconLink(
                    icon: AppIcons.arrowRight,
                    color: _status(status, 'Отправлено в Украине')
                        ? AppColors.blue
                        : AppColors.white,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'Отправлено в Украине',
                  ),
                  IconLink(
                    icon: AppIcons.arrowRight,
                    color: _status(status, 'Поступило в Украину')
                        ? AppColors.blue
                        : AppColors.white,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'Поступило в Украину',
                  ),
                  IconLink(
                    icon: AppIcons.arrowRight,
                    color: _status(status,
                            'Отправлено по Украине / готово к самовывозу')
                        ? AppColors.blue
                        : AppColors.white,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'Отправлено по Украине / готово к самовывозу',
                  ),
                  IconLink(
                    icon: AppIcons.arrowRight,
                    color: _status(status, 'Заказ доставлен')
                        ? AppColors.blue
                        : AppColors.white,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'Заказ доставлен',
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Ориентировочная дата получения заказа ${_data(isSwish)}',
              ),
            ),
          ),
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
