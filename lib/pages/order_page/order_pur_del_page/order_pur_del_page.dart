
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/pages/order_page/bloc/bloc_list/list_event_bloc.dart';
import 'package:usa_in_ua/widgets/button_enter.dart';

import '../../../models/add_link_goods_model.dart';
import '../../../repositories/add_link_goods_repositories.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/icon_link.dart';

import '../../profile_pages/profile_bank_cards_pages/profile_bank_cards_page.dart';


import 'order_add_pur_del_page/order_add_pur_del_page.dart';

class OrderPurDelPage extends StatelessWidget {
  const OrderPurDelPage({Key? key}) : super(key: key);
  static const routeName = '/order_pur_del_page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListEventBloc>(
      create: (context) => ListEventBloc()
        ..add(
          LoadListEventEvent(order: true,),
        ),
      child: Scaffold(
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
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      child: IconLink(
                        text: 'Добавить еще один товар',
                        fontWeight: FontWeight.w700,
                        icon: AppIcons.plus,
                        color: AppColors.blue,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              ButtonEnter(
                onPressed: () {},
                text: 'ДАЛЕ',
                color: AppColors.green,
                colorText: AppColors.brown,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({Key? key}) : super(key: key);

  double _customExpanded(List list) {
    if (list.length == 1) return 320.0;
    if (list.length >= 2) return 400.0;
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListEventBloc, ListEventState>(
      builder: (context, state) {
        if (state.status == ListEventStatus.success) {
          return SizedBox(
            width: double.infinity,
            height: _customExpanded(state.list),
            child: ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (BuildContext context, int index) {
                final AddLinkGoodsModel list = state.list[index];
                return DismissibleWidget(
                    item: list,
                    onResize: () => AddLinkGoodsRepositories.instance.deleteLinkGoods(
                          list.id!,
                        ),
                    child: _LinkModel(
                      quality: list.quality!,
                      price: list.price!,
                      isSwish: list.isSwish!,
                      additionalServices: list.additionalServices!,
                      weight: list.weight!,
                      details: list.details!,
                      link: list.link!,
                    ));
              },
            ),
          );
        }
        if (state.status == ListEventStatus.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == ListEventStatus.failed) {
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

class _LinkModel extends StatelessWidget {
  const _LinkModel({
    Key? key,
    required this.link,
    required this.quality,
    required this.price,
    required this.weight,
    required this.additionalServices,
    required this.details,
    required this.isSwish,
  }) : super(key: key);
  final String link;
  final String quality;
  final String price;
  final String weight;
  final String additionalServices;
  final String details;
  final bool isSwish;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: Container(
        width: double.infinity,
        height: 300.0,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Link(title: 'ссылка', data: link),
              _Link(
                  title: 'Доставка',
                  data: isSwish ? 'Авиадоставка' : 'Бысторое море'),
              _Link(title: 'Количество', data: quality),
              _Link(title: 'Цена', data: price),
              _Link(title: 'Примерный вес', data: weight),
              _Link(title: 'Дополнительные услуги', data: additionalServices),
              _Link(title: 'Дополнительные характеристики', data: details),
            ],
          ),
        ),
      ),
    );
  }
}

class _Link extends StatelessWidget {
  const _Link({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
          ),
          Text(
            data,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
