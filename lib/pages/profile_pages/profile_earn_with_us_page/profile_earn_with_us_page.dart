import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:usa_in_ua/resources/app_images.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/button/alert_dialog.dart';

class ProfileEarnWithUsPage extends StatelessWidget {
  const ProfileEarnWithUsPage({Key? key}) : super(key: key);
  static const routeName = '/profile_earn_with_us_page';

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
            'Зарабатывайте с нами',
            style: TextStyle(
              color: AppColors.text,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _Link(
                onTap: ()=> AlertDialogApp.instance.alertDialog(
                  context,
                  'Расширенная партнерская программа',
                  'Для получения бонуса отправьте индивидуальную ссылку Вашему другу. После того, как его заказ  будет доставлен, на Ваш баланси баланс Вашего  друга будут начислены по 50 грн. ',
                    _RefLink(),
                ),
                title: 'Реферальная программа',
                  image: Image.asset(AppImages.manyBoy),),
              _Link(
                onTap: ()=> AlertDialogApp.instance.alertDialog(
                    context,
                    'Расширенная партнерская программа',
                    'Если Вы блоггер или у Вас  есть популярный сайт или другие источники трафика, Вы можете  получать доход, рекламируя наш сервис.',
                    Image.asset(AppImages.walletRafiki2,
                      width: 300.0,
                    ),
                ),
                title: 'Расширенная партнерская программа',),
              _Link(
                onTap: ()=> AlertDialogApp.instance.alertDialog(
                    context,
                    '200 грн за распаковку',
                    'Запишите видеоролик или сделайте фото распаковки, выложите его на youtube и в нашей группе Facebook.',
                    Padding(
                      padding: const EdgeInsets.only(right: 60.0,),
                      child: Image.asset(AppImages.surprise,
                      width: 200,
                      ),
                    ),
                ),
                title: '200 грн за распаковку',),
              _Link(
                onTap: ()=> AlertDialogApp.instance.alertDialog(
                    context,
                    'Кешбэк',
                    'Мы  запустили  первый в  Украине  кешбэк для  доставки товаров  из  США  и Европы. Покупать за рубежом стало еще выгоднее и приятнее!',
                    Image.asset(AppImages.walletRafiki,
                      width: 200,
                    ),
                ),
                title: 'Кешбэк',),
              _Link(
                onTap: ()=> AlertDialogApp.instance.alertDialog(
                    context,
                    'Фулфилмент',
                    'Вы концентрируетесь на самом важном —  привлечении клиентов и заказов, а мы берем на себя рутину, которую за 7 лет выучили до мелочей, доставив более 1 млн. товаров.',
                    const SizedBox(
                      height: 50.0,
                    ),
                ),
                title: 'Фулфилмент',),

            ],
          ),
        ),
      );
  }
}


class _RefLink extends StatefulWidget {
  const _RefLink({Key? key}) : super(key: key);

  @override
  State<_RefLink> createState() => _RefLinkState();
}

class _RefLinkState extends State<_RefLink> {
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  Widget toast(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: AppColors.green,
      ),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 45.0,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(25.0),
          ),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(
              flex: 10,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('https://www.figma.com/file/hU39NrYC/jt15usZNQ/1LNF2/USAINUA?no/de-id=475%3A284',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis
                  ),),
              ),),
            Flexible(
                flex: 6,
                child: InkWell(
                  onTap: () =>
                    Clipboard.setData(const ClipboardData(text: 'https://www.figma.com/file/hU39NrYC/jt15usZNQ/1LNF2/USAINUA?no/de-id=475%3A284'))
                        .then((_) {
                      fToast.showToast(
                        child: toast('Реферальная ссидка скопирована'),
                        gravity: ToastGravity.BOTTOM,
                        toastDuration: const Duration(seconds: 2),
                      );
                    }),

                  child: Container(
                    width: 130.0,
                    height: 40.0,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),),
                    child: const Center(
                      child: Text('СКОПИРОВАТЬ',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700
                        ),),
                    ),
                  ),
                )),
          ],)
    );
  }
}


class _Link extends StatelessWidget {
  const _Link({Key? key, this.onTap, required this.title, this.image}) : super(key: key);
final void Function()? onTap;
final String title;
final Widget? image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 85.0,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Row(children: [
          Flexible(flex: 3,
            child: image ?? const SizedBox(width: 125.0,),),
           Flexible(flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,),
              child: Text(title,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                ),),
            ) ,),
        ],),

      ),
    );
  }
}
