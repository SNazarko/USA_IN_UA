import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../resources/app_colors.dart';
import '../../../../resources/app_icons.dart';
import '../../../../widgets/button_enter.dart';
import '../../../../widgets/text_field_input_text_number.dart';

class ProfileAddCardsPage extends StatelessWidget {
  const ProfileAddCardsPage({Key? key}) : super(key: key);
  static const routeName = '/profile_bank_cards_page/profile_add_cards_page';

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
            Column(children: [
              const Text(
                'Для добавления карты, как средства платежа введите ее реквизиты',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0,bottom: 10.0,),
                child: Text(
                  'Номер карты',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
              ),
              TextFieldInputTextNumber(
                onEditingComplete: (){
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
                      padding: const EdgeInsets.only(top: 20.0,right: 20.0,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10.0,),
                            child: Text('Срок действия',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          TextFieldInputTextNumber(
                            onEditingComplete: (){
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
                      padding: const EdgeInsets.only(top: 20.0,left: 20.0,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10.0,),
                            child: Text('CVV',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          TextFieldInputTextNumber(
                            onEditingComplete: (){
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
            ],),
            const ButtonEnter(
              color: AppColors.green,
              colorText: AppColors.brown,
              text: 'СОХРАНИТЬ',),
          ],
        ),
      ),
    );
  }
}
