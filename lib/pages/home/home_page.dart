import 'package:lorakahnmovietips_app/pages/home/widgets/app_drawer.dart';
import 'package:lorakahnmovietips_app/pages/home/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:lorakahnmovietips_app/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'lorakahn Movie Tips',
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/icons/logo.png',
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: kSecondaryColor,
      ),
      body: const HomeBody(),
    );
  }
}
