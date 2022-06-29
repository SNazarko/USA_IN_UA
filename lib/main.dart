import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:usa_in_ua/pages/authorisations_pages/authorisation_page/authorisations_page.dart';
import 'package:usa_in_ua/resources/app_themes.dart';
import 'package:usa_in_ua/routes/app_router.dart';

import 'database/local_database.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalDB.instance.initializeHive();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.light(),
      initialRoute: AuthorisationsPages.routeName,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
