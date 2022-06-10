import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_icons.dart';
import '../../resources/app_images.dart';
import '../../widgets/icon_link.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home_pages';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SvgPicture.asset(
            AppIcons.notification,
          ),
        ),
        title: Image.asset(
          AppImages.logo,
          width: 150.0,
          height: 50.0,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: SizedBox(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: const TextSpan(
                        text: 'Ваш баланс: ',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.text,
                        ),
                        children: [
                          TextSpan(
                            text: '358.02',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blue,
                            ),
                          ),
                          TextSpan(
                            text: '/ 11222.26 грн.',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: AppColors.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      children: const [
                        _ButtonHomePage(
                          text: 'Покупка и доставка',
                          color: AppColors.green,
                          image: AppImages.car,
                          imageWidth: 100.0,
                        ),
                        _ButtonHomePage(
                          text: 'Только доставка',
                          color: AppColors.blue,
                          image: AppImages.air,
                          imageWidth: 150.0,
                        ),
                        IconLink(
                          text: 'Тарифы на услуги доставки',
                          color: AppColors.blue,
                          icon: AppIcons.serviceTariffs,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}

class _ButtonHomePage extends StatelessWidget {
  const _ButtonHomePage(
      {Key? key,
      required this.text,
      required this.color,
      required this.image,
      required this.imageWidth,
      this.onTap})
      : super(key: key);
  final String text;
  final Color color;
  final String image;
  final double imageWidth;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: 77.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: imageWidth,
                    height: 77.0,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 77.0,
                            height: 77.0,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0),
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Image.asset(
                            image,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
