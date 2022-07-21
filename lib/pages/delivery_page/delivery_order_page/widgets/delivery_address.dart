import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usa_in_ua/resources/app_images.dart';

import '../../../../blocs/address_list_form/list_form_bloc.dart';
import '../../../../models/recipient_model.dart';
import '../../../../repositories/recipient_repositories.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_icons.dart';
import '../../../../widgets/icon_link.dart';
import '../../../../widgets/recipient_address_form_model.dart';
import '../../../profile_pages/profile_bank_cards_pages/profile_bank_cards_page.dart';
import '../../../profile_pages/profile_recipient_page/profile_recipient_add_page/profile_recipient_add_page.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 5.0,
        bottom: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Flexible(
            flex: 10,
            child: BlocBuilder<ListFormBloc, ListFormState>(
              builder: (context, state) {
                if (state.status == ListFormStatus.success) {
                  return ListView.builder(
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
                  );
                }
                if (state.status == ListFormStatus.empty) {
                  return Image.asset(
                    AppImages.addressRafiki,
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
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0,),
              child: InkWell(
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
            ),
          ),

        ],
      ),
    );
  }
}
