import 'package:flutter/material.dart';
import 'package:lorakahnmovietips_app/models/movie.dart';
import 'package:lorakahnmovietips_app/pages/details/widgets/comments.dart';
import 'package:lorakahnmovietips_app/pages/details/widgets/image_and_icons.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageAndIcons(movie: movie),
          const Comments(),
        ],
      ),
    );
  }
}
