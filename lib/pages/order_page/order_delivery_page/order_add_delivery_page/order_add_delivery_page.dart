import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../repositories/add_link_goods_repositories.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_icons.dart';
import '../../../../widgets/button/dropAlertButton.dart';
import '../../../../widgets/button_enter.dart';
import '../../../../widgets/icon_link.dart';
import '../../../../widgets/prise_dollar.dart';
import '../../../../widgets/swish_link.dart';
import '../../../../widgets/text_field_input_text_number.dart';
import '../../../profile_pages/profile_warehouse _add/profile_warehouse _add.dart';
import '../../order_pur_del_page/blocs/bloc_data/data_bloc.dart';
import '../../order_pur_del_page/order_add_pur_del_page/order_add_pur_del_page.dart';

class OrderAddDeliveryPage extends StatelessWidget {
  OrderAddDeliveryPage({Key? key}) : super(key: key);
  static const routeName = '/order_delivery_page/order_add_delivery_page';
  final TextEditingController trekNumberController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final bool _isSwish = true;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderDataBloc>(
          create: (context) => OrderDataBloc(),
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProfileWarehouseAddress.routeName,
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                    child: IconLink(
                      text: 'Адрес склада',
                      fontWeight: FontWeight.w700,
                      icon: AppIcons.storageAddress,
                      color: AppColors.blue,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                ),
                _Swish(
                  isSwish: _isSwish,
                ),
                _DataForm(
                  trekNumberController: trekNumberController,
                  weightController: weightController,
                  qualityController: qualityController,
                  detailsController: detailsController,
                  priceController: priceController,
                ),
                const _Price(),
                BlocBuilder<OrderDataBloc, OrderDataState>(
                  builder: (context, state) {
                    return ButtonEnter(
                      onPressed: () {
                        final bool isSave = trekNumberController.text != '';
                        if (isSave) {
                          AddLinkGoodsRepositories.instance.add(
                            trekNumberController.text,
                            qualityController.text,
                            priceController.text,
                            weightController.text,
                            state.additionalServices ?? '',
                            detailsController.text,
                            _isSwish,
                          );
                          Navigator.pop(context);
                        }
                      },
                      text: 'ДАЛЕ',
                      color: state.link == '' || state.link == null
                          ? AppColors.noActive
                          : AppColors.green,
                      colorText: AppColors.brown,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DataForm extends StatelessWidget {
  _DataForm({
    Key? key,
    required this.trekNumberController,
    required this.qualityController,
    required this.priceController,
    required this.weightController,
    required this.detailsController,
  }) : super(key: key);
  final TextEditingController trekNumberController;
  final TextEditingController qualityController;
  final TextEditingController priceController;
  final TextEditingController weightController;
  final TextEditingController detailsController;
  final List<String> _list = [
    'Дополнительна услуга 1',
    'Дополнительна услуга 2',
    'Дополнительна услуга 3',
    'Дополнительна услуга 4',
    'Дополнительна услуга 5',
    'Дополнительна услуга 6',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
      ),
      child: SizedBox(
        height: 400.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFieldInputTextNumber(
              onChanged: (data) => context.read<OrderDataBloc>().add(
                    OrderDataEvent(
                      price: data,
                    ),
                  ),
              controller: priceController,
              onEditingComplete: () {
                FocusScope.of(context).nextFocus();
              },
              textInputType: TextInputType.number,
              hintText: 'Цена (дол.)',
              widget: const SizedBox.expand(),
            ),
            TextFieldInputTextNumber(
              controller: weightController,
              onEditingComplete: () {
                FocusScope.of(context).nextFocus();
              },
              textInputType: TextInputType.number,
              hintText: 'Примерный вес (кг)',
              widget: const SizedBox.expand(),
            ),
            DropAlertButton(
              onTap: (data) => context.read<OrderDataBloc>().add(
                    OrderDataEvent(
                      additionalServices: data,
                    ),
                  ),
              list: _list,
              defaultValue: 'Дополнительные услуги',
              editValue: '',
            ),
            _LinksDelivery(
              trekNumberController: trekNumberController,
            ),
            _InvoicesGoods(),
          ],
        ),
      ),
    );
  }
}

class _Swish extends StatefulWidget {
  _Swish({Key? key, required this.isSwish}) : super(key: key);
  bool isSwish;
  @override
  State<_Swish> createState() => _SwishState();
}

class _SwishState extends State<_Swish> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Swish(
              color: AppColors.blue,
              onTap: () {
                widget.isSwish = !widget.isSwish;
                setState(() {});
              },
              contour: widget.isSwish ? true : false,
              text: '',
            ),
            SvgPicture.asset(
              AppIcons.aeroplane,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Авиадоставка',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '4-9 рабочих дней',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            Swish(
              color: AppColors.blue,
              onTap: () {
                widget.isSwish = !widget.isSwish;
                setState(() {});
              },
              contour: widget.isSwish ? false : true,
              text: '',
            ),
            SvgPicture.asset(AppIcons.ship),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Бысторое море',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '28-35 рабочих дней',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class _LinksDelivery extends StatefulWidget {
  const _LinksDelivery({
    Key? key,
    required this.trekNumberController,
  }) : super(key: key);
  final TextEditingController trekNumberController;

  @override
  State<_LinksDelivery> createState() => _LinksDeliveryState();
}

class _LinksDeliveryState extends State<_LinksDelivery>
    with TickerProviderStateMixin {
  late bool isHintShown = false;
  bool isSwish = true;
  OverlayEntry? overlayEntry;
  late AnimationController controller;
  late Animation animation;

  void _animPlus() {
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  void _closeHint() {
    overlayEntry?.remove();
    isHintShown = false;
  }

  void _showHint(BuildContext context) {
    overlayEntry = _overlayEntryBuilder();
    Overlay.of(context)?.insert(overlayEntry!);
    isHintShown = true;
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            if (isHintShown) {
              _closeHint();
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Stack(children: [
              Positioned(
                top: 0,
                right: 0,
                child: Material(
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          AppIcons.questions,
                          width: MediaQuery.of(context).size.width - 10,
                        ),
                        Positioned(
                          top: 75.0,
                          right: 20.0,
                          child: SizedBox(
                            width: 280.0,
                            height: 150.0,
                            child: Row(
                              children: [
                                const Flexible(
                                  flex: 5,
                                  child: Text(
                                    'По этому трек-номеру для доставки из магазина США / Европы, по этой ссылке будет произведен расчет стоимости доставки груза в Украину.',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          30.0,
                                        ),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '?',
                                        style: TextStyle(
                                          fontSize: 25.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              )
            ]),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldInputTextNumber(
          onChanged: (data) => context.read<OrderDataBloc>().add(
                OrderDataEvent(
                  link: data,
                ),
              ),
          controller: widget.trekNumberController,
          onEditingComplete: () {
            FocusScope.of(context).nextFocus();
          },
          textInputType: TextInputType.text,
          hintText: 'Введите трек- номер посылки',
          widget: InkWell(
            onTap: () {
              _showHint(context);
              _animPlus();
            },
            child: const Text(
              '?',
              style: TextStyle(
                fontSize: 25.0,
                color: AppColors.blue,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Swish(
              color: AppColors.blue,
              onTap: () {
                isSwish = !isSwish;
                setState(() {});
              },
              contour: isSwish ? true : false,
              text: '',
            ),
            const Text(
              'Нет трек-номера',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Price extends StatelessWidget {
  const _Price({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDataBloc, OrderDataState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 5.0,
          ),
          child: PriceDollar(
            iconSize: 30.0,
            textNumber: state.price ?? '0',
            fontSize: 30.0,
          ),
        );
      },
    );
  }
}

class _InvoicesGoods extends StatelessWidget {
   _InvoicesGoods({Key? key}) : super(key: key);
  late bool isHintShown = false;
  OverlayEntry? overlayEntry;

  void _closeHint() {
    overlayEntry?.remove();
    isHintShown = false;
  }

  void _showHint(BuildContext context) {
    overlayEntry = _overlayEntryBuilder();
    Overlay.of(context)?.insert(overlayEntry!);
    isHintShown = true;
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            if (isHintShown) {
              _closeHint();
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Stack(children: [
              Positioned(
                top: 0,
                right: 0,
                child: Material(
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          AppIcons.questions,
                          width: MediaQuery.of(context).size.width - 10,
                        ),
                        Positioned(
                          top: 75.0,
                          right: 20.0,
                          child: SizedBox(
                            width: 280.0,
                            height: 150.0,
                            child: Row(
                              children: [
                                const Flexible(
                                  flex: 5,
                                  child: Text(
                                    'Загрузка инвойса покупки для доставки из магазина США / Европы, по этому инвайса будет произведен расчет стоимости доставки груза в Украину.',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          30.0,
                                        ),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '?',
                                        style: TextStyle(
                                          fontSize: 25.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              )
            ]),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(0.0, 5.0),
              blurRadius: 5.0,
            )
          ]),
      child: Stack(
        children: [
          Container(
            height: 100.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              border: Border.all(
                color: Colors.grey.shade200,
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SvgPicture.asset(
                    AppIcons.invoice,
                    width: 25.0,
                    height: 25.0,
                  ),
                ),
                Container(
                  height: 60.0,
                  width: 1.0,
                  color: AppColors.text,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 25.0,
                  ),
                  child: Text(
                    'Загрузите инвойс покупки',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  _showHint(context);
                },
                child: const Text('?',
                style: TextStyle(
                  fontSize: 25.0,
                  color: AppColors.blue
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
