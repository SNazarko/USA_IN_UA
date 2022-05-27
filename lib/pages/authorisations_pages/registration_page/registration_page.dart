import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../resources/app_images.dart';
import '../../../widgets/button_enter.dart';
import '../../../widgets/text_field_phone_number.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60.0,
            left: 20.0,
            right: 20.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Регистрация',
                        style: TextStyle(
                          fontSize: 40.0,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      TextFieldPhoneNumber(
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                        textInputType: TextInputTypeStatus.name,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFieldPhoneNumber(
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                        textInputType: TextInputTypeStatus.emailAddress,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFieldPhoneNumber(
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                        textInputType: TextInputTypeStatus.number,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: 'Регистрируясь, Вы соглашаетесь с \n',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: AppColors.text,
                          ),
                          children: [
                            TextSpan(
                              text: 'пользовательским соглашением ',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: AppColors.text,
                                decoration: TextDecoration.underline,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      ButtonEnter(
                        onPressed: () {
                        },
                        text: 'ЗАРЕГИСТРИРОВАТЬСЯ',
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.password,
                            color: AppColors.blue,
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          const Text(
                            'Я уже зарегистрирован',
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Войти как пользователь',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            Image.asset(
                              AppImages.google,
                              width: 25.0,
                              height: 25.0,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Войти как пользователь',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            Image.asset(
                              AppImages.facebook,
                              width: 25.0,
                              height: 25.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
