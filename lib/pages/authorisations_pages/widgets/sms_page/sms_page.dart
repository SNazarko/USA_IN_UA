import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../resources/app_colors.dart';
import '../../../../widgets/button_enter.dart';
import '../../bloc/authorisation_bloc.dart';

class SmsPage extends StatefulWidget {
  const SmsPage({
    Key? key,
    required this.controller,
    required this.phoneController,
  }) : super(key: key);
  final TextEditingController phoneController;
  final PageController controller;

  @override
  State<SmsPage> createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  TextEditingController smsController = TextEditingController();
  int counter = 30;

  void _buttonContinue(
    BuildContext context,
    state,
  ) {
    if (state.status == AuthStatus.codeSent) {
      FocusScope.of(context).unfocus();
      BlocProvider.of<AuthBloc>(context).add(
        PhoneAuthCodeVerificationIdEvent(
            phone: widget.phoneController.text,
            smsCode: smsController.text,
            verificationId: state.verificationId),
      );
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          widget.controller.animateToPage(
            3,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
          );
        }
      });
    }
  }

  void startCounter(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick > 30) {
        timer.cancel();
      }
      if (timer.tick == 29) {
        BlocProvider.of<AuthBloc>(context).add(
          PhoneNumberVerificationIdEvent(
            phone: widget.phoneController.text,
          ),
        );
      } else {
        try {
          setState(() {
            --counter;
          });
        } on Exception {
          timer.cancel();
        }
      }
    });
  }

  @override
  void initState() {
    startCounter(context);
    super.initState();
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
                            'Код подтверждения',
                            style: TextStyle(
                              fontSize: 40.0,
                            ),
                          ),
                          const SizedBox(
                            height: 60.0,
                          ),
                          const Text(
                            'Смс с кодом отправленно на номер:',
                            style: TextStyle(
                              color: AppColors.blue,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            widget.phoneController.text,
                            style: const TextStyle(
                              color: AppColors.blue,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: PinCodeTextField(
                              keyboardType: TextInputType.number,
                              controller: smsController,
                              textStyle: const TextStyle(
                                fontSize: 45.0,
                                color: AppColors.text,
                              ),
                              appContext: context,
                              length: 6,
                              onChanged: (text) {
                                if (text.length == 6) {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                }
                              },
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.underline,
                                inactiveColor: AppColors.text,
                                activeColor: Colors.green,
                                selectedColor: Colors.brown,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 60.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ButtonEnter(
                            onPressed: () => _buttonContinue(context, state),
                            text: 'ЗАРЕГИСТРИРОВАТЬСЯ',
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            'Отправить код повторно через: $counter',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                        ],
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
