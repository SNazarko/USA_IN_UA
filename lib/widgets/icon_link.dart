import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/app_colors.dart';

class IconLink extends StatelessWidget {
  const IconLink({
    Key? key,
    required this.text,
    required this.color,
    required this.icon,
    required this.crossAxisAlignment,
    this.fontWeight,
    this.fontSize,
    this.sizeIcon,
    this.mainAxisAlignment, this.colorText,
  }) : super(key: key);
  final String text;
  final String icon;
  final Color color;
  final Color? colorText;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? sizeIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Flexible(
          flex: 1,
          child: SvgPicture.asset(
            icon,
            width: sizeIcon ?? 30.0,
            height: sizeIcon ?? 30.0,
            color: color,
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Flexible(
          flex: 5,
          child: Text(
            text,
            style: TextStyle(
              color: colorText ?? AppColors.text,
              fontSize: fontSize,
              fontWeight: fontWeight ?? FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
