import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PurchasePage extends StatelessWidget {
  const PurchasePage({Key? key}) : super(key: key);
  static const routeName = '/purchase_page';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text('PurchasePage'),
      ),
    );
  }
}
