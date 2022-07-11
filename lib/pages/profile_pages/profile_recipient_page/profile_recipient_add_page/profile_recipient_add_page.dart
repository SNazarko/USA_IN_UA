import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../database/files_db.dart';
import '../../../../models/recipient_model.dart';
import '../../../../repositories/located_repositories.dart';
import '../../../../repositories/recipient_repositories.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_icons.dart';
import '../../../../widgets/button_enter.dart';
import '../../../../widgets/swish_link.dart';
import '../../../../widgets/text_field_input_text_number.dart';
import '../../profile_google_maps_page/profile_google_maps_page.dart';
import '../blocs/bloc_city/city_bloc.dart';
import '../blocs/bloc_data/profile_recipient_bloc.dart';
import '../blocs/bloc_data/profile_recipient_event.dart';
import '../blocs/bloc_list_form/list_form_bloc.dart';
import '../blocs/bloc_new_post/new_post_bloc.dart';
import '../blocs/bloc_region/region_bloc.dart';

class ProfileRecipientAddressesPageArguments {
  ProfileRecipientAddressesPageArguments(
    this.region,
    this.city,
    this.street,
    this.name,
    this.surname,
    this.phoneNumber,
    this.departmentNP,
    this.addressName,
    this.country,
    this.flatNumber,
    this.houseNumber,
    this.isCard,
    this.userCard,
  );
  final String region;
  final String city;
  final String street;
  final String name;
  final String surname;
  final String phoneNumber;
  final String departmentNP;
  final String addressName;
  final String country;
  final String flatNumber;
  final String houseNumber;
  final bool isCard;
  final bool userCard;
}

class ProfileRecipientAddressesPage extends StatefulWidget {
  const ProfileRecipientAddressesPage({
    Key? key,
    required this.region,
    required this.city,
    required this.street,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.departmentNP,
    required this.addressName,
    required this.country,
    required this.flatNumber,
    required this.houseNumber,
    required this.isCard,
    required this.userCard,
  }) : super(key: key);
  static const routeName = '/profile_recipient_add_page';
  final String region;
  final String city;
  final String street;
  final String name;
  final String surname;
  final String phoneNumber;
  final String departmentNP;
  final String addressName;
  final String country;
  final String flatNumber;
  final String houseNumber;
  final bool isCard;
  final bool userCard;

  @override
  State<ProfileRecipientAddressesPage> createState() =>
      _ProfileRecipientAddressesPageState();
}

class _ProfileRecipientAddressesPageState
    extends State<ProfileRecipientAddressesPage> {
  final TextEditingController addressNameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController houseNumberController = TextEditingController();
  final TextEditingController flatNumberController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  late bool isSwish = true;
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    addressNameController.text = widget.addressName;
    countryController.text = widget.country;
    nameController.text = widget.name;
    surnameController.text = widget.surname;
    phoneNumberController.text = widget.phoneNumber;
    houseNumberController.text = widget.houseNumber;
    flatNumberController.text = widget.flatNumber;
    streetController.text = widget.street;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileRecipientBloc>(
          create: (context) => ProfileRecipientBloc(),
        ),
        BlocProvider<ListFormBloc>(
          create: (context) => ListFormBloc(),
        ),
        BlocProvider<RegionBloc>(
          create: (context) => RegionBloc()
            ..add(
              LoadRegionEvent(),
            ),
        ),
        BlocProvider<CityBloc>(
          create: (context) => CityBloc(),
        ),
        BlocProvider<NewPostBloc>(
          create: (context) => NewPostBloc(),
        ),
      ],
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
              Header(
                addressNameController: addressNameController,
                countryController: countryController,
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
                        RecipientRepositories.instance
                            .doneAddress(addressNameController.text, isSwish);
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
                        RecipientRepositories.instance
                            .doneAddress(addressNameController.text, isSwish);
                        isSwish = !isSwish;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              isSwish
                  ? DepartmentPost(
                      phoneNumberController: phoneNumberController,
                      surnameController: surnameController,
                      nameController: nameController,
                      region: widget.region,
                      city: widget.city,
                      departmentNP: widget.departmentNP,
                    )
                  : AddressDelivery(
                      phoneNumberController: phoneNumberController,
                      houseNumberController: houseNumberController,
                      flatNumberController: flatNumberController,
                      surnameController: surnameController,
                      streetController: streetController,
                      nameController: nameController,
                      city: widget.city,
                      region: widget.region,
                    ),
              SaveButton(
                isSwish: isSwish,
                fToast: fToast,
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.addressNameController,
    required this.countryController,
  }) : super(key: key);
  final TextEditingController addressNameController;
  final TextEditingController countryController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            controller: addressNameController,
            onEditingComplete: () {
              FocusScope.of(context).nextFocus();
            },
            onChanged: (data) => context.read<ProfileRecipientBloc>().add(
                  ProfileRecipientEvent(
                    addressName: data,
                  ),
                ),
            textInputType: TextInputType.text,
            hintText: 'Название адреса (дом, офис и т.п.',
            widget: const SizedBox.expand(),
          ),
          TextFieldInputTextNumber(
            controller: countryController,
            onEditingComplete: () {
              FocusScope.of(context).nextFocus();
            },
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
    );
  }
}

class AddressDelivery extends StatelessWidget {
  const AddressDelivery({
    Key? key,
    required this.nameController,
    required this.surnameController,
    required this.phoneNumberController,
    required this.houseNumberController,
    required this.flatNumberController,
    required this.streetController,
    required this.region,
    required this.city,
  }) : super(key: key);
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController phoneNumberController;
  final TextEditingController houseNumberController;
  final TextEditingController flatNumberController;
  final TextEditingController streetController;
  final String region;
  final String city;

  Widget regionDropdownButton(state, stateRegion, BuildContext context) {
    List<DropdownMenuItem<String>> dropdownItem = [];

    for (String delivery in stateRegion.region) {
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
              context.read<CityBloc>().add(
                    LoadCityEvent(
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

  Widget cityDropdownButton(state, stateCity, BuildContext context) {
    List<DropdownMenuItem<String>> dropdownItem = [];

    for (String delivery in stateCity.city) {
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (_, stateCity) {
        return BlocBuilder<RegionBloc, RegionState>(
          builder: (_, stateRegion) {
            return BlocBuilder<ProfileRecipientBloc, ProfileRecipientState>(
              builder: (context, state) {
                region != ''
                    ? context
                        .read<ProfileRecipientBloc>()
                        .add(ProfileRecipientEvent(
                          region: region,
                        ))
                    : context
                        .read<ProfileRecipientBloc>()
                        .add(const ProfileRecipientEvent(
                          region: null,
                        ));

                city != ''
                    ? context
                        .read<ProfileRecipientBloc>()
                        .add(ProfileRecipientEvent(
                          city: city,
                        ))
                    : context
                        .read<ProfileRecipientBloc>()
                        .add(const ProfileRecipientEvent(
                          city: null,
                        ));

                return SizedBox(
                  width: double.infinity,
                  height: 420.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFieldInputTextNumber(
                        controller: nameController,
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
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
                        controller: surnameController,
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
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
                        controller: phoneNumberController,
                        inputFormatters: [
                          MaskedInputFormatter('+## (###) ### ## ##'),
                        ],
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
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
                      regionDropdownButton(state, stateRegion, context),
                      cityDropdownButton(state, stateCity, context),
                      TextFieldInputTextNumber(
                        controller: streetController,
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                        textInputType: TextInputType.text,
                        onChanged: (data) =>
                            context.read<ProfileRecipientBloc>().add(
                                  ProfileRecipientEvent(
                                    street: data,
                                  ),
                                ),
                        hintText: 'Улица',
                        widget: const SizedBox.expand(),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFieldInputTextNumber(
                              controller: houseNumberController,
                              onEditingComplete: () {
                                FocusScope.of(context).nextFocus();
                              },
                              onChanged: (data) =>
                                  context.read<ProfileRecipientBloc>().add(
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
                              controller: flatNumberController,
                              onEditingComplete: () {
                                FocusScope.of(context).nextFocus();
                              },
                              onChanged: (data) =>
                                  context.read<ProfileRecipientBloc>().add(
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
          },
        );
      },
    );
  }
}

class DepartmentPost extends StatelessWidget {
  DepartmentPost({
    Key? key,
    required this.nameController,
    required this.surnameController,
    required this.phoneNumberController,
    required this.region,
    required this.city,
    required this.departmentNP,
  }) : super(key: key);
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController phoneNumberController;
  final String region;
  final String city;
  final String departmentNP;



  Widget regionDropdownButton(state, stateRegion, BuildContext context) {
    List<DropdownMenuItem<String>> dropdownItem = [];

    for (String delivery in stateRegion.region ?? []) {
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
              context.read<CityBloc>().add(
                LoadCityEvent(
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

  Widget cityDropdownButton(state, stateCity, BuildContext context) {
    List<DropdownMenuItem<String>> dropdownItem = [];

    for (String delivery in stateCity.city ?? []) {
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
              context.read<NewPostBloc>().add(
                    LoadNewPostEvent(
                      department: value,
                    ),
                  );
            },
            items: dropdownItem,
          ),
        ),
      ),
    );
  }

  Widget departmentDropdownButton(state, stateNewPost, BuildContext context) {
    List<DropdownMenuItem<String>> dropdownItem = [];

    for (String delivery in stateNewPost.department ?? []) {
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
    return BlocBuilder<NewPostBloc, NewPostState>(
      builder: (context, stateNewPost) {
        return BlocBuilder<CityBloc, CityState>(
          builder: (_, stateCity) {
            return BlocBuilder<RegionBloc, RegionState>(
              builder: (_, stateRegion) {
                return BlocBuilder<ProfileRecipientBloc, ProfileRecipientState>(
                  builder: (context, state) {
                    print(state.region);

                    region != ''
                        ? context
                            .read<ProfileRecipientBloc>()
                            .add(ProfileRecipientEvent(
                              region: region,
                            ))
                        : context
                            .read<ProfileRecipientBloc>()
                            .add(const ProfileRecipientEvent(
                              region: null,
                            ));

                    city != ''
                        ? context
                            .read<ProfileRecipientBloc>()
                            .add(ProfileRecipientEvent(
                              city: city,
                            ))
                        : context
                            .read<ProfileRecipientBloc>()
                            .add(const ProfileRecipientEvent(
                              city: null,
                            ));

                    departmentNP != ''
                        ? context
                            .read<ProfileRecipientBloc>()
                            .add(ProfileRecipientEvent(
                              departmentNP: departmentNP,
                            ))
                        : context
                            .read<ProfileRecipientBloc>()
                            .add(const ProfileRecipientEvent(
                              departmentNP: null,
                            ));
                    return SizedBox(
                      width: double.infinity,
                      height: 380.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          // DropdownButtonCustom(),


                          TextFieldInputTextNumber(
                            controller: nameController,
                            onEditingComplete: () {
                              FocusScope.of(context).nextFocus();
                            },
                            textInputType: TextInputType.text,
                            onChanged: (data) =>
                                context.read<ProfileRecipientBloc>().add(
                                      ProfileRecipientEvent(
                                        name: data,
                                      ),
                                    ),
                            hintText: 'Имя',
                            widget: const SizedBox.expand(),
                          ),
                          TextFieldInputTextNumber(
                            controller: surnameController,
                            onEditingComplete: () {
                              FocusScope.of(context).nextFocus();
                            },
                            textInputType: TextInputType.text,
                            onChanged: (data) =>
                                context.read<ProfileRecipientBloc>().add(
                                      ProfileRecipientEvent(
                                        surname: data,
                                      ),
                                    ),
                            hintText: 'Фамилия',
                            widget: const SizedBox.expand(),
                          ),
                          TextFieldInputTextNumber(
                            controller: phoneNumberController,
                            inputFormatters: [
                              MaskedInputFormatter('+## (###) ### ## ##'),
                            ],
                            onEditingComplete: () {
                              FocusScope.of(context).nextFocus();
                            },
                            textInputType: TextInputType.phone,
                            onChanged: (data) =>
                                context.read<ProfileRecipientBloc>().add(
                                      ProfileRecipientEvent(
                                        phoneNumber: data,
                                      ),
                                    ),
                            hintText: 'Номер телефона',
                            widget: const SizedBox.expand(),
                          ),
                          regionDropdownButton(state,  stateRegion, context),
                          cityDropdownButton(state, stateCity, context),
                          departmentDropdownButton(
                              state, stateNewPost, context),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key? key,
    required this.isSwish,
    required this.fToast,
  }) : super(key: key);
  final FToast fToast;
  final bool isSwish;
  bool _isUsedCard(isGet) {
    if (isGet == null) return true;
    return false;
  }

  Widget toast(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: AppColors.green,
      ),
      child: Text(text),
    );
  }

  bool _saveLogic(state) {
    final bool isConst = state.addressName != null &&
        state.addressName?.isNotEmpty &&
        state.country != null &&
        state.country!.isNotEmpty &&
        state.name != null &&
        state.name!.isNotEmpty &&
        state.surname != null &&
        state.surname!.isNotEmpty &&
        state.phoneNumber != null &&
        state.phoneNumber!.isNotEmpty &&
        state.region != null &&
        state.region!.isNotEmpty &&
        state.city != null &&
        state.city!.isNotEmpty;

    final bool isValue =
        (state.departmentNP != null && state.departmentNP!.isNotEmpty) ||
            (state.addressName != null && state.addressName!.isNotEmpty);
    if (isConst && isValue) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileRecipientBloc, ProfileRecipientState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 10.0,
          ),
          child: ButtonEnter(
            onPressed: () async {
              if (_saveLogic(state)) {
                final Future<List<RecipientModel>>? isGet =
                    await RecipientRepositories.instance.getRecipient();
                isGet?.then((value) {
                  RecipientRepositories.instance.add(
                    state.region ?? '',
                    state.city ?? '',
                    state.street ?? '',
                    state.name ?? '',
                    state.surname ?? '',
                    state.phoneNumber ?? '',
                    state.departmentNP ?? '',
                    state.addressName ?? '',
                    state.flatNumber ?? '',
                    state.houseNumber ?? '',
                    state.country ?? '',
                    isSwish,
                    _isUsedCard(value),
                  );
                });
                context.read<ListFormBloc>().add(LoadListFormEvent());
                Navigator.pop(context);
              } else {
                fToast.showToast(
                  child: toast('Нужно заполнить поля ...'),
                  gravity: ToastGravity.TOP,
                  toastDuration: const Duration(seconds: 2),
                );
              }
            },
            color: _saveLogic(state) ? AppColors.green : AppColors.contour,
            colorText: Colors.white,
            text: 'СОХРАНИТЬ',
          ),
        );
      },
    );
  }
}
class DropdownButtonCustom extends StatelessWidget {
  const DropdownButtonCustom({
    Key? key,
    // required this.onChanged,
    // required this.value,
    // required this.hint,
    // required this.region,
  }) : super(key: key);
  // final void Function(String?) onChanged;
  // final String value;
  // final String hint;
  // final List<String> region;


  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),),

      ),
      Container(
        width:100,
        height: 10.0,
        color: Colors.amberAccent,
      )

    ],);

  }
}
