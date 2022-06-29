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
              height: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Добавьте новый адрес для доставки и используйте его по умолчанию.',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextFieldInputTextNumber(
                    hintText: 'Название адреса (дом, офис и т.п.',
                    widget: SizedBox.expand(),
                  ),
                  TextFieldInputTextNumber(
                    hintText: 'Страна',
                    widget: Icon(
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
            isSwish ? DepartmentPost() : AddressDelivery(),
          ],
        )),
      ),
    );
  }
}

class AddressDelivery extends StatelessWidget {
  const AddressDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 440.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextFieldInputTextNumber(
            hintText: 'Имя',
            widget: SizedBox.expand(),
          ),
          const TextFieldInputTextNumber(
            hintText: 'Фамилия',
            widget: SizedBox.expand(),
          ),
          const TextFieldInputTextNumber(
            hintText: 'Номер телефона',
            widget: SizedBox.expand(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
            ),
            child: ButtonEnter(
              onPressed: () => Navigator.pushNamed(context, ProfileGoogleMapsPage.routeName,),
              color: AppColors.green,
              colorText: Colors.white,
              text: 'ВЫБРАТЬ АДРЕС НА КАРТЕ',
            ),
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
      ),
    );
    ;
  }
}

class DepartmentPost extends StatefulWidget {
  const DepartmentPost({Key? key}) : super(key: key);

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
      height: 440.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextFieldInputTextNumber(
            hintText: 'Имя',
            widget: SizedBox.expand(),
          ),
          const TextFieldInputTextNumber(
            hintText: 'Фамилия',
            widget: SizedBox.expand(),
          ),
          const TextFieldInputTextNumber(
            hintText: 'Номер телефона',
            widget: SizedBox.expand(),
          ),
          regionDropdownButton(),
          cityDropdownButton(),
          departmentDropdownButton(),
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
      ),
    );
  }
}
