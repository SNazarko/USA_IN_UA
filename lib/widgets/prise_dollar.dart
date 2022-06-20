import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/app_colors.dart';
import '../resources/app_icons.dart';

class PriceDollar extends StatelessWidget {
  const PriceDollar(
      {Key? key,
      required this.textNumber,
      required this.fontSize,
      required this.iconSize, this.color,})
      : super(key: key);
  final String textNumber;
  final double fontSize;
  final double iconSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textNumber,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
          ),
        ),
        SvgPicture.asset(
          AppIcons.dollar,
          color: color ?? AppColors.text,
          width: iconSize,
          height: iconSize,
        ),
      ],
    );
  }
}
