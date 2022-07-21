import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/blocs/address_list_form/list_form_bloc.dart';
import 'package:usa_in_ua/pages/profile_pages/profile_recipient_page/profile_recipient_add_page/profile_recipient_add_page.dart';

import '../../../models/recipient_model.dart';
import '../../../repositories/recipient_repositories.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/icon_link.dart';
import '../../../widgets/recipient_address_form_model.dart';
import '../../../widgets/swish_link.dart';
import '../profile_bank_cards_pages/profile_add_cards_page/profile_add_cards_page.dart';
import '../profile_bank_cards_pages/profile_bank_cards_page.dart';


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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const ProfileRecipientAddressesPage(
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
                          userCard: true,
                        );
                      }),
                    );
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
                  child: RecipientAddressFormModel(
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


