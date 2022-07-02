import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/pages/profile_pages/profile_bank_cards_pages/profile_bank_cards_page.dart';
import 'package:usa_in_ua/pages/profile_pages/profile_edit_person_data_page/profile_edit_person_data_page.dart';
import 'package:usa_in_ua/pages/profile_pages/profile_finance_page/profile_finance_page.dart';
import 'package:usa_in_ua/pages/profile_pages/profile_recipient_addresses_page/profile_recipient_address_form_page/profile_recipient_address_form_page.dart';
import 'package:usa_in_ua/pages/profile_pages/profile_recipient_addresses_page/profile_recipient_addresses_page.dart';
import 'package:usa_in_ua/resources/app_icons.dart';
import 'package:usa_in_ua/resources/app_images.dart';
import 'package:usa_in_ua/widgets/button_enter.dart';

import '../../repositories/located_repositories.dart';
import '../../resources/app_colors.dart';
import '../../services/located.dart';
import '../../widgets/icon_link.dart';
import '../../widgets/prise_dollar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = '/profile_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          InkWell(
              onTap: ()=> Navigator.pushNamed(context,      ProfileRecipientAddressFormPage.routeName),
              child: SvgPicture.asset(AppIcons.notification)),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: SvgPicture.asset(
              AppIcons.setting,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: Column(
            children: const [
              _ProfileBox(),
              _BalanceBox(),
              _LinkGoods(),
              _ProfileLinks(),
              _UsefulLinks(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileBox extends StatelessWidget {
  const _ProfileBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75.0,
      decoration: const BoxDecoration(
        color: AppColors.bass,
        borderRadius: BorderRadius.all(
          Radius.circular(
            35.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: CircleAvatar(
                maxRadius: 30.0,
                child: Image.asset(
                  AppImages.avatar,
                ),
              ),
            ),
            Flexible(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Веленчук Сергій',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'velenchuk18@gmail.com',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: InkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  ProfileEditPersonDataPage.routeName,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 16.0,
                    left: 10.0,
                  ),
                  child: SvgPicture.asset(
                    AppIcons.editSquare,
                    width: 25.0,
                    height: 25.0,
                    color: AppColors.noActive,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BalanceBox extends StatelessWidget {
  const _BalanceBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Container(
        width: double.infinity,
        height: 75.0,
        decoration: const BoxDecoration(
          color: AppColors.bass,
          borderRadius: BorderRadius.all(
            Radius.circular(
              10.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Баланс:',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: const [
                        PriceDollar(
                          iconSize: 16.0,
                          textNumber: '112.23',
                          fontSize: 16.0,
                          color: AppColors.green,
                        ),
                        Text(
                          ' / 22221112 грн.',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(
                    5.0,
                  ),
                  child: ButtonEnter(
                    text: 'Пополнить',
                    color: AppColors.green,
                    colorText: AppColors.brown,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LinkGoods extends StatelessWidget {
  const _LinkGoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 170.0,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Хочу заказть позже',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Посмотреть все >',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          const _Links(),
          const _Links(),
          const _Links(),
        ],
      ),
    );
  }
}

class _Links extends StatelessWidget {
  const _Links({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Container(
        width: double.infinity,
        height: 40.0,
        decoration: const BoxDecoration(
          color: AppColors.bass,
          borderRadius: BorderRadius.all(
            Radius.circular(
              5.0,
            ),
          ),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Image.asset(
                AppImages.testGoodsImage,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            const Flexible(
              flex: 8,
              child: Text(
                'https://www.ebay.com/itm/CasioGjnjk_bbjhb/_jhbhjb bbybybyub hbubuyyuvuyuyvuv bib',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: AppColors.text50,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ProfileLinks extends StatelessWidget {
  const _ProfileLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 240.0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: InkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  ProfileFinancePage.routeName,
                ),
                child: const IconLink(
                  color: AppColors.blue,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  icon: AppIcons.finance,
                  text: 'Финансы',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: InkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  ProfileBankCardsPage.routeName,
                ),
                child: const IconLink(
                  color: AppColors.blue,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  icon: AppIcons.creditCard,
                  text: 'Банковские карты',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: InkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  ProfileRecipientAddressesPage.routeName,
                ),
                child: const IconLink(
                  color: AppColors.blue,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  icon: AppIcons.location,
                  text: 'Адреса получателей',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: InkWell(
                onTap: () => LocatedRepositories.instance.getHttp(),
                child: const IconLink(
                  color: AppColors.blue,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  icon: AppIcons.storageAddress,
                  text: 'Адреса складов',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: IconLink(
                color: AppColors.blue,
                crossAxisAlignment: CrossAxisAlignment.center,
                icon: AppIcons.makeMoneyWithUs,
                text: 'Зарабатывайте c нами',
                fontWeight: FontWeight.w700,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: IconLink(
                color: AppColors.blue,
                crossAxisAlignment: CrossAxisAlignment.center,
                icon: AppIcons.news,
                text: 'Новости',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UsefulLinks extends StatelessWidget {
  const _UsefulLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: Text('Справочник'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: Text(
              'Правила и условия',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: Text(
              'Политика конфиденциальности',
            ),
          ),
        ],
      ),
    );
  }
}
