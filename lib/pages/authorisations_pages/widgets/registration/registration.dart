import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../resources/app_colors.dart';
import '../../../../resources/app_icons.dart';
import '../../../../resources/app_images.dart';
import '../../../../widgets/button_enter.dart';
import '../../../../widgets/text_field_phone_number.dart';
import '../../bloc/authorisation_bloc.dart';

class Registration extends StatefulWidget {
  const Registration(
      {Key? key,
      required this.controller,
      required this.phoneController,
      required this.nameController,
      required this.emailController})
      : super(key: key);
  final PageController controller;
  final TextEditingController phoneController;
  final TextEditingController nameController;
  final TextEditingController emailController;
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  GoogleSignInAccount? _userObj;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late FToast fToast;

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

  void _buttonContinue(
    BuildContext context,
    state,
  ) {
    if (widget.nameController.text.isEmpty) {
      fToast.showToast(
        child: toast('Введите ваше имя'),
        gravity: ToastGravity.BOTTOM,
        toastDuration: const Duration(seconds: 2),
      );
    } else if (widget.phoneController.text.isEmpty) {
      fToast.showToast(
        child: toast('Введите ваш номер телефона'),
        gravity: ToastGravity.BOTTOM,
        toastDuration: const Duration(seconds: 2),
      );
    } else if (widget.emailController.text.isEmpty) {
      fToast.showToast(
        child: toast('Введите ваш email'),
        gravity: ToastGravity.BOTTOM,
        toastDuration: const Duration(seconds: 2),
      );
    } else {
      if (widget.phoneController.text.isNotEmpty &&
          state.status == AuthStatus.initial) {
        FocusScope.of(context).unfocus();
        BlocProvider.of<AuthBloc>(context).add(
          PhoneNumberVerificationIdEvent(
            phone: widget.phoneController.text,
          ),
        );
        widget.controller.animateToPage(
          1,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeIn,
        );
      } else if (state.status == AuthStatus.failed) {
        BlocProvider.of<AuthBloc>(context).add(
          PhoneNumberVerificationIdEvent(
            phone: widget.phoneController.text,
          ),
        );
        widget.controller.animateToPage(
          1,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeIn,
        );
      }
    }
  }

  Future<void> _facebookSignInTab() async {
    await FacebookAuth.instance.login();
    final userData = await FacebookAuth.instance.getUserData();
    final TextEditingController email =
        TextEditingController(text: userData['email']);
    final TextEditingController name =
        TextEditingController(text: userData['name']);

    if (userData.isNotEmpty) {
      widget.nameController.text = name.text;
      widget.emailController.text = email.text;
      setState(() {});
    }
  }

  void _googleSignInTab() {
    _googleSignIn.signIn().then((userData) {
      _userObj = userData;
      final TextEditingController name =
          TextEditingController(text: _userObj!.displayName.toString());
      final TextEditingController email =
          TextEditingController(text: _userObj!.email);
      if (userData != null) {
        widget.nameController.text = name.text;
        widget.emailController.text = email.text;
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
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
                            'Регистрация',
                            style: TextStyle(
                              fontSize: 40.0,
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          TextFieldInput(
                            controller: widget.nameController,
                            onEditingComplete: () {
                              FocusScope.of(context).nextFocus();
                            },
                            textInputType: TextInputTypeStatus.name,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFieldInput(
                            controller: widget.emailController,
                            onEditingComplete: () {
                              FocusScope.of(context).nextFocus();
                            },
                            textInputType: TextInputTypeStatus.emailAddress,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFieldInput(
                            controller: widget.phoneController,
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
                            onPressed: () => _buttonContinue(context, state),
                            text: 'ЗАРЕГИСТРИРОВАТЬСЯ',
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Row(
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
                            GestureDetector(
                              onTap: () => _googleSignInTab(),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            GestureDetector(
                              onTap: () => _facebookSignInTab(),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
