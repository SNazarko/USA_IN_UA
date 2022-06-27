import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/text_field_input_text_number.dart';

class ProfileRecipientAddressesPage extends StatelessWidget {
  const ProfileRecipientAddressesPage({Key? key}) : super(key: key);
  static const routeName = '/profile_recipient_addresses_page';

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
          'Адреса получателей',
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0,),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 150.0,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const Text('Добавьте новый адрес для доставки и используйте его по умолчанию.',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),),
                  TextFieldInputTextNumber(
                    onTap: (){},
                    hintText: 'Название адреса (дом, офис и т.п.',
                    widget: const SizedBox.expand(),),
                  TextFieldInputTextNumber(
                    hintText: 'Страна',

                    widget: Icon(Icons.arrow_drop_down_outlined,
                    color: AppColors.noActive,),),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
