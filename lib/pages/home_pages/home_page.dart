import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../blocs/goods_list_bloc/goods_list_bloc.dart';
import '../../blocs/goods_list_bloc/goods_list_event.dart';
import '../../blocs/goods_list_bloc/goods_list_state.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_icons.dart';
import '../../resources/app_images.dart';
import '../../widgets/icon_link.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home_pages';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListItemBloc>(
      create: (context) => ListItemBloc()
        ..add(
          LoadListItemEvent(),
        ),
      child: Scaffold(
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
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
              child: SizedBox(
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: 60.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            _LinkInBrowser(
                              image: AppImages.link1,
                              link: 'https://www.amazon.com/',
                            ),
                            _LinkInBrowser(
                              image: AppImages.link2,
                              link: 'https://www.macys.com/',
                            ),
                            _LinkInBrowser(
                              image: AppImages.link3,
                              link: 'https://www.ebay.com/',
                            ),
                            _LinkInBrowser(
                              image: AppImages.link4,
                              link: 'https://www.walmart.com/',
                            ),
                            _LinkInBrowser(
                              image: AppImages.link5,
                              link: 'https://rozetka.com.ua/',
                            ),
                            _LinkInBrowser(
                              image: AppImages.link6,
                              link: 'https://best.aliexpress.ru/',
                            ),
                            _LinkInBrowser(
                              image: AppImages.link7,
                              link: 'https://www.alibaba.com/',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Flexible(
                      flex: 5,
                      child: _GoodsList(),
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

class _GoodsList extends StatelessWidget {
  const _GoodsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListItemBloc, ListItemState>(
      builder: (context, state) {
        if (state.status == ListItemStatus.success) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.list.length,
            itemBuilder: (BuildContext context, int index) {
              final goods = state.list[index];
              return _GoodsModel(
                goodsImage: goods.goodsImage,
                priceUSA: goods.priceUSA,
                priceUA: goods.priceUA,
                webSite: goods.webSite,
                goodsName: goods.goodsName,
              );
            },
          );
        }
        if (state.status == ListItemStatus.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == ListItemStatus.failed) {
          return const Center(
            child: Text('Ошыбка'),
          );
        } else {
          return const Text('data');
        }
      },
    );
  }
}

class _GoodsModel extends StatelessWidget {
  const _GoodsModel({
    Key? key,
    required this.priceUSA,
    required this.priceUA,
    required this.goodsImage,
    required this.goodsName,
    required this.webSite,
  }) : super(key: key);
  final String priceUSA;
  final String priceUA;
  final String goodsImage;
  final String goodsName;
  final String webSite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 150.0,
        height: 200.0,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 190.0,
                width: 150.0,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(
                          0.0,
                          2.0,
                        ),
                        blurRadius: 5.0,
                      )
                    ]),
                child: Container(
                  width: 150.0,
                  height: 190.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Flexible(
                        flex: 7,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 100.0,
                            height: 110.0,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              child: Image.network(
                                goodsImage,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              goodsName,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              webSite,
                              maxLines: 1,
                              style: const TextStyle(
                                color: AppColors.text,
                                decoration: TextDecoration.underline,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                    color: AppColors.contour,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          priceUA,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Icon(
                          Icons.attach_money,
                          size: 20.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: const BoxDecoration(
                  color: AppColors.text,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        priceUSA,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Icon(
                        Icons.attach_money,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ],
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

class _LinkInBrowser extends StatelessWidget {
  const _LinkInBrowser({
    Key? key,
    required this.link,
    required this.image,
  }) : super(key: key);
  final String link;
  final String image;

  Future<void> _launchUrl(String link) async {
    final Uri _url = Uri.parse(link);
    if (await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _launchUrl(link),
          child: SizedBox(
            width: 100.0,
            height: 75.0,
            child: Image.asset(image),
          ),
        ),
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
      color: Colors.transparent,
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
