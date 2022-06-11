import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/resources/app_icons.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({Key? key}) : super(key: key);
  static const routeName = '/delivery_page';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppIcons.boxActive,
            width: 50.0,
            height: 50.0,
          ),
          const Center(
            child: Text('DeliveryPage'),
          ),
        ],
      ),
    );
  }
}
