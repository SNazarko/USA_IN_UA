import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/prise_dollar.dart';
import '../../../widgets/swish_link.dart';
import '../../../widgets/text_field_input_text_number.dart';

class HomeTariff extends StatefulWidget {
  const HomeTariff({Key? key}) : super(key: key);
  static const routeName = '/home_tariff';

  @override
  State<HomeTariff> createState() => _HomeTariffState();
}

class _HomeTariffState extends State<HomeTariff> {
  bool isSwish = true;
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
          'Тарифы',
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 130.0,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
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
            SizedBox(
                height: 220.0,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextFieldInputTextNumber(
                        hintText: 'Выберите страну отправки',
                        widget: Text(''),
                      ),
                      const TextFieldInputTextNumber(
                        hintText: 'Выберите способ доставки',
                        widget: Text(''),
                      ),
                      const TextFieldInputTextNumber(
                        hintText: 'Примерный вес посылки',
                        widget: Text(
                          'кг.',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      TextFieldInputTextNumber(
                        hintText: 'Общая стоимость',
                        widget: SvgPicture.asset(
                          AppIcons.dollar,
                          width: 20.0,
                          height: 20.0,
                          color: AppColors.text,
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                ),
                child: Column(
                  children: [
                    const _TextGet(
                      textName: 'Услуги доставки:',
                      textNumber: '59.52',
                    ),
                    const _TextGet(
                      textName: 'Страховка:',
                      textNumber: '2.85',
                    ),
                    const _TextGet(
                      textName: 'Прием и оформление:',
                      textNumber: '0.99',
                    ),
                    const _TextGet(
                      textName: 'Комиссия услуги:',
                      textNumber: '7.50',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Ориентировочная стоимость товара с \n доставкой:',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            PriceDollar(
                              textNumber: '223.58',
                              iconSize: 30.0,
                              fontSize: 30.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextGet extends StatelessWidget {
  const _TextGet({Key? key, required this.textName, required this.textNumber})
      : super(key: key);
  final String textName;
  final String textNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Text(
            textName,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          PriceDollar(
            textNumber: textNumber,
            fontSize: 20,
            iconSize: 25,
          ),
        ],
      ),
    );
  }
}
