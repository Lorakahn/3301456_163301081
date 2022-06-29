import 'package:flutter/material.dart';
import 'package:lorakahnmovietips_app/pages/details/details_page.dart';
import 'package:lorakahnmovietips_app/pages/home/widgets/movie_card.dart';
import 'package:lorakahnmovietips_app/repository/movies_repository.dart';

class MoviesOnTeather extends StatelessWidget {
  const MoviesOnTeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        for (var i = 0; i < MoviesRepository().moviesOnTeather.length; i++)
          MovieCard(
            image: MoviesRepository().moviesOnTeather[i].img,
            title: MoviesRepository().moviesOnTeather[i].name,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailsPage(
                    movie: MoviesRepository().moviesOnTeather[i],
                  ),
                ),
              );
            },
          )
      ]),
    );
  }
}
