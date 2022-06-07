import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:usa_in_ua/resources/app_colors.dart';

class PurchaseAndDeliveryScreen extends StatelessWidget {
  const PurchaseAndDeliveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 5,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(top: 70.0, left: 25.0),
              child: Column(
                children: [
                  _Swish(
                    text: 'Покупка и доставка',
                    onTap: () {},
                  ),
                  _Swish(
                    text: 'Только доставка',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(flex: 8, child: SizedBox()),
      ],
    );
  }
}

class _Swish extends StatelessWidget {
  const _Swish({Key? key, required this.text, required this.onTap})
      : super(key: key);
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: const BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                ),
                Positioned(
                  top: 10.0,
                  left: 10.0,
                  child: Container(
                    width: 25.0,
                    height: 25.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 5.0,
            ),
            Text(
              text,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _Link extends StatelessWidget {
  const _Link({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}
