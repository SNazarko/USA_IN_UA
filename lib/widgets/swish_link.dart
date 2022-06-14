import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class Swish extends StatelessWidget {
  const Swish(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.contour,
      required this.color})
      : super(key: key);
  final String text;
  final bool contour;
  final Color color;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: contour ? color : AppColors.contour,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                ),
                contour
                    ? Positioned(
                        top: 10.0,
                        left: 10.0,
                        child: Container(
                          width: 25.0,
                          height: 25.0,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              text,
              style: TextStyle(
                color: contour ? AppColors.text : AppColors.contour,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
