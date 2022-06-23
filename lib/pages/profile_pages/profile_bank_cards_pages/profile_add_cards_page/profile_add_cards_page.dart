import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../resources/app_colors.dart';
import '../../../../resources/app_icons.dart';
import '../../../../widgets/button_enter.dart';
import '../../../../widgets/text_field_input_text_number.dart';

class ProfileAddCardsPageArguments {
  ProfileAddCardsPageArguments(
    this.cardNumber,
    this.cardDate,
    this.cardCvv,
      this.visaMaster,
  );
  final String cardNumber;
  final String cardDate;
  final String cardCvv;
  final bool visaMaster;
}

class ProfileAddCardsPage extends StatefulWidget {
  ProfileAddCardsPage({
    Key? key,
    required this.cardNumber,
    required this.cardDate,
    required this.cardCvv,
    required this.visaMaster,
  }) : super(key: key);
  static const routeName = '/profile_bank_cards_page/profile_add_cards_page';
  String cardNumber;
  String cardDate;
  String cardCvv;
  bool visaMaster;

  @override
  State<ProfileAddCardsPage> createState() => _ProfileAddCardsPageState();
}

class _ProfileAddCardsPageState extends State<ProfileAddCardsPage> {
  late FToast fToast;

  bool isCreditCard (int value){
    if(value == 4) return true;
    return false;
  }

  Widget toast(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: AppColors.green,
      ),
      child: Text(text),
    );
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
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
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              AppIcons.arrowLeft,
            ),
          ),
        ),
        title: const Text(
          'Банковские карты',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Для добавления карты, как средства платежа введите ее реквизиты',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                    bottom: 10.0,
                  ),
                  child: Text(
                    'Номер карты',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                TextFieldInputTextNumber(
                  onChanged: (date) {
                    widget.cardNumber = date;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  textAlign: TextAlign.center,
                  fontSize: 20.0,
                  inputFormatters: [
                    MaskedInputFormatter('#### #### #### ####'),
                  ],
                  widget: SvgPicture.asset(
                    AppIcons.creditCard,
                    color: AppColors.noActive,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          right: 20.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                bottom: 10.0,
                              ),
                              child: Text(
                                'Срок действия',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            TextFieldInputTextNumber(
                              onChanged: (date) {
                                widget.cardDate = date;
                              },
                              onEditingComplete: () {
                                FocusScope.of(context).nextFocus();
                              },
                              hintText: 'ММ/ ГГ',
                              textAlign: TextAlign.center,
                              fontSize: 20.0,
                              inputFormatters: [
                                MaskedInputFormatter('##/ ##'),
                              ],
                              widget: const SizedBox.expand(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          left: 20.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                bottom: 10.0,
                              ),
                              child: Text(
                                'CVV',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            TextFieldInputTextNumber(
                              onChanged: (date) {
                                widget.cardCvv = date;
                              },
                              onEditingComplete: () {
                                FocusScope.of(context).nextFocus();
                              },
                              hintText: 'XXX',
                              textAlign: TextAlign.center,
                              fontSize: 20.0,
                              inputFormatters: [
                                MaskedInputFormatter('###'),
                              ],
                              widget: const SizedBox.expand(),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            ButtonEnter(
              onPressed: () {
                if(widget.cardNumber.isEmpty || widget.cardNumber.length < 19){
                  fToast.showToast(
                    child: toast('Введите номер карты'),
                    gravity: ToastGravity.TOP,
                    toastDuration: const Duration(seconds: 2),
                  );
                } else if (widget.cardDate.isEmpty || widget.cardDate.length < 6){
                  fToast.showToast(
                    child: toast('Введите строки действия карты'),
                    gravity: ToastGravity.TOP,
                    toastDuration: const Duration(seconds: 2),
                  );
                }else if (widget.cardCvv.isEmpty || widget.cardCvv.length <3){
                  fToast.showToast(
                    child: toast('Введите CVV'),
                    gravity: ToastGravity.TOP,
                    toastDuration: const Duration(seconds: 2),
                  );
                }else{
                  final int isCard = int.parse(widget.cardNumber[0]);
                Navigator.pop(context, [
                  widget.cardNumber,
                  widget.cardDate,
                  widget.cardCvv,
                  isCreditCard(isCard),
                ]);
                }
              },
              color: AppColors.green,
              colorText: AppColors.brown,
              text: 'СОХРАНИТЬ',
            ),
          ],
        ),
      ),
    );
  }
}
