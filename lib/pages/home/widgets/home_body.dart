import 'package:flutter/material.dart';
import 'package:lorakahnmovietips_app/pages/home/widgets/movies_coming_soon.dart';
import 'package:lorakahnmovietips_app/pages/home/widgets/header_search.dart';
import 'package:lorakahnmovietips_app/pages/home/widgets/movies_on_teather.dart';
import 'package:lorakahnmovietips_app/pages/home/widgets/session_title.dart';
import 'package:lorakahnmovietips_app/constants.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeaderSearch(),
            SessionTitle(title: 'Sinemalarda'),
            MoviesOnTeather(),
            SessionTitle(title: 'Yakında'),
            MoviesComingSoon(),
          ],
        ),
      ),
    );
  }
}
