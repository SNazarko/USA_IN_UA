import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/icon_link.dart';
import '../../../widgets/prise_dollar.dart';

class ProfileFinancePage extends StatelessWidget {
  const ProfileFinancePage({Key? key}) : super(key: key);
  static const routeName = '/profile_finance_page';

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
          'Финансы',
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
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ваш баланс',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 57.0,
                    decoration: const BoxDecoration(
                      color: AppColors.bass,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15.0,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: PriceDollar(
                        fontSize: 30.0,
                        textNumber: '1000.00',
                        iconSize: 30.0,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: IconLink(
                          text: 'Вывести с баланса',
                          color: AppColors.blue,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          icon: AppIcons.upload,
                        ),
                      ),
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 56.0,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: AppColors.green,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Пополнить',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: AppColors.brown,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                        flex: 10,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 60.0,
                          ),
                          child: PriceDollar(
                            textNumber:
                                'Автоматически списывать с \n баланса задолженности до 50.',
                            fontSize: 14.0,
                            iconSize: 14.0,
                          ),
                        ),
                      ),
                      Flexible(
                          flex: 2,
                          child: Text(
                            '?',
                            style: TextStyle(fontSize: 20.0),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Flexible(
                    flex: 1,
                    child: Text(
                      'Платежные операции',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 9,
                    child: ListView(
                      children: const [
                        _CheckBalance(),
                        _CheckBalance(),
                        _CheckBalance(),
                        _CheckBalance(),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CheckBalance extends StatelessWidget {
  const _CheckBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0,),
      child: Container(
        width: double.infinity,
        height: 90.0,
        decoration: const BoxDecoration(
          color: AppColors.bass,
          borderRadius: BorderRadius.all(
            Radius.circular(
              10.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Flexible(
                    flex: 5,
                    child: IconLink(
                      sizeIcon: 36.0,
                      text: '112234',
                      color: AppColors.blue,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      icon: AppIcons.id,
                    ),
                  ),
                  Flexible(
                    flex: 7,
                    child: IconLink(
                      text: '13/12/2020',
                      color: AppColors.blue,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      icon: AppIcons.calendar,
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: IconLink(
                      sizeIcon: 35.0,
                      text: '-2.7',
                      color: AppColors.blue,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      icon: AppIcons.moneyBag,
                    ),
                  ),
                ],
                  ),
              Row(children: const [
                Text('Тип операции',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                ),),
                SizedBox(width: 10.0,),
                Text('Оплата заказа',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  ),
                ),
              ],),
              Row(children: const [
                Text('Способ',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),),
                SizedBox(width: 10.0,),
                Text('Баланс',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  ),
                ),
              ],),
            ],
          ),
        ),
      ),
    );
  }
}
