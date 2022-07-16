import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/blocs/bloc_anim/anim_bloc.dart';
import 'package:usa_in_ua/resources/app_images.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_icons.dart';


class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar(
      {Key? key, required this.currentTab, required this.onSelect})
      : super(key: key);
  final int currentTab;
  final void Function(int) onSelect;

  static const List<_BottomNavigationBarItem> _items = [
    _BottomNavigationBarItem(
      iconPath: AppIcons.home,
    ),
    _BottomNavigationBarItem(
      iconPath: AppIcons.purchase,
    ),
    _BottomNavigationBarItem(
      iconPath: AppIcons.empty,
    ),
    _BottomNavigationBarItem(
      iconPath: AppIcons.delivery,
    ),
    _BottomNavigationBarItem(
      iconPath: AppIcons.profile,
    ),
  ];

  String path(String path, int i) {
    if (path == AppIcons.home) {
      if (i == currentTab) {
        return AppIcons.homeActive;
      } else {
        return AppIcons.home;
      }
    }
    if (path == AppIcons.purchase) {
      if (i == currentTab) {
        return AppIcons.bagActive;
      } else {
        return AppIcons.purchase;
      }
    }
    if (path == AppIcons.delivery) {
      if (i == currentTab) {
        return AppIcons.boxActive;
      } else {
        return AppIcons.delivery;
      }
    }
    if (path == AppIcons.profile) {
      if (i == currentTab) {
        return AppIcons.profileActive;
      } else {
        return AppIcons.profile;
      }
    }
    return AppIcons.empty;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocBuilder<AnimBloc, AnimState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            color: Colors.transparent,
            width: size.width,
            height: 70,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    child: CustomPaint(
                      size: Size(size.width - 10, kBottomNavigationBarHeight),
                      painter: PainterNavBar(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: state.anim > 0.5
                              ? AppColors.text
                              : AppColors.green,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 13,
                        left: 13,
                        child: SizedBox(
                          width: 35.0,
                          height: 35.0,
                          child: Transform.rotate(
                            angle: (45 * pi / 180) * state.anim,
                            child: SvgPicture.asset(
                              AppIcons.plus,
                              color: state.anim > 0.5
                                  ? Colors.white
                                  : AppColors.text,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _items.map((e) {
                      final int i = _items.indexOf(e);

                      return Flexible(
                        child: SizedBox(
                          width: double.infinity,
                          height: kBottomNavigationBarHeight,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => onSelect(i),
                              highlightColor: Colors.transparent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    path(
                                      e.iconPath,
                                      i,
                                    ),
                                    color: AppColors.text,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PainterNavBar extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey.shade100
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);

    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.grey, 2, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _BottomNavigationBarItem {
  const _BottomNavigationBarItem({
    required this.iconPath,
  });

  final String iconPath;
}
