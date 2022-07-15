import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/widgets/button_enter.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/icon_link.dart';
import 'order_add_pur_del_page/order_add_pur_del_page.dart';

class OrderPurDelPage extends StatelessWidget {
  const OrderPurDelPage({Key? key}) : super(key: key);
  static const routeName = '/order_pur_del_page';

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
            padding: const EdgeInsets.all(
              15.0,
            ),
            child: SvgPicture.asset(
              AppIcons.arrowLeft,
            ),
          ),
        ),
        title: const Text(
          'Покупка и доставка',
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
            child: InkWell(
              onTap: () async {},
              child: SvgPicture.asset(
                AppIcons.camera2,
              ),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const _ListItem(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      OrderAddPurDelPage.routeName,
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) {
                    //     return const ProfileRecipientAddressesPage(
                    //     );
                    //   }),
                    // );
                  },
                  child: const IconLink(
                    text: 'Добавить еще карту',
                    fontWeight: FontWeight.w700,
                    icon: AppIcons.plus,
                    color: AppColors.blue,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {},
                  child: const IconLink(
                    text: 'Ориентировочная стоимость',
                    fontWeight: FontWeight.w700,
                    icon: AppIcons.serviceTariffs,
                    color: AppColors.blue,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
              ],
            ),
            const ButtonEnter(
              text: 'ДАЛЕ',
              color: AppColors.green,
              colorText: AppColors.brown,
            )
          ],
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
