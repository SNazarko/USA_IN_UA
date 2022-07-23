import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/resources/app_icons.dart';

import '../../models/add_link_goods_model.dart';
import '../../resources/app_colors.dart';
import '../../widgets/button_enter.dart';
import '../../widgets/icon_link.dart';
import 'bloc/list_item/list_item_bloc.dart';
import 'delivery_order_page/delivery_order_page.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({Key? key}) : super(key: key);
  static const routeName = '/delivery_page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeliveryListItemBloc>(
      create: (context) => DeliveryListItemBloc()
        ..add(
          LoadDeliveryListItemEvent(sort: 'All'),
        ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _LinkMenu(),
                Expanded(child: _ListGoods()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LinkMenu extends StatelessWidget {
  const _LinkMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => context.read<DeliveryListItemBloc>()
            ..add(
              LoadDeliveryListItemEvent(
                sort: 'All',
              ),
            ),
          child: const Text(
            'Мои заказы',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 100.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              InkWell(
                onTap: () => context.read<DeliveryListItemBloc>()
                  ..add(
                    LoadDeliveryListItemEvent(
                      sort: 'Не оплачено',
                    ),
                  ),
                child: const _LinkMenuItem(
                  title: 'Не оплечено',
                  icon: AppIcons.moneyBag,
                ),
              ),
              InkWell(
                onTap: () => context.read<DeliveryListItemBloc>()
                  ..add(
                    LoadDeliveryListItemEvent(
                      sort: 'Ожидает на отправку',
                    ),
                  ),
                child: const _LinkMenuItem(
                  title: 'Ожидает на отправку',
                  icon: AppIcons.delivery,
                ),
              ),
              InkWell(
                onTap: () => context.read<DeliveryListItemBloc>()
                  ..add(
                    LoadDeliveryListItemEvent(
                      sort: 'Отправлен Вам',
                    ),
                  ),
                child: const _LinkMenuItem(
                  title: 'Отправлен Вам',
                  icon: AppIcons.aeroplane,
                ),
              ),
              InkWell(
                onTap: () => context.read<DeliveryListItemBloc>()
                  ..add(
                    LoadDeliveryListItemEvent(
                      sort: 'Успешно получен',
                    ),
                  ),
                child: const _LinkMenuItem(
                  title: 'Успешно получен',
                  icon: AppIcons.tickSquare,
                ),
              ),
              InkWell(
                onTap: () => context.read<DeliveryListItemBloc>()
                  ..add(
                    LoadDeliveryListItemEvent(
                      sort: 'Оставлен отзыв',
                    ),
                  ),
                child: const _LinkMenuItem(
                  title: 'Оставлен отзыв',
                  icon: AppIcons.done,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class _ListGoods extends StatelessWidget {
  const _ListGoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryListItemBloc, DeliveryListItemState>(
      builder: (context, state) {
        if (state.status == DeliveryListItemStatus.success) {
          return ListView.builder(
            itemCount: state.list.length,
            itemBuilder: (BuildContext context, int index) {
              final AddLinkGoodsModel data = state.list[index];
              return _LinkGoodsModel(
                image: data.imageGoods ?? '',
                numberGoods: data.id ?? '',
                isSwish: data.isSwish ?? true,
                price: data.price ?? '0.00',
                weight: data.weight ?? '0.0',
                status: data.status ?? '',
                quality: data.quality ?? '',
              );
            },
          );
        }
        if (state.status == DeliveryListItemStatus.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == DeliveryListItemStatus.failed) {
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

class _LinkGoodsModel extends StatelessWidget {
  const _LinkGoodsModel({
    Key? key,
    required this.image,
    required this.numberGoods,
    required this.isSwish,
    required this.price,
    required this.weight,
    required this.status,
    required this.quality,
  }) : super(key: key);
  final String image;
  final String quality;
  final String numberGoods;
  final String price;
  final String weight;
  final String status;
  final bool isSwish;

  String _numberGoods(String numberGoods) {
    final String number =
        numberGoods.replaceRange(0, numberGoods.length - 6, '');
    return number;
  }

  String _weight(String weight) {
    if (weight == '') return '0.0';
    return weight;
  }

  Widget _status(String status) {
    if (status == 'Расчет стоимости заявки') {
      return const Expanded(
          child: ButtonEnter(
        text: 'ОПЛАТИТЬ',
        colorText: AppColors.brown,
        color: AppColors.green,
      ));
    }
    if (status == 'Готов к оплате') {
      return const Text(
        'Продолжите',
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: AppColors.text,
        ),
      );
    }
    if (status == 'Заказ доставлен') {
      return const Text(
        'Оплачено',
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: AppColors.text,
        ),
      );
    }
    return const SizedBox.expand();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, DeliveryOrderPage.routeName),
        child: Container(
          width: double.infinity,
          height: 150.0,
          decoration: const BoxDecoration(
            color: AppColors.bass,
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          const SizedBox(
                            width: 50.0,
                            height: 50.0,
                          ),
                          Image.network(
                            image,
                            height: 41.0,
                          ),
                          Positioned(
                            top: 9.0,
                            left: 15.0,
                            child: Container(
                              width: 25.0,
                              height: 25.0,
                              decoration: const BoxDecoration(
                                color: AppColors.contour,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    15.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '+$quality ',
                                  style: const TextStyle(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 75.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  '№',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  _numberGoods(numberGoods),
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.green,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 200.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  'Дата доставки',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '13/12/2021',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.text,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: IconLink(
                          icon: isSwish ? AppIcons.aeroplane : AppIcons.ship,
                          color: AppColors.blue,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          text: isSwish ? 'Авиа' : 'Море',
                        ),
                      ),
                      Expanded(
                          child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.dollar2,
                            width: 20.0,
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            price == '' ? '0.00' : price,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SvgPicture.asset(AppIcons.dollar),
                        ],
                      )),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 10.0,
                          ),
                          child: IconLink(
                            icon: AppIcons.weight2,
                            color: AppColors.blue,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            text: '${_weight(weight)} Кг.',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        status,
                        style: const TextStyle(
                          color: AppColors.blue,
                        ),
                      )),
                      _status(status),
                    ],
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

class _LinkMenuItem extends StatelessWidget {
  const _LinkMenuItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 95.0,
      height: 100.0,
      child: Column(
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            decoration: const BoxDecoration(
              color: AppColors.bass,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10.0,
                ),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 30,
                height: 30,
                color: AppColors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
