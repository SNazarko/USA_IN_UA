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
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14.0,
          color: AppColors.brown,
        ),
      ),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          Size(
            screenWidth,
            56.0,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          AppColors.green,
        ),
      ),
    );
  }
}
