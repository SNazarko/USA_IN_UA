import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      iconPath: AppIcons.addUser,
    ),
    _BottomNavigationBarItem(
      iconPath: AppIcons.delivery,
    ),
    _BottomNavigationBarItem(
      iconPath: AppIcons.profile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          color: Colors.transparent,
          width: size.width,
          height: 80,
          child: Stack(
            children: [
              CustomPaint(
                size: Size(size.width, 80),
                painter: PainterNavBar(),
              ),
              Row(
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
                                e.iconPath,
                                color: i == currentTab
                                    ? AppColors.text
                                    : AppColors.noActive,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PainterNavBar extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey
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

    // canvas.drawShadow(path, Colors.grey, 2, true);
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
