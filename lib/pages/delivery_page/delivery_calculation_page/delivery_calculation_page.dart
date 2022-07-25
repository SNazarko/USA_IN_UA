import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/button_enter.dart';

class DeliveryCalculationPageArguments {
  DeliveryCalculationPageArguments(
    this.status,
    this.isSwish,
    this.link,
    this.quality,
    this.additionalServices,
    this.details,
    this.purDel,
    this.id,
  );
  final List status;
  final bool isSwish;
  final String link;
  final String quality;
  final String additionalServices;
  final String details;
  final bool purDel;
  final String id;
}

class DeliveryCalculationPage extends StatelessWidget {
  const DeliveryCalculationPage({
    Key? key,
    required this.status,
    required this.isSwish,
    required this.link,
    required this.id,
    required this.quality,
    required this.additionalServices,
    required this.details,
    required this.purDel,
  }) : super(key: key);
  static const routeName =
      '/delivery_page/delivery_order_page/delivery_calculation_page';
  final List status;
  final bool isSwish;
  final String link;
  final String id;
  final String quality;
  final String additionalServices;
  final String details;
  final bool purDel;

  bool _status(List status, String element) {
    final bool statusList = status.contains(element);
    return statusList;
  }

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
        title: Text(
          'Заказ №$id',
          style: const TextStyle(
            color: AppColors.text,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 95.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      purDel ? 'Покупка и доставка' : 'Только доставка',
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  _status(status, 'Готов к оплате')
                      ? const ButtonEnter(
                          text: 'Готов к оплате',
                          colorText: AppColors.text,
                          color: AppColors.contour,
                        )
                      : const ButtonEnter(
                          text: 'Расчет стоимости',
                          colorText: AppColors.text,
                          color: AppColors.contour,
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
