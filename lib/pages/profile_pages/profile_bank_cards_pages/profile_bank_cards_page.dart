import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/pages/profile_pages/profile_bank_cards_pages/profile_add_cards_page/profile_add_cards_page.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/icon_link.dart';

class ProfileBankCardsPage extends StatelessWidget {
  const ProfileBankCardsPage({Key? key}) : super(key: key);
  static const routeName = '/profile_bank_cards_page';


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
          'Банковские карты',
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
          vertical: 20.0,
        ),
        child: Column(
          children: [
            InkWell(
              onTap: ()=> Navigator.pushNamed(context, ProfileAddCardsPage.routeName,),
              child: const IconLink(
                text: 'Добавить еще карту',
                fontWeight: FontWeight.w700,
                icon: AppIcons.plus,
                color: AppColors.blue,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                top: 15.0,
              ),
              child: _AutoDebit(),
            ),
          ],
        ),
      ),
    );
  }
}

class _AutoDebit extends StatefulWidget {
  const _AutoDebit({Key? key}) : super(key: key);

  @override
  State<_AutoDebit> createState() => _AutoDebitState();
}

class _AutoDebitState extends State<_AutoDebit> {
  bool _lights = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          flex: 1,
          child: Text(
            '?',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
              color: AppColors.blue,
            ),
          ),
        ),
        const SizedBox(
          width: 25.0,
        ),
        Flexible(
            flex: 5,
            child: const Text('Автосписывание по умолчанию',
            style: TextStyle(fontWeight: FontWeight.w400,),)),
        Flexible(
          flex: 3,
          child: ListTile(
            title: const Text('Lights'),
            trailing: CupertinoSwitch(
              value: _lights,
              onChanged: (bool value) { setState(() { _lights = value; }); },
            ),
            onTap: () { setState(() { _lights = !_lights; }); },
          ),
        )
      ],
    );
  }
}

