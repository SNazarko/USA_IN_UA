import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/app_colors.dart';
import '../resources/app_icons.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);
  static const routeName = '/test';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Test'),
          SizedBox(
            height: 100,
          ),
          RotatedBox(
            quarterTurns: 3,
            child: SvgPicture.asset(
              AppIcons.plus,
              width: 100.0,
              height: 100.0,
              color: AppColors.text,
            ),
          ),
        ],
      ),
    );
  }
}
