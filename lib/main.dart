import 'package:flutter/material.dart';
import 'package:usa_in_ua/pages/authorisations_pages/login_page/login_page.dart';
import 'package:usa_in_ua/pages/authorisations_pages/registration_page/registration_page.dart';
import 'package:usa_in_ua/resources/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.light(),
      home: RegistrationPage(),
    );
  }
}
