import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/goods_list_bloc/goods_list_bloc.dart';
import '../../blocs/goods_list_bloc/goods_list_event.dart';
import '../../blocs/goods_list_bloc/goods_list_state.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_icons.dart';
import '../../widgets/list/goods_list_model.dart';
import '../../widgets/list/link_list.dart';

class PurchasePage extends StatelessWidget {
  const PurchasePage({Key? key}) : super(key: key);
  static const routeName = '/purchase_page';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Наш выбор',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _Links(
                      text: 'Топ товары',
                      onTap: () => context.read<ListItemBloc>().add(
                            LoadListItemEvent(sort: 'topGoods'),
                          ),
                    ),
                    _Links(
                      text: 'Обувь',
                      onTap: () => context.read<ListItemBloc>().add(
                            LoadListItemEvent(sort: 'shoes'),
                          ),
                    ),
                    _Links(
                      text: 'Одежда',
                      onTap: () => context.read<ListItemBloc>().add(
                            LoadListItemEvent(sort: 'clothing'),
                          ),
                    ),
                    _Links(
                      text: 'Электроника',
                      onTap: () => context.read<ListItemBloc>().add(
                            LoadListItemEvent(sort: 'electronics'),
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: 200.0,
                child: _GoodsList(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Шоппинг - моллы')),
              ),
              LinkList(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('100 тыс. успешных заказов'),
                    SvgPicture.asset(AppIcons.dollar),
                  ],
                ),
              ),
              const Text(
                'Онлайн площадка для проведения аукционов и торговый сайт, на котором частные и юридические лица осуществляют продажу и покупку различных товаров и услуг.',
                style: TextStyle(),
                maxLines: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Links extends StatelessWidget {
  const _Links({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: AppColors.text,
            ),
          ),
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
                colorPrise: AppColors.green,
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
