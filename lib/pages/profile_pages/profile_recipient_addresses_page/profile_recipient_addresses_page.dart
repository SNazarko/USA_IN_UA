import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../database/files_db.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/button_enter.dart';
import '../../../widgets/swish_link.dart';
import '../../../widgets/text_field_input_text_number.dart';
import '../profile_google_maps_page/profile_google_maps_page.dart';
import 'bloc/profile_recipient_bloc.dart';
import 'bloc/profile_recipient_event.dart';

class ProfileRecipientAddressesPage extends StatefulWidget {
  ProfileRecipientAddressesPage({Key? key}) : super(key: key);
  static const routeName = '/profile_recipient_addresses_page';

  @override
  State<ProfileRecipientAddressesPage> createState() =>
      _ProfileRecipientAddressesPageState();
}

class _ProfileRecipientAddressesPageState
    extends State<ProfileRecipientAddressesPage> {
  bool isSwish = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileRecipientBloc>(
      create: (context) => ProfileRecipientBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
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
              child: SvgPicture.asset(
                AppIcons.menu,
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
              SizedBox(
                width: double.infinity,
                height: 250.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Добавьте новый адрес для доставки и используйте его по умолчанию.',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: ButtonEnter(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          ProfileGoogleMapsPage.routeName,
                        ),
                        color: AppColors.green,
                        colorText: Colors.white,
                        text: 'ВЫБРАТЬ АДРЕС НА КАРТЕ',
                      ),
                    ),
                    TextFieldInputTextNumber(
                      onChanged: (data) =>
                          context.read<ProfileRecipientBloc>().add(
                                ProfileRecipientEvent(
                                  addressName: data,
                                ),
                              ),
                      textInputType: TextInputType.text,
                      hintText: 'Название адреса (дом, офис и т.п.',
                      widget: const SizedBox.expand(),
                    ),
                    TextFieldInputTextNumber(
                      onChanged: (data) => context.read<ProfileRecipientBloc>().add(
                        ProfileRecipientEvent(
                          country: data,
                        ),
                      ),
                      textInputType: TextInputType.text,
                      hintText: 'Страна',
                      widget: const SizedBox.expand(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 135,
                child: Column(
                  children: [
                    Swish(
                      color: AppColors.blue,
                      contour: isSwish ? true : false,
                      text: 'Новая Почта (до отделения)',
                      fontSize: 16.0,
                      onTap: () {
                        isSwish = !isSwish;
                        setState(() {});
                      },
                    ),
                    Swish(
                      color: AppColors.blue,
                      contour: isSwish ? false : true,
                      text: 'Новая Почта (адресная доставка)',
                      fontSize: 16.0,
                      onTap: () {
                        isSwish = !isSwish;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              isSwish ? DepartmentPost() : AddressDelivery(),
               Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 10.0,
                ),
                child: ButtonEnter(
                  onPressed: (){

                  },
                  color: AppColors.contour,
                  colorText: Colors.white,
                  text: 'СОХРАНИТЬ',
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class AddressDelivery extends StatelessWidget {
  AddressDelivery({
    Key? key,
  }) : super(key: key);
  final List<String> region = FilesDB.regions;

  List<String> deliveryList2 = [
    'Авиадоставка',
    'Быстрое море',
  ];

  List<String> deliveryList3 = [
    'Авиадоставка',
    'Быстрое море',
  ];

  Widget regionDropdownButton(state, BuildContext context) {
    List<DropdownMenuItem<String>> dropdownItem = [];

    for (String delivery in region) {
      var newItem = DropdownMenuItem(
        child: Text(
          delivery,
          style: const TextStyle(
            color: AppColors.text,
          ),
        ),
        value: delivery,
      );
      dropdownItem.add(newItem);
    }
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: const Text(
              'Регион',
              style: TextStyle(
                color: AppColors.noActive,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            value: state.region,
            onChanged: (value) {
              context.read<ProfileRecipientBloc>().add(
                    ProfileRecipientEvent(
                      region: value,
                    ),
                  );
            },
            items: dropdownItem,
          ),
        ),
      ),
    );
  }

  Widget cityDropdownButton(state, BuildContext context) {
    List<DropdownMenuItem<String>> dropdownItem = [];

    for (String delivery in deliveryList2) {
      var newItem = DropdownMenuItem(
        child: Text(
          delivery,
          style: const TextStyle(
            color: AppColors.text,
          ),
        ),
        value: delivery,
      );
      dropdownItem.add(newItem);
    }
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: const Text(
              'Город',
              style: TextStyle(
                color: AppColors.noActive,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            value: state.city,
            onChanged: (value) {
              context.read<ProfileRecipientBloc>().add(
                    ProfileRecipientEvent(
                      city: value,
                    ),
                  );
            },
            items: dropdownItem,
          ),
        ),
      ),
    );
  }

  Widget streetDropdownButton(state, BuildContext context) {
    List<DropdownMenuItem<String>> dropdownItem = [];

    for (String delivery in deliveryList3) {
      var newItem = DropdownMenuItem(
        child: Text(
          delivery,
          style: const TextStyle(
            color: AppColors.text,
          ),
        ),
        value: delivery,
      );
      dropdownItem.add(newItem);
    }
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: const Text(
              'Улича',
              style: TextStyle(
                color: AppColors.noActive,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            value: state.street,
            onChanged: (value) => context.read<ProfileRecipientBloc>().add(
                  ProfileRecipientEvent(
                    street: value,
                  ),
                ),
            items: dropdownItem,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileRecipientBloc, ProfileRecipientState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 420.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // DropdownButtonCustom(
              //   region: FilesDB.regions,
              //   hint: 'Улица',
              //   value: state.street ?? FilesDB.regions.first,
              //   onChanged: (data) => context.read<ProfileRecipientBloc>().add(
              //     ProfileRecipientEvent(
              //       street: data,
              //     ),
              //   ),
              // ),
              TextFieldInputTextNumber(
                textInputType: TextInputType.text,
                onChanged: (data) {
                  context.read<ProfileRecipientBloc>().add(
                        ProfileRecipientEvent(
                          name: data,
                        ),
                      );
                },
                hintText: 'Имя',
                widget: const SizedBox.expand(),
              ),
              TextFieldInputTextNumber(
                textInputType: TextInputType.text,
                onChanged: (data) {
                  context.read<ProfileRecipientBloc>().add(
                        ProfileRecipientEvent(
                          surname: data,
                        ),
                      );
                },
                hintText: 'Фамилия',
                widget: const SizedBox.expand(),
              ),
              TextFieldInputTextNumber(
                textInputType: TextInputType.phone,
                onChanged: (data) {
                  context.read<ProfileRecipientBloc>().add(
                        ProfileRecipientEvent(
                          phoneNumber: data,
                        ),
                      );
                },
                hintText: 'Номер телефона',
                widget: const SizedBox.expand(),
              ),
              regionDropdownButton(state, context),
              cityDropdownButton(state, context),
              streetDropdownButton(state, context),
              Row(
                children:  [
                  Expanded(
                    child: TextFieldInputTextNumber(
                      onChanged: (data) => context.read<ProfileRecipientBloc>().add(
                        ProfileRecipientEvent(
                          houseNumber: data,
                        ),
                      ),
                      textInputType: TextInputType.text,
                      hintText: 'Номер дома',
                      widget: const SizedBox.expand(),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: TextFieldInputTextNumber(
                      onChanged: (data) => context.read<ProfileRecipientBloc>().add(
                        ProfileRecipientEvent(
                          flatNumber: data,
                        ),
                      ),
                      textInputType: TextInputType.number,
                      hintText: 'Номер квартиры',
                      widget: const SizedBox.expand(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class DepartmentPost extends StatelessWidget {
  DepartmentPost({
    Key? key,
  }) : super(key: key);
  final List<String> region = FilesDB.regions;
  List<String> deliveryList = [
    'Авиадоставка',
    'Быстрое море',
  ];
  List<String> deliveryList2 = [
    'Авиадоставка',
    'Быстрое море',
  ];
  List<String> deliveryList3 = [
    'Авиадоставка',
    'Быстрое море',
  ];

  Widget regionDropdownButton(state, BuildContext context) {
    List<DropdownMenuItem<String>> dropdownItem = [];

    for (String delivery in region) {
      var newItem = DropdownMenuItem(
        child: Text(
          delivery,
          style: const TextStyle(
            color: AppColors.text,
          ),
        ),
        value: delivery,
      );
      dropdownItem.add(newItem);
    }
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: const Text(
              'Регион',
              style: TextStyle(
                color: AppColors.noActive,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            value: state.region,
            onChanged: (value) => context.read<ProfileRecipientBloc>().add(
                  ProfileRecipientEvent(
                    region: value,
                  ),
                ),
            items: dropdownItem,
          ),
        ),
      ),
    );
  }

  Widget cityDropdownButton(state, BuildContext context) {
    List<DropdownMenuItem<String>> dropdownItem = [];

    for (String delivery in deliveryList2) {
      var newItem = DropdownMenuItem(
        child: Text(
          delivery,
          style: const TextStyle(
            color: AppColors.text,
          ),
        ),
        value: delivery,
      );
      dropdownItem.add(newItem);
    }
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: const Text(
              'Город',
              style: TextStyle(
                color: AppColors.noActive,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            value: state.city,
            onChanged: (value) => context.read<ProfileRecipientBloc>().add(
                  ProfileRecipientEvent(
                    city: value,
                  ),
                ),
            items: dropdownItem,
          ),
        ),
      ),
    );
  }

  Widget departmentDropdownButton(state, BuildContext context) {
    List<DropdownMenuItem<String>> dropdownItem = [];

    for (String delivery in deliveryList3) {
      var newItem = DropdownMenuItem(
        child: Text(
          delivery,
          style: const TextStyle(
            color: AppColors.text,
          ),
        ),
        value: delivery,
      );
      dropdownItem.add(newItem);
    }
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: const Text(
              'Отделение Новой Почты',
              style: TextStyle(
                color: AppColors.noActive,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            value: state.departmentNP,
            onChanged: (value) => context.read<ProfileRecipientBloc>().add(
                  ProfileRecipientEvent(
                    departmentNP: value,
                  ),
                ),
            items: dropdownItem,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileRecipientBloc, ProfileRecipientState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 380.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFieldInputTextNumber(
                textInputType: TextInputType.text,
                onChanged: (data) => context.read<ProfileRecipientBloc>().add(
                      ProfileRecipientEvent(
                        name: data,
                      ),
                    ),
                hintText: 'Имя',
                widget: const SizedBox.expand(),
              ),
              TextFieldInputTextNumber(
                textInputType: TextInputType.text,
                onChanged: (data) => context.read<ProfileRecipientBloc>().add(
                      ProfileRecipientEvent(
                        surname: data,
                      ),
                    ),
                hintText: 'Фамилия',
                widget: const SizedBox.expand(),
              ),
              TextFieldInputTextNumber(
                textInputType: TextInputType.phone,
                onChanged: (data) => context.read<ProfileRecipientBloc>().add(
                      ProfileRecipientEvent(
                        phoneNumber: data,
                      ),
                    ),
                hintText: 'Номер телефона',
                widget: const SizedBox.expand(),
              ),
              regionDropdownButton(state, context),
              cityDropdownButton(state, context),
              departmentDropdownButton(state, context),
            ],
          ),
        );
      },
    );
  }
}

// class DropdownButtonCustom extends StatelessWidget {
//   DropdownButtonCustom({
//     Key? key,
//     required this.onChanged,
//     required this.value,
//     required this.hint,
//     required this.region,
//   }) : super(key: key);
//   final void Function(String?) onChanged;
//   final String value;
//   final String hint;
//   final List<String> region;
//   List<DropdownMenuItem<String>> dropdownItem = [];
//
//   @override
//   Widget build(BuildContext context) {
//     for (String delivery in region) {
//       var newItem = DropdownMenuItem(
//         child: Text(
//           delivery,
//           style: const TextStyle(
//             color: AppColors.text,
//           ),
//         ),
//         value: delivery,
//       );
//       dropdownItem.add(newItem);
//     }
//     return BlocBuilder<ProfileRecipientBloc, ProfileRecipientState>(
//       builder: (context, state) {
//         return Container(
//           width: double.infinity,
//           height: 50.0,
//           decoration: BoxDecoration(
//               color: Colors.grey.shade100,
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(15.0),
//               )),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 14.0,
//             ),
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<String>(
//                 isExpanded: true,
//                 hint: Text(
//                   hint,
//                   style: const TextStyle(
//                     color: AppColors.noActive,
//                     fontSize: 14.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 value: value,
//                 onChanged: onChanged,
//                 items: dropdownItem,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
