import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/button_enter.dart';
import '../../../widgets/icon_link.dart';
import '../../../widgets/prise_dollar.dart';

class ProfileEditPersonData extends StatelessWidget {
  const ProfileEditPersonData({Key? key}) : super(key: key);
  static const routeName = '/profile_edit_person_data';

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
          'Личные данные',
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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              _DataOutput(
                data: 'Сергей',
                hintData: 'Ваще имя (Кириллица)*',
              ),
              _DataOutput(
                data: 'Веленчук',
                hintData: 'Фамилия*',
              ),
              _DataOutput(
                data: '16.04.1991',
                hintData: 'Дата рождения',
              ),
              _DataSex(
                sex: true,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Контактная информация',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _DataOutput(
                data: '+380630588512',
                hintData: 'Номер телефона*',
              ),
              _DataOutput(
                data: 'velenchuk18@gmail.com',
                hintData: 'Е-mail*',
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: IconLink(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                  icon: AppIcons.logout,
                  text: 'Вийти',
                  crossAxisAlignment: CrossAxisAlignment.center,
                  color: AppColors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DataOutput extends StatelessWidget {
  const _DataOutput({
    Key? key,
    required this.data,
    required this.hintData,
  }) : super(key: key);
  final String data;
  final String hintData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Container(
        width: double.infinity,
        height: 57.0,
        decoration: const BoxDecoration(
          color: AppColors.bass,
          borderRadius: BorderRadius.all(
            Radius.circular(
              10.0,
            ),
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hintData,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.noActive,
                  ),
                ),
                Text(
                  data,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class _DataSex extends StatelessWidget {
  const _DataSex({
    Key? key,
    required this.sex,
  }) : super(key: key);
  final bool sex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 100.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Пол',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: IconLink(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      icon: AppIcons.vectorMan,
                      text: 'Мужчина',
                      crossAxisAlignment: CrossAxisAlignment.center,
                      color: sex ? AppColors.blue : AppColors.noActive,
                    ),
                  ),
                  Expanded(
                    child: IconLink(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      icon: AppIcons.vectorWoman,
                      text: 'Женщина',
                      crossAxisAlignment: CrossAxisAlignment.center,
                      color: sex ? AppColors.noActive : AppColors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
