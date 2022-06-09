import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';

class BackAndForthButton extends StatelessWidget {
  BackAndForthButton({
    Key? key,
    required this.controller,
    this.screen1,
    this.screen2,
    this.screen3,
    this.screen4,
  }) : super(key: key);
  final PageController controller;
  final bool? screen1;
  final bool? screen2;
  final bool? screen3;
  final bool? screen4;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                controller.previousPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn);
              },
              child: Text('Назад'),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                width: 25.0,
                height: 5,
                decoration: BoxDecoration(
                  color: screen1 != null ? AppColors.blue : Colors.transparent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              Container(
                width: 25.0,
                height: 5,
                decoration: BoxDecoration(
                  color: screen2 != null ? AppColors.blue : Colors.transparent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              Container(
                width: 25.0,
                height: 5,
                decoration: BoxDecoration(
                  color: screen3 != null ? AppColors.blue : Colors.transparent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              Container(
                width: 25.0,
                height: 5,
                decoration: BoxDecoration(
                  color: screen4 != null ? AppColors.blue : Colors.transparent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ]),
            TextButton(
              onPressed: () {
                controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn);
              },
              child: Text('Далее'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 5,
      decoration: const BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    );
  }
}
