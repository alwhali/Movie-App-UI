import 'package:flutter/material.dart';
import 'package:movie_app_ui/data/movie.dart';
import 'package:movie_app_ui/screens/details_screen.dart';

//this is card for poular movies
// ignore: must_be_immutable
class CustomCardNormal extends StatelessWidget {
  MovieModel movieModel;
  CustomCardNormal({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsScreen(movieModel: movieModel),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 200,
            width: 140,
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

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieModel.movieName!,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        movieModel.year!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white54,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                SizedBox(width: 20),

                Row(
                  children: [
                    Text(
                      movieModel.movieRating!,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.star, color: Colors.yellow, size: 15),
                  ],
                ),
                SizedBox(width: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
