import 'package:flutter/material.dart';
import 'package:movie_app_ui/data/movie.dart';

//this is card for poular movies
// ignore: must_be_immutable
class GenresCard extends StatelessWidget {
  MovieModel movieModel;
  GenresCard({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 170,
          width: 250,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
              image: AssetImage(movieModel.imageAsset!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 15,

          left: 15,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 5),

              Text(
                movieModel.movieName!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
            ],
          ),
        ),
      ],
    );
  }
}
