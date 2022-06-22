import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

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
  }) : super(key: key);
  final String text;
  final String icon;
  final Color color;
  final CrossAxisAlignment crossAxisAlignment;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? sizeIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
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
              fontSize: fontSize,
              fontWeight: fontWeight ?? FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
