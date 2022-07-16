import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../blocs/bloc_anim/anim_bloc.dart';
import '../../../../repositories/add_link_goods_repositories.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_icons.dart';
import '../../../../widgets/button/dropAlertButton.dart';
import '../../../../widgets/button_enter.dart';
import '../../../../widgets/icon_link.dart';
import '../../../../widgets/swish_link.dart';
import '../../../../widgets/text_field_input_text_number.dart';

class OrderAddPurDelPage extends StatelessWidget {
   OrderAddPurDelPage({Key? key}) : super(key: key);
  static const routeName = '/order_pur_del_page/order_add_pur_del_page';
  final TextEditingController lincController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  bool isSwish = true;
   String? additionalServicesController;
   final List<String> list = [
     'Дополнительна услуга 1',
     'Дополнительна услуга 2',
     'Дополнительна услуга 3',
     'Дополнительна услуга 4',
     'Дополнительна услуга 5',
     'Дополнительна услуга 6',
   ];


  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnimBloc>(
  create: (context) => AnimBloc(),
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
              _Swish(isSwish: isSwish,),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: SizedBox(
                  height: 450.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _LinksGoods(lincController: lincController,),
                      TextFieldInputTextNumber(
                        textInputType:TextInputType.number,
                        controller: qualityController,
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                        hintText: 'Количество (шт.)',
                        widget: const SizedBox.expand(),
                      ),
                      TextFieldInputTextNumber(
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
                        onTap: (data){
                          additionalServicesController = data;
                        },
                        list: list,
                        defaultValue: 'Дополнительные услуги',
                        editValue: '',),

                      _AdditionalInformation(
                        controller: detailsController,
                      ),
                    ],
                  ),
                ),
              ),
               ButtonEnter(
                onPressed: (){

                 final bool isSave = lincController.text != '';
                  if(isSave){
                    AddLinkGoodsRepositories.instance.add(
                        lincController.text,
                        qualityController.text,
                        priceController.text,
                        weightController.text,
                        additionalServicesController ?? '',
                        detailsController.text,
                        isSwish,);
                  }
                },
                text: 'ДАЛЕ',
                color: lincController.text != '' ? AppColors.green : AppColors.noActive,
                colorText: AppColors.brown,
              )
            ],
          ),
        ),
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


class _AdditionalInformation extends StatelessWidget {
  const _AdditionalInformation({
    Key? key,
    this.onChanged,
    this.controller,
    this.onEditingComplete,
  }) : super(key: key);
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130.0,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 8,
            child: TextField(
              maxLines: 5,
              onEditingComplete: onEditingComplete,
              textAlign: TextAlign.start,
              keyboardType: TextInputType.text,
              controller: controller,
              style: const TextStyle(
                fontSize: 14.0,
                color: AppColors.text,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText:
                    'Размер, цвет, кол-во, другие \n детали или Ваш вопрос',
                hintTextDirection: TextDirection.ltr,
                filled: true,
                fillColor: Colors.grey.shade100,
                hintStyle: const TextStyle(
                  color: AppColors.noActive,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: onChanged,
            ),
          ),
          Flexible(
            flex: 1,
            child: Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(AppIcons.additionalInformation)),
          ),
        ],
      ),
    );
  }
}


class _LinksGoods extends StatefulWidget {
  _LinksGoods({Key? key, required this.lincController,}) : super(key: key);
  final TextEditingController lincController;

  @override
  State<_LinksGoods> createState() => _LinksGoodsState();
}

class _LinksGoodsState extends State<_LinksGoods> with TickerProviderStateMixin{
  late bool isHintShown = false;

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
                height:  MediaQuery.of(context).size.height,
                width:  MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Stack(children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Material(
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            SvgPicture.asset(AppIcons.questions,
                              width:MediaQuery.of(context).size.width -10,),
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
                                      child: Text('Ссылка на выбранный товар для доставки из магазина США / Европы, по этой ссылке будет произведен расчет стоимости доставки груза в Украину.',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.white,
                                        ),),),
                                    const SizedBox(width: 10.0,),
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
                                          child: Text('?',
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
                ]))

);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldInputTextNumber(
      onChanged: (data){
        setState((){});
      },
      controller: widget.lincController,
      onEditingComplete: () {
        FocusScope.of(context).nextFocus();
      },
      textInputType: TextInputType.text,
      hintText: 'Укажите ссылку на товар*',
      widget: InkWell(
        onTap: () {
          _showHint(context);
          _animPlus();
          } ,
        child: const Text(
          '?',
          style: TextStyle(
            fontSize: 25.0,
            color: AppColors.blue,
          ),
        ),
      ),
    );
  }
}
