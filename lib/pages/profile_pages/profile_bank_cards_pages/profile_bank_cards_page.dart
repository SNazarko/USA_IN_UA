import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:usa_in_ua/pages/profile_pages/profile_bank_cards_pages/profile_add_cards_page/profile_add_cards_page.dart';
import 'package:usa_in_ua/resources/app_images.dart';

import '../../../models/card_model.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/icon_link.dart';
import '../../../widgets/swish_link.dart';

class ProfileBankCardsPage extends StatefulWidget {
  ProfileBankCardsPage({Key? key}) : super(key: key);
  static const routeName = '/profile_bank_cards_page';

  @override
  State<ProfileBankCardsPage> createState() => _ProfileBankCardsPageState();
}

class _ProfileBankCardsPageState extends State<ProfileBankCardsPage> {
  List<CardModel> cardList = [];

  Future<void> _setup() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(CardModelAdapter());
    }
    final box = await Hive.openBox<CardModel>('card_box');
    cardList = box.values.toList();
    setState(() {});
    box.listenable().addListener(() {
      cardList = box.values.toList();
      setState(() {});
    });
  }

  @override
  void initState() {
    _setup();
    super.initState();
  }

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
          'Банковские карты',
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
          vertical: 20.0,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  final card = cardList[index];
                  return _CreditCardModel(
                    indexList: index,
                    cardNumber: card.cardNumber,
                    isCard: card.isCard,
                  );
                },
                itemCount: cardList.length,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ProfileAddCardsPage.routeName,
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
            const Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                top: 15.0,
              ),
              child: _AutoDebit(),
            ),
          ],
        ),
      ),
    );
  }
}

class _AutoDebit extends StatefulWidget {
  const _AutoDebit({Key? key}) : super(key: key);

  @override
  State<_AutoDebit> createState() => _AutoDebitState();
}

class _AutoDebitState extends State<_AutoDebit> {
  bool _lights = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          flex: 1,
          child: Text(
            '?',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
              color: AppColors.blue,
            ),
          ),
        ),
        const SizedBox(
          width: 25.0,
        ),
        const Flexible(
            flex: 5,
            child: Text(
              'Автосписывание по умолчанию',
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            )),
        Flexible(
          flex: 3,
          child: ListTile(
            title: const Text('Lights'),
            trailing: CupertinoSwitch(
              value: _lights,
              onChanged: (bool value) {
                setState(() {
                  _lights = value;
                });
              },
            ),
            onTap: () {
              setState(() {
                _lights = !_lights;
              });
            },
          ),
        )
      ],
    );
  }
}

class _CreditCardModel extends StatelessWidget {
  const _CreditCardModel({
    Key? key,
    required this.indexList,
    required this.cardNumber,
    required this.isCard,
  }) : super(key: key);
  final int indexList;
  final String cardNumber;
  final bool isCard;


  String _smallNumber(String cardNumber){
    final firstNumber = cardNumber.substring(0, 7);
    final lastNumber = cardNumber.substring(15, 19);
    return '$firstNumber .... $lastNumber';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Container(
        width: double.infinity,
        height: 83.0,
        decoration: const BoxDecoration(
          color: AppColors.bass,
          borderRadius: BorderRadius.all(
            Radius.circular(
              15.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Row(
            children: [
              Swish(
                colorText: true,
                text: _smallNumber(cardNumber),
                onTap: () {},
                contour: true,
                color: AppColors.blue,
              ),
              const SizedBox(
                width: 30.0,
              ),
              Image.asset(
                isCard ? AppImages.cardVisa : AppImages.cardMaster,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
