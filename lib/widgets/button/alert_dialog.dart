import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/resources/app_icons.dart';
import 'package:usa_in_ua/resources/app_images.dart';

import '../../resources/app_colors.dart';

class AlertDialogApp {
  AlertDialogApp._();

  static final AlertDialogApp instance = AlertDialogApp._();

  void alertDialog(
    BuildContext context,
    String title,
    String subTitle,
    Widget widget,
  ) =>
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                  child: SvgPicture.asset(AppIcons.star)),
              const SizedBox(width: 10.0,),
              Flexible(
                flex: 8,
                child: Text(
                  title,
                  style: const TextStyle(
                      color: AppColors.text,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,),
                ),
              )
            ],
          ),
          content: Text(
            subTitle,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: AppColors.text,
              fontSize: 14.0,
            ),
          ),
          actions: <Widget>[
            widget,
          ],
        ),
      );
}
