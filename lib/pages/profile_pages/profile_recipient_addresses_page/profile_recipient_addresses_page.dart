import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/button_enter.dart';
import '../../../widgets/swish_link.dart';
import '../../../widgets/text_field_input_text_number.dart';
import '../profile_google_maps_page/profile_google_maps_page.dart';

class ProfileRecipientAddressesPage extends StatefulWidget {
  ProfileRecipientAddressesPage({Key? key}) : super(key: key);
  static const routeName = '/profile_recipient_addresses_page';

  @override
  State<ProfileRecipientAddressesPage> createState() =>
      _ProfileRecipientAddressesPageState();
}

class _ProfileRecipientAddressesPageState
    extends State<ProfileRecipientAddressesPage> {
  String? addressName;
  String? country;
  String? name;
  String? surname;
  String? phoneNumber;
  String? region;
  String? city;
  String? surnameNewPost;
  String? addressUser;

  bool isSwish = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onChanged: (data) {
                      addressName = data;
                    },
                    textInputType: TextInputType.text,
                    hintText: 'Название адреса (дом, офис и т.п.',
                    widget: const SizedBox.expand(),
                  ),
                  TextFieldInputTextNumber(
                    onChanged: (data) {
                      country = data;
                    },
                    textInputType: TextInputType.text,
                    hintText: 'Страна',
                    widget: const Icon(
                      Icons.arrow_drop_down_outlined,
                      color: AppColors.noActive,
                    ),
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
            isSwish
                ? DepartmentPost(
              surname: surname ?? '',
              name: name ?? '',
              phoneNumber: phoneNumber ?? ''
              ,)
                : AddressDelivery(
                    surname: surname ?? '',
                    phoneNumber: phoneNumber ?? '',
                    name: name ?? '',
                  ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20.0,
                bottom: 10.0,
              ),
              child: ButtonEnter(
                color: AppColors.contour,
                colorText: Colors.white,
                text: 'СОХРАНИТЬ',
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class AddressDelivery extends StatefulWidget {
  const AddressDelivery({
    Key? key,
    required this.name,
    required this.surname,
    required this.phoneNumber,
  }) : super(key: key);
  final String name;
  final String surname;
  final String phoneNumber;
  @override
  State<AddressDelivery> createState() => _AddressDeliveryState();
}

class _AddressDeliveryState extends State<AddressDelivery> {
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

  String? defaultValue;

  String? defaultValue2;

  String? defaultValue3;

  Widget regionDropdownButton() {
    List<DropdownMenuItem<String>> dropdownItem = [];

    for (String delivery in deliveryList) {
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
            value: defaultValue,
            onChanged: (value) {
              setState(() {
                defaultValue = value as String;
              });
            },
            items: dropdownItem,
          ),
        ),
      ),
    );
  }

  Widget cityDropdownButton() {
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
            value: defaultValue2,
            onChanged: (value) {
              setState(() {
                defaultValue2 = value as String;
              });
            },
            items: dropdownItem,
          ),
        ),
      ),
    );
  }

  Widget departmentDropdownButton() {
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
            value: defaultValue3,
            onChanged: (value) {
              setState(() {
                defaultValue3 = value as String;
              });
            },
            items: dropdownItem,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 420.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFieldInputTextNumber(
            onChanged: (data) {
              widget.name;
            },
            hintText: 'Имя',
            widget: const SizedBox.expand(),
          ),
          TextFieldInputTextNumber(
            onChanged: (data) {
              widget.surname;
            },
            hintText: 'Фамилия',
            widget: const SizedBox.expand(),
          ),
          TextFieldInputTextNumber(
            onChanged: (data) {
              widget.phoneNumber;
            },
            hintText: 'Номер телефона',
            widget: const SizedBox.expand(),
          ),
          regionDropdownButton(),
          cityDropdownButton(),
          departmentDropdownButton(),
          Row(
            children: const [
              Expanded(
                child: TextFieldInputTextNumber(
                  hintText: 'Номер дома',
                  widget: SizedBox.expand(),
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: TextFieldInputTextNumber(
                  hintText: 'Номер квартиры',
                  widget: SizedBox.expand(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DepartmentPost extends StatefulWidget {
   DepartmentPost({
    Key? key,
    required this.name,
    required this.surname,
    required this.phoneNumber,
  }) : super(key: key);
  String name;
  String surname;
  String phoneNumber;

  @override
  State<DepartmentPost> createState() => _DepartmentPostState();
}

class _DepartmentPostState extends State<DepartmentPost> {
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
  String? defaultValue;
  String? defaultValue2;
  String? defaultValue3;

  Widget regionDropdownButton() {
    List<DropdownMenuItem<String>> dropdownItem = [];

    for (String delivery in deliveryList) {
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
            value: defaultValue,
            onChanged: (value) {
              setState(() {
                defaultValue = value as String;
              });
            },
            items: dropdownItem,
          ),
        ),
      ),
    );
  }

  Widget cityDropdownButton() {
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
            value: defaultValue2,
            onChanged: (value) {
              setState(() {
                defaultValue2 = value as String;
              });
            },
            items: dropdownItem,
          ),
        ),
      ),
    );
  }

  Widget streetDropdownButton() {
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
            value: defaultValue3,
            onChanged: (value) {
              setState(() {
                defaultValue3 = value as String;
              });
            },
            items: dropdownItem,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 380.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFieldInputTextNumber(
            onChanged: (data) {
              widget.name = data;
            },
            hintText: 'Имя',
            widget: const SizedBox.expand(),
          ),
           TextFieldInputTextNumber(
            onChanged: (data) {
              widget.surname = data;
            },
            hintText: 'Фамилия',
            widget: const SizedBox.expand(),
          ),
           TextFieldInputTextNumber(
            onChanged: (data) {
              widget.phoneNumber = data;
            },
            hintText: 'Номер телефона',
            widget: const SizedBox.expand(),
          ),
          regionDropdownButton(),
          cityDropdownButton(),
          streetDropdownButton(),
        ],
      ),
    );
  }
}
