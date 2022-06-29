import 'package:flutter/material.dart';
import 'package:lorakahnmovietips_app/constants.dart';
import 'package:lorakahnmovietips_app/pages/login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final messengerKey = GlobalKey<ScaffoldMessengerState>();
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'lorakahn Movie Tips',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messengerKey,
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: LoginPage(),
    );
  }
}
