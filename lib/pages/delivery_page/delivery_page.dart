import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({Key? key}) : super(key: key);
  static const routeName = '/delivery_page';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: const Center(
        child: Text('DeliveryPage'),
      ),
    );
  }
}
