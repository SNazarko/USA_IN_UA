import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import '../resources/app_colors.dart';
import '../resources/app_icons.dart';
import '../resources/app_images.dart';
import '../widgets/button/alert_dialog.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);
  static const routeName = '/test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          child: Container(),
        )
      ),
    );
  }
}
