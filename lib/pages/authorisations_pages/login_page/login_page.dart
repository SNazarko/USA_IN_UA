import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/resources/app_colors.dart';

import '../../../resources/app_icons.dart';
import '../../../resources/app_images.dart';
import '../../../widgets/button_enter.dart';
import '../../../widgets/text_field_phone_number.dart';
import '../bloc/authorisation_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
    required this.controller,
    required this.phoneController,
  }) : super(key: key);
  final PageController controller;
  final TextEditingController phoneController;

  void _buttonContinue(
    BuildContext context,
    state,
  ) {
    if (phoneController.text.isNotEmpty && state.status == AuthStatus.initial) {
      FocusScope.of(context).unfocus();
      BlocProvider.of<AuthBloc>(context).add(
        PhoneNumberVerificationIdEvent(
          phone: phoneController.text,
        ),
      );
      controller.animateToPage(
        1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
      // } else if (state.status == AuthStatus.codeSent) {
      //   FocusScope.of(context).unfocus();
      //   BlocProvider.of<AuthBloc>(context).add(
      //     PhoneAuthCodeVerificationIdEvent(
      //         phone: phoneController.text,
      //         smsCode: otpController.text,
      //         verificationId: state.verificationId),
      //   );
      //   FirebaseAuth.instance.authStateChanges().listen((User? user) {
      //     if (user != null) {
      //       Timer(
      //         const Duration(milliseconds: 1),
      //             () => Navigator.pushNamed(
      //           context,
      //           LastAuthorizationPage.routeName,
      //         ),
      //       );
      //     }
      //   });
    } else if (state.status == AuthStatus.failed) {
      BlocProvider.of<AuthBloc>(context).add(
        PhoneNumberVerificationIdEvent(
          phone: phoneController.text,
        ),
      );
      controller.animateToPage(
        1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
    // else if (state.status == AuthStatus.failedCodeSent) {
    //   BlocProvider.of<AuthBloc>(context).add(
    //     PhoneNumberVerificationIdEvent(
    //       phone: phoneController.text,
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
                            'Вход',
                            style: TextStyle(
                              fontSize: 40.0,
                            ),
                          ),
                          const SizedBox(
                            height: 60.0,
                          ),
                          TextFieldPhoneNumber(
                            controller: phoneController,
                            textInputType: TextInputTypeStatus.number,
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          ButtonEnter(
                            onPressed: () => _buttonContinue(context, state),
                            text: 'ВОЙТИ',
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.addUser,
                                color: AppColors.blue,
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              const Text(
                                'Зарегистрироваться',
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
                              height: 60.0,
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
      },
    );
  }
}
