import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../blocs/goods_list_bloc/goods_list_bloc.dart';
import '../../blocs/goods_list_bloc/goods_list_event.dart';
import '../../blocs/goods_list_bloc/goods_list_state.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_icons.dart';
import '../../resources/app_images.dart';
import '../../widgets/icon_link.dart';
import '../../widgets/list/goods_list_model.dart';
import '../../widgets/list/link_list.dart';
import 'home_delivery_page/home_delivery_page.dart';
import 'home_pur_del_page/home_pur_del_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home_pages';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListItemBloc>(
      create: (context) => ListItemBloc()
        ..add(
          LoadListItemEvent(
            sort: 'topGoods',
          ),
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
                        children: [
                          _ButtonHomePage(
                            onTap: () => Navigator.pushNamed(
                                context, HomePurDelPage.routeName),
                            text: 'Покупка и доставка',
                            color: AppColors.green,
                            image: AppImages.car,
                            imageWidth: 100.0,
                          ),
                          _ButtonHomePage(
                            onTap: () => Navigator.pushNamed(
                                context, HomeDeliveryPage.routeName),
                            text: 'Только доставка',
                            color: AppColors.blue,
                            image: AppImages.air,
                            imageWidth: 150.0,
                          ),
                          const IconLink(
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
                  children: const [
                    Flexible(
                      flex: 1,
                      child: LinkList(),
                    ),
                    Flexible(
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
  const _GoodsList({
    Key? key,
  }) : super(key: key);
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
              return GoodsListModel(
                goodsImage: goods.goodsImage,
                priceUSA: goods.priceUSA,
                priceUA: goods.priceUA,
                webSite: goods.webSite,
                goodsName: goods.goodsName,
                colorPrise: AppColors.text,
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
