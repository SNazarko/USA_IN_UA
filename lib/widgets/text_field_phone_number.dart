import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';

import '../resources/app_colors.dart';

enum TextInputTypeStatus {
  number,
  name,
  emailAddress,
}

class TextFieldPhoneNumber extends StatelessWidget {
  const TextFieldPhoneNumber({
    Key? key,
    this.onChanged,
    this.controller,
    this.textInputType = TextInputTypeStatus.number,
    this.onEditingComplete,
  }) : super(key: key);
  final TextInputTypeStatus textInputType;
  final void Function(String)? onChanged;

  final void Function()? onEditingComplete;
  final TextEditingController? controller;

  TextInputType _textInputType(TextInputTypeStatus type) {
    if (type == TextInputTypeStatus.number) return TextInputType.number;
    if (type == TextInputTypeStatus.name) return TextInputType.name;
    if (type == TextInputTypeStatus.emailAddress) {
      return TextInputType.emailAddress;
    }
    return TextInputType.text;
  }

  String _hintText(TextInputTypeStatus type) {
    if (type == TextInputTypeStatus.number) return 'Ваш номер телефона*';
    if (type == TextInputTypeStatus.name) return 'Ваше имя*';
    if (type == TextInputTypeStatus.emailAddress) return 'Ваш email*';
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onEditingComplete: onEditingComplete,
      controller: controller,
      inputFormatters: textInputType == TextInputTypeStatus.number
          ? [
              MaskedInputFormatter('+##(###) ## ## ###'),
            ]
          : null,
      keyboardType: _textInputType(textInputType),
      style:
          const TextStyle(color: AppColors.text, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        hintText: _hintText(textInputType),
        hintTextDirection: TextDirection.ltr,
        filled: true,
        fillColor: Colors.grey.shade100,
        hintStyle: const TextStyle(
          color: AppColors.noActive,
          fontSize: 14.0,
          fontWeight: FontWeight.w100,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
