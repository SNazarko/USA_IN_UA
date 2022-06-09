import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class IconLink extends StatelessWidget {
  const IconLink({
    Key? key,
    required this.text,
    required this.color,
    required this.icon,
  }) : super(key: key);
  final String text;
  final String icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: SvgPicture.asset(
              icon,
              width: 30.0,
              height: 30.0,
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
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}