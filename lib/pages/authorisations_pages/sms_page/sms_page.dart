import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/button_enter.dart';

class SmsPage extends StatefulWidget {
  const SmsPage({Key? key}) : super(key: key);

  @override
  State<SmsPage> createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  TextEditingController controller = TextEditingController();
  int counter = 30;

  void startCounter() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick > 30) {
        timer.cancel();
      } else {
        setState(() {
          --counter;
        });
      }
    });
  }

  @override
  void initState() {
    startCounter();
    super.initState();
  }

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
                      const Text(
                        '+38 063 058 8512',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      PinFieldAutoFill(
                          controller: controller,
                          decoration: const UnderlineDecoration(
                            colorBuilder: FixedColorBuilder(AppColors.text),
                          ),
                          currentCode: '',
                          onCodeSubmitted: (text) {},
                          onCodeChanged: (text) {
                            if (text?.length == 6) {
                              FocusScope.of(context).requestFocus(FocusNode());
                            }
                          },
                          codeLength: 6),
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
                      const ButtonEnter(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
