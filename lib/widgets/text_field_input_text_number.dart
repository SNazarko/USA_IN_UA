import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class TextFieldInputTextNumber extends StatelessWidget {
  const TextFieldInputTextNumber({
    Key? key,
    this.onChanged,
    this.controller,
    this.onEditingComplete,
    required this.hintText,
    required this.widget,
  }) : super(key: key);
  final String hintText;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final TextEditingController? controller;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          )),
      child: Row(
        children: [
          Flexible(
            flex: 10,
            child: TextField(
              keyboardType: TextInputType.number,
              onEditingComplete: onEditingComplete,
              controller: controller,
              style: const TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintTextDirection: TextDirection.ltr,
                filled: true,
                fillColor: Colors.grey.shade100,
                hintStyle: const TextStyle(
                  color: AppColors.noActive,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: onChanged,
            ),
          ),
          Flexible(flex: 2, child: widget),
        ],
      ),
    );
  }
}
