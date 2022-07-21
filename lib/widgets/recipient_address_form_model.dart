import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/widgets/swish_link.dart';

import '../pages/profile_pages/profile_recipient_page/profile_recipient_add_page/profile_recipient_add_page.dart';
import '../repositories/recipient_repositories.dart';
import '../resources/app_colors.dart';
import '../resources/app_icons.dart';

class RecipientAddressFormModel extends StatelessWidget {
  RecipientAddressFormModel({
    Key? key,
    this.region,
    this.city,
    this.street,
    this.name,
    this.surname,
    this.phoneNumber,
    this.departmentNP,
    this.addressName,
    this.isCard,
    this.houseNumber,
    this.flatNumber,
    this.country,
    this.userCard,
  }) : super(key: key);
  final String? region;
  final String? city;
  final String? street;
  final String? name;
  final String? surname;
  final String? phoneNumber;
  final String? departmentNP;
  final String? addressName;
  final String? houseNumber;
  final String? flatNumber;
  final String? country;
  final bool? isCard;
  bool? userCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Container(
        width: double.infinity,
        height: 290.0,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 10,
                    child: Swish(
                      colorText: true,
                      text: addressName!,
                      contour: userCard!,
                      color: AppColors.blue,
                      onTap: () =>

                          RecipientRepositories.instance.doneAddress(addressName!, !userCard!),



                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return ProfileRecipientAddressesPage(
                                name: addressName ?? '',
                                phoneNumber: phoneNumber ?? '',
                                departmentNP: departmentNP ?? '',
                                street: street ?? '',
                                houseNumber: houseNumber ?? '',
                                isCard: isCard ?? false,
                                city: city ?? '',
                                surname: surname ?? '',
                                addressName: addressName ?? '',
                                flatNumber: flatNumber ?? '',
                                region: region ?? '',
                                country: country ?? '',
                                userCard: userCard ?? true,
                              );
                            }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 16.0,
                          left: 10.0,
                        ),
                        child: SvgPicture.asset(
                          AppIcons.editSquare,
                          width: 25.0,
                          height: 25.0,
                          color: AppColors.noActive,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              _Link(
                  text1: 'Способ доставки',
                  text2:
                  isCard! ? 'НП (до отделения)' : 'НП (адресная доставка)'),
              _Link(text1: 'Область', text2: region!),
              _Link(text1: 'Город', text2: city!),
              isCard!
                  ? _Link(text1: 'Отделение', text2: departmentNP!)
                  : _Link(text1: 'Адрес', text2: street!),
              _Link(text1: 'Имя', text2: name!),
              _Link(text1: 'Фамилия', text2: surname!),
              _Link(text1: 'Номер телефона', text2: phoneNumber!),
            ],
          ),
        ),
      ),
    );
  }
}

class _Link extends StatelessWidget {
  const _Link({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 3.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text1,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
          ),
          Expanded(
            child: Text(text2,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: AppColors.blue,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                )),
          ),
        ],
      ),
    );
  }
}