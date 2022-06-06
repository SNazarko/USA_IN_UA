import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../resources/app_colors.dart';
import '../../../../widgets/button_enter.dart';
import '../../bloc/authorisation_bloc.dart';
import '../../registration_page/registration_page.dart';

class Sms extends StatefulWidget {
  const Sms({
    Key? key,
    required this.controller,
    required this.phoneController,
    this.nameController,
    this.emailController,
  }) : super(key: key);
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController phoneController;
  final PageController controller;

  @override
  State<Sms> createState() => _SmsState();
}

class _SmsState extends State<Sms> {
  TextEditingController smsController = TextEditingController();
  int _counter = 30;
  Timer? _timer;
  bool getSms = true;

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
          verificationId: state.verificationId,
          userName: widget.nameController?.text ?? '',
          userEmail: widget.emailController?.text ?? '',
        ),
      );
      Timer(const Duration(seconds: 3), () {
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user?.uid != null) {
            print('1');
            final phoneNumber = user?.phoneNumber;
            FirebaseFirestore.instance
                .collection(phoneNumber!)
                .doc('user')
                .get()
                .then((DocumentSnapshot doc) {
              if (doc.data() != null) {
                print('2');
                final data = doc.data() as Map<String, dynamic>;
                final name = data['userName'];
                final email = data['userEmail'];
                if (name != '' && email != '') {
                  print('3');
                  widget.controller.animateToPage(
                    3,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn,
                  );
                } else {
                  print('4');
                  Timer(const Duration(seconds: 1), () {
                    Navigator.pushNamed(
                      context,
                      RegistrationPage.routeName,
                    );
                  });
                }
              } else {
                print('5');
                Timer(const Duration(seconds: 1), () {
                  Navigator.pushNamed(
                    context,
                    RegistrationPage.routeName,
                  );
                });
              }
            });
          }
        });
      });
    }
  }

  void startCounter(BuildContext context) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick > 30) {
        timer.cancel();
      }
      if (timer.tick == 29) {
        getSms = false;
      } else {
        setState(() {
          --_counter;
        });
      }
    });
  }

  @override
  void initState() {
    startCounter(context);
    super.initState();
  }

  @override
  void deactivate() {
    _timer?.cancel();
    super.deactivate();
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
                          getSms
                              ? Text(
                                  'Отправить код повторно через: $_counter',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              : TextButton(
                                  onPressed: () {
                                    BlocProvider.of<AuthBloc>(context).add(
                                      PhoneNumberVerificationIdEvent(
                                        phone: widget.phoneController.text,
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Отправить код повторно',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w700,
                                    ),
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
