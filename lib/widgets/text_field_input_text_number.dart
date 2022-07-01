import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:usa_in_ua/widgets/text_field_phone_number.dart';

import '../resources/app_colors.dart';

class TextFieldInputTextNumber extends StatelessWidget {
  const TextFieldInputTextNumber({
    Key? key,
    this.onChanged,
    this.controller,
    this.onEditingComplete,
    this.hintText,
    required this.widget,
    this.inputFormatters,
    this.fontSize,
    this.textAlign,
    this.onTap,this.textInputType,
  }) : super(key: key);
  final String? hintText;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Widget widget;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextInputType? textInputType;


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
              onTap: onTap,
              onEditingComplete: onEditingComplete,
              textAlign: textAlign ?? TextAlign.start  ,
              keyboardType: textInputType ?? TextInputType.number,
              controller: controller,
              inputFormatters: inputFormatters,
              style:  TextStyle(
                fontSize: fontSize ?? 14.0,
                color: AppColors.text,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: hintText ?? '',
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
