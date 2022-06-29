import 'package:lorakahnmovietips_app/pages/details/details_page.dart';
import 'package:flutter/material.dart';
import 'package:lorakahnmovietips_app/pages/home/widgets/movie_card.dart';
import 'package:lorakahnmovietips_app/repository/movies_repository.dart';

class MoviesComingSoon extends StatelessWidget {
  const MoviesComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < MoviesRepository().moviesComingSoon.length; i++)
            MovieCard(
                image: MoviesRepository().moviesComingSoon[i].img,
                title: MoviesRepository().moviesComingSoon[i].name,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailsPage(
                        movie: MoviesRepository().moviesComingSoon[i],
                      ),
                    ),
                  );
                }),
        ],
      ),
    );
  }
}
