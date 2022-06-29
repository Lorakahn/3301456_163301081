import 'package:lorakahnmovietips_app/pages/details/widgets/details_body.dart';
import 'package:flutter/material.dart';
import 'package:lorakahnmovietips_app/models/movie.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsBody(movie: movie),
    );
  }
}
