import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';

import '../resources/app_colors.dart';

class TextFieldPhoneNumber extends StatelessWidget {
  const TextFieldPhoneNumber({
    Key? key,
    this.onChanged,
    this.controller,
  }) : super(key: key);
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: [
        MaskedInputFormatter('+##(###) ## ## ###'),
      ],
      keyboardType: TextInputType.phone,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: const InputDecoration(
        hintText: 'Ваш Номер телефона*',
        hintTextDirection: TextDirection.ltr,
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(
          color: AppColors.noActive,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
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
