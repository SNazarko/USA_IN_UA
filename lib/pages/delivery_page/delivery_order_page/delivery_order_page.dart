import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:usa_in_ua/pages/delivery_page/delivery_order_page/widgets/delivery_address.dart';

import '../../../blocs/address_list_form/list_form_bloc.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/button_enter.dart';

class DeliveryOrderPage extends StatelessWidget {
  const DeliveryOrderPage({Key? key}) : super(key: key);
  static const routeName = '/delivery_page/delivery_order_page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListFormBloc>(
      create: (context) => ListFormBloc()
        ..add(
          LoadListFormEvent(),
        ),
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
          title: const Text(
            'Заказ №7356',
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
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Только доставка',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    ButtonEnter(
                      text: 'Расчет стоимости',
                      colorText: AppColors.text,
                      color: AppColors.contour,
                    ),
                  ],
                ),
              ),
            ),
            _LinkMenu(),
            Expanded(child: DeliveryAddress()),
          ],
        ),
      ),
    );
  }
}

class _LinkMenu extends StatefulWidget {
  const _LinkMenu({Key? key}) : super(key: key);

  @override
  State<_LinkMenu> createState() => _LinkMenuState();
}

class _LinkMenuState extends State<_LinkMenu> {
  final ScrollController _pageController =
      ScrollController(initialScrollOffset: 60.0);

  int? _currentPage = 1;

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
                    _currentPage = index;
                    setState(() {});
                  },
                );
              },
            ),
          ),
          Flexible(
            flex: 1,
            child: Center(
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
                        color: _currentPage == i
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
