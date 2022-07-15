import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../resources/app_colors.dart';
import '../../../../resources/app_icons.dart';
import '../../../../widgets/button_enter.dart';
import '../../../../widgets/icon_link.dart';
import '../../../../widgets/swish_link.dart';
import '../../../../widgets/text_field_input_text_number.dart';

class OrderAddPurDelPage extends StatelessWidget {
  OrderAddPurDelPage({Key? key}) : super(key: key);
  static const routeName = '/order_pur_del_page/order_add_pur_del_page';
  late bool isHintShown = false;
  OverlayEntry? overlayEntry;

  void closeHint() {
    overlayEntry?.remove();
    isHintShown = false;
  }

  void showHint(BuildContext context) {
    overlayEntry = _overlayEntryBuilder();
    Overlay.of(context)?.insert(overlayEntry!);
    isHintShown = true;
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      maintainState: true,
      builder: (context) {
        return GestureDetector(
            onTap: () {
              if (isHintShown) {
                closeHint();
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
                      child: SvgPicture.asset(AppIcons.questions)
                    ),
                  )
                ])));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const _Swish(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: SizedBox(
                  height: 450.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFieldInputTextNumber(
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                        textInputType: TextInputType.text,
                        hintText: 'Укажите ссылку на товар*',
                        widget: InkWell(
                          onTap: () => showHint(context),
                          child: const Text(
                            '?',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: AppColors.blue,
                            ),
                          ),
                        ),
                      ),
                      TextFieldInputTextNumber(
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                        textInputType: TextInputType.text,
                        hintText: 'Количество (шт.)',
                        widget: const SizedBox.expand(),
                      ),
                      TextFieldInputTextNumber(
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                        textInputType: TextInputType.text,
                        hintText: 'Цена (дол.)',
                        widget: const SizedBox.expand(),
                      ),
                      TextFieldInputTextNumber(
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                        textInputType: TextInputType.text,
                        hintText: 'Примерный вес (кг)',
                        widget: const SizedBox.expand(),
                      ),
                      const _DropDownButton(),
                      _AdditionalInformation(),
                    ],
                  ),
                ),
              ),
              const ButtonEnter(
                text: 'ДАЛЕ',
                color: AppColors.green,
                colorText: AppColors.brown,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Swish extends StatefulWidget {
  const _Swish({Key? key}) : super(key: key);

  @override
  State<_Swish> createState() => _SwishState();
}

class _SwishState extends State<_Swish> {
  bool isSwish = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                isSwish = !isSwish;
                setState(() {});
              },
              contour: isSwish ? false : true,
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

class _DropDownButton extends StatefulWidget {
  const _DropDownButton({Key? key}) : super(key: key);

  @override
  State<_DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<_DropDownButton> {
  String? value;
  List<String> list = [
    'Дополнительна услуга 1',
    'Дополнительна услуга 2',
    'Дополнительна услуга 3',
    'Дополнительна услуга 4',
    'Дополнительна услуга 5',
    'Дополнительна услуга 6',
  ];

  Widget getDropdownButton() {
    List<DropdownMenuItem<String>> dropdownItem = [];

    for (String delivery in list) {
      var newItem = DropdownMenuItem(
        child: Text(
          delivery,
          style: const TextStyle(
            color: AppColors.text,
          ),
        ),
        value: delivery,
      );
      dropdownItem.add(newItem);
    }
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: const Text(
              'Дополнительные услуги',
              style: TextStyle(
                color: AppColors.noActive,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            value: value,
            onChanged: (data) {
              setState(() {
                value = data as String;
              });
            },
            items: dropdownItem,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getDropdownButton();
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


