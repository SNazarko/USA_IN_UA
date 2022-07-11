import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/pages/profile_pages/profile_recipient_page/profile_recipient_add_page/profile_recipient_add_page.dart';

import '../../../models/recipient_model.dart';
import '../../../repositories/recipient_repositories.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/icon_link.dart';
import '../../../widgets/swish_link.dart';
import '../profile_bank_cards_pages/profile_add_cards_page/profile_add_cards_page.dart';
import '../profile_bank_cards_pages/profile_bank_cards_page.dart';
import 'blocs/bloc_list_form/list_form_bloc.dart';

class ProfileRecipientAddressFormPage extends StatelessWidget {
  const ProfileRecipientAddressFormPage({Key? key}) : super(key: key);
  static const routeName = '/profile_recipient_page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListFormBloc>(
      create: (context) => ListFormBloc()
        ..add(
          LoadListFormEvent(),
        ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.all(
                15.0,
              ),
              child: SvgPicture.asset(
                AppIcons.arrowLeft,
              ),
            ),
          ),
          title: const Text(
            'Адреса получателей',
            style: TextStyle(
              color: AppColors.text,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 16.0,
              ),
              child: InkWell(
                onTap: () async {},
                child: SvgPicture.asset(
                  AppIcons.menu,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const _ListItem(),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return  const ProfileRecipientAddressesPage(
                        name: '',
                        phoneNumber: '',
                        departmentNP: '',
                        street: '',
                        houseNumber: '',
                        isCard: true,
                        city: '',
                        surname: '',
                        addressName: '',
                        flatNumber: '',
                        region: '',
                        country: '',
                        userCard: true,);
                    }));

                  },
                  child: const IconLink(
                    text: 'Добавить еще карту',
                    fontWeight: FontWeight.w700,
                    icon: AppIcons.plus,
                    color: AppColors.blue,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({Key? key}) : super(key: key);

  double _customExpanded(List list) {
    if (list.length == 1) return 265.0;
    if (list.length >= 2) return 530.0;
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListFormBloc, ListFormState>(
      builder: (context, state) {
        if (state.status == ListFormStatus.success) {
          return SizedBox(
            width: double.infinity,
            height: _customExpanded(state.list),
            child: ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (BuildContext context, int index) {
                final RecipientModel list = state.list[index];
                return DismissibleWidget(
                  item: list,
                  onResize: () => RecipientRepositories.instance.delete(
                    list.addressName!,
                  ),
                  child: _RecipientAddressFormModel(
                    userCard: list.userCard,
                    country: list.country,
                    houseNumber: list.houseNumber,
                    flatNumber: list.flatNumber,
                    addressName: list.addressName,
                    region: list.region,
                    city: list.city,
                    street: list.street,
                    name: list.name,
                    surname: list.surname,
                    phoneNumber: list.phoneNumber,
                    departmentNP: list.departmentNP,
                    // addressName: list.,
                    isCard: list.isCard,
                  ),
                );
              },
            ),
          );
        }
        if (state.status == ListFormStatus.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == ListFormStatus.failed) {
          return const Center(
            child: Text('Ошыбка'),
          );
        } else {
          return const Text('data');
        }
      },
    );
  }
}

class _RecipientAddressFormModel extends StatelessWidget {
  const _RecipientAddressFormModel({
    Key? key,
    this.region,
    this.city,
    this.street,
    this.name,
    this.surname,
    this.phoneNumber,
    this.departmentNP,
    this.addressName,
    this.isCard, this.houseNumber, this.flatNumber, this.country, this.userCard,
  }) :  super(key: key);
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
  final bool? userCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260.0,
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
                    text: addressName!,
                    contour: true,
                    color: AppColors.blue,
                    onTap: () {},
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return  ProfileRecipientAddressesPage(
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
