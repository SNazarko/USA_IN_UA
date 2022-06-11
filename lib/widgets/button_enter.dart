import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class ButtonEnter extends StatelessWidget {
  const ButtonEnter({Key? key, this.onPressed, required this.text})
      : super(key: key);
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 56.0,
          width: screenWidth,
          decoration: const BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14.0,
                color: AppColors.brown,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
