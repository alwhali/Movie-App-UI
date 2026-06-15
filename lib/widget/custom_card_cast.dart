import 'package:flutter/material.dart';
import 'package:movie_app_ui/data/movie.dart';

//this is card for poular movies
// ignore: must_be_immutable
class CustomCardCast extends StatelessWidget {
  CastModel cast;
  CustomCardCast({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 100,
      child: Column(
        children: [
          Container(
            height: 100,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: AssetImage(cast.image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            cast.name!,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white38,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
