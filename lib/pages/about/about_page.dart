import 'package:lorakahnmovietips_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:lorakahnmovietips_app/pages/about/widget/about_body.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: const AboutBody(),
    );
  }
}
