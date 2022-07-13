import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';
import 'finish_screen.dart';

class BackAndForthButton extends StatefulWidget {
  const BackAndForthButton({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final PageController controller;


  @override
  State<BackAndForthButton> createState() => _BackAndForthButtonState();
}

class _BackAndForthButtonState extends State<BackAndForthButton> {
   int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                _counter--;
                if(_counter < 0) _counter =0;
                widget.controller.previousPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn);
                setState((){});

              },
              child: Text('Назад'),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                width: 25.0,
                height: 5,
                decoration: BoxDecoration(
                  color: _counter == 0 ? AppColors.blue : Colors.transparent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              Container(
                width: 25.0,
                height: 5,
                decoration: BoxDecoration(
                  color: _counter == 1 ? AppColors.blue : Colors.transparent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              Container(
                width: 25.0,
                height: 5,
                decoration: BoxDecoration(
                  color: _counter == 2 ? AppColors.blue : Colors.transparent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              Container(
                width: 25.0,
                height: 5,
                decoration: BoxDecoration(
                  color: _counter == 3 ? AppColors.blue : Colors.transparent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ]),
            TextButton(
              onPressed: () {
                if(_counter == 3){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return  const FinishScreen();
                  }));

                }
                _counter++;
                if(_counter > 3) _counter =3;
                widget.controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn);
                setState((){});
              },
              child: Text('Далее'),
            ),
          ],
        ),
      ),
    );
  }
}


