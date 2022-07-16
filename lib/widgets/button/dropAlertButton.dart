
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../pages/profile_pages/profile_recipient_page/profile_recipient_add_page/profile_recipient_add_page.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_icons.dart';

class DropAlertButton extends StatefulWidget {
  const DropAlertButton(
      {Key? key,
        required this.list,
        required this.defaultValue,
        this.onTap,
        required this.editValue})
      : super(key: key);
  final List list;
  final String defaultValue;
  final String editValue;
  final void Function(String data)? onTap;
  @override
  State<DropAlertButton> createState() => _DropAlertButtonState();
}

class _DropAlertButtonState extends State<DropAlertButton> {
  String? value;

  @override
  void initState() {
    if (widget.editValue != '') {
      value = widget.editValue;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.list.contains(value) && widget.editValue == '') {
      value = null;
    }
    return InkWell(
      onTap: () async {
        value = await showDialog<String>(
          context: context,
          builder: (context) => AlertDialogCustom(
            list: widget.list,
          ),
        );
        widget.onTap!(value ?? '');
        setState(() {});
      },
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 10,
                  child: Text(
                    value ?? widget.defaultValue,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight:
                      value == null ? FontWeight.w700 : FontWeight.w400,
                      color:
                      value == null ? AppColors.noActive : AppColors.text,
                    ),
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: SvgPicture.asset(
                      AppIcons.arrowDown,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class AlertDialogCustom extends StatelessWidget {
  const AlertDialogCustom({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List list;

  double heightAlert (List list){
    if(list.length <= 6) return 200.0;
    return 400.0;
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: 300,
            height: heightAlert(list),
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: InkWell(
                      onTap: () async {
                        final data = await list[index];
                        Navigator.pop(context, data);
                      },
                      child: Text(
                        '${list[index]}',
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}

