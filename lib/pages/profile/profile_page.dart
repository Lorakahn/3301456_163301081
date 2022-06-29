import 'package:lorakahnmovietips_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:lorakahnmovietips_app/pages/profile/widget/profile_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: const ProfileBody(),
    );
  }
}
