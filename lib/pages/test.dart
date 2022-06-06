import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/app_colors.dart';
import '../resources/app_icons.dart';
import '../resources/app_images.dart';
import '../widgets/navigation/bloc/anim_bloc.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);
  static const routeName = '/test';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimBloc, AnimState>(
      builder: (context, state) {
        return Container(
          color: Colors.blueGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Test'),
            ],
          ),
        );
      },
    );
  }
}
