import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/resources/app_colors.dart';

import '../../../../resources/app_icons.dart';

class DeliveryGoods extends StatelessWidget {
  const DeliveryGoods({
    Key? key,
    required this.link,
    required this.statusGoods,
    required this.quality,
    required this.additionalServices,
    required this.details,
  }) : super(key: key);
  final String link;
  final List statusGoods;
  final String quality;
  final String additionalServices;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 5.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.bass),
                color: AppColors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 4,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.bass,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            width: 60.0,
                            height: 60.0,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgPicture.asset(
                                AppIcons.purchase,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text(
                                  statusGoods.last,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  link,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                     _Link(
                      title: 'Количество:',
                      value: '$quality шт',
                    ),
                     _Link(
                      title: 'Доп. услуги:',
                      value:
                         additionalServices,
                    ),
                    const _Link(
                      title: 'Трек номер:',
                      value: '9400116901639555951023',
                      color: AppColors.blue,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 15.0,
                        ),
                        child: Text(
                          'Комментарий к товару',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.bass,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          details,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.text,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Link extends StatelessWidget {
  const _Link({
    Key? key,
    required this.title,
    required this.value,
    this.color,
  }) : super(key: key);
  final String title;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Flexible(
            flex: 5,
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                color: color ?? AppColors.text,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
