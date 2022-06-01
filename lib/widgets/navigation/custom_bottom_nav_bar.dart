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
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: kBottomNavigationBarHeight,
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewPadding.bottom / 2,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: AppColors.text.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _items.map((e) {
          final int i = _items.indexOf(e);

          return Flexible(
            child: SizedBox(
              width: double.infinity,
              height: kBottomNavigationBarHeight,
              child: Material(
                color: Colors.white,
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
    );
  }
}

class _BottomNavigationBarItem {
  const _BottomNavigationBarItem({
    required this.iconPath,
  });

  final String iconPath;
}
