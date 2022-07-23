import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/pages/delivery_page/delivery_order_page/widgets/delivery_address.dart';
import 'package:usa_in_ua/pages/delivery_page/delivery_order_page/widgets/delivery_goods.dart';
import 'package:usa_in_ua/pages/delivery_page/delivery_order_page/widgets/delivery_tracking.dart';

import '../../../blocs/address_list_form/list_form_bloc.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/button_enter.dart';
import '../bloc/widget_listener/widget_listener_bloc.dart';

class DeliveryOrderPageArguments {
  DeliveryOrderPageArguments(
    this.status,
    this.isSwish,
    this.link,
    this.quality,
    this.additionalServices,
    this.details,
    this.purDel,
    this.id,

  );
  final List status;
  final bool isSwish;
  final String link;
  final String quality;
  final String additionalServices;
  final String details;
  final bool purDel;
  final String id;
}

class DeliveryOrderPage extends StatelessWidget {
  const DeliveryOrderPage({
    Key? key,
    required this.status,
    required this.isSwish,
    required this.link,
    required this.quality,
    required this.additionalServices,
    required this.details,
    required this.purDel,
    required this.id,
  }) : super(key: key);
  static const routeName = '/delivery_page/delivery_order_page';
  final List status;
  final bool isSwish;
  final String link;
  final String id;
  final String quality;
  final String additionalServices;
  final String details;
  final bool purDel;


  bool _status(List status, String element) {
    final bool statusList = status.contains(element);
    return statusList;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListFormBloc>(
          create: (context) => ListFormBloc()
            ..add(
              LoadListFormEvent(),
            ),
        ),
        BlocProvider<WidgetListenerBloc>(
          create: (context) => WidgetListenerBloc(),
        ),
      ],
      child: Scaffold(
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
          title: Text(
            'Заказ №$id',
            style: const TextStyle(
              color: AppColors.text,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 95.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        purDel
                        ? 'Покупка и доставка'
                       : 'Только доставка',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    _status(status, 'Готов к оплате')

                    ? const ButtonEnter(
                      text: 'Готов к оплате',
                      colorText: AppColors.text,
                      color: AppColors.contour,
                    )
                        : const ButtonEnter(
                      text: 'Расчет стоимости',
                      colorText: AppColors.text,
                      color: AppColors.contour,
                    ),
                  ],
                ),
              ),
            ),
            const _LinkMenu(),
            _DataListsWidget(
              status: status,
              isSwish: isSwish,
              details: details,
              link: link,
              additionalServices: additionalServices,
              quality: quality,
            ),
          ],
        ),
      ),
    );
  }
}

class _DataListsWidget extends StatelessWidget {
  const _DataListsWidget({
    Key? key,
    required this.status,
    required this.isSwish, required this.link, required this.quality, required this.additionalServices, required this.details,
  }) : super(key: key);
  final List status;
  final bool isSwish;
  final String link;
  final String quality;
  final String additionalServices;
  final String details;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WidgetListenerBloc, WidgetListenerState>(
      builder: (context, state) {
        final List<Widget> _list = [
          DeliveryTracking(
            status: status,
            isSwish: isSwish,
          ),
          const DeliveryAddress(),
           DeliveryGoods(
             quality: quality,
             additionalServices: additionalServices,
             details: details,
             link: link,
             statusGoods: status,
           ),
        ];
        return Expanded(child: _list[state.index]);
      },
    );
  }
}

class _LinkMenu extends StatefulWidget {
  const _LinkMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<_LinkMenu> createState() => _LinkMenuState();
}

class _LinkMenuState extends State<_LinkMenu> {
  final ScrollController _pageController =
      ScrollController(initialScrollOffset: 60.0);

  static const List<_ItemLinkMenuModel> _listItemMenu = [
    _ItemLinkMenuModel(
      image: AppIcons.tracking,
      title: 'Отслеживание',
    ),
    _ItemLinkMenuModel(
      image: AppIcons.storageAddress,
      title: 'Адрес доставки',
    ),
    _ItemLinkMenuModel(
      image: AppIcons.buy,
      title: 'Товары',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 165.0,
      color: AppColors.bass,
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _listItemMenu.length,
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) {
                final list = _listItemMenu[index];
                return _ItemLinkMenu(
                  image: list.image,
                  title: list.title,
                  onTap: () {
                    if (index == 0) {
                      _pageController.animateTo(
                        0.0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                    }
                    if (index == 1) {
                      _pageController.animateTo(
                        60.0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                    }
                    if (index == 2) {
                      _pageController.animateTo(
                        98.0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                    }
                    context.read<WidgetListenerBloc>().add(
                          WidgetListenerEvent(
                            index: index,
                          ),
                        );
                  },
                );
              },
            ),
          ),
          Flexible(
            flex: 1,
            child: BlocBuilder<WidgetListenerBloc, WidgetListenerState>(
              builder: (context, state) {
                return Center(
                  child: SizedBox(
                    width: 150.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: _listItemMenu.map((e) {
                        final int i = _listItemMenu.indexOf(e);

                        return Container(
                          width: 25.0,
                          height: 5,
                          decoration: BoxDecoration(
                            color: state.index == i
                                ? AppColors.blue
                                : AppColors.noActive,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _ItemLinkMenuModel {
  const _ItemLinkMenuModel({
    required this.title,
    required this.image,
  });

  final String title;
  final String image;
}

class _ItemLinkMenu extends StatelessWidget {
  const _ItemLinkMenu({
    Key? key,
    required this.title,
    required this.image,
    this.onTap,
  }) : super(key: key);
  final String title;
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 15.0,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 150.0,
          height: 80.0,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                image,
                color: AppColors.blue,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
