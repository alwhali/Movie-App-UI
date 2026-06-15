import 'package:flutter/material.dart';
import 'package:movie_app_ui/data/movie.dart';
import 'package:movie_app_ui/utils/colors.dart';

class CustomCardComment extends StatelessWidget {
  CustomCardComment({super.key, required this.comment});
  CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 160,
      width: 280,
      margin: EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: kSearchbarColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //image
                  CircleAvatar(
                    backgroundImage: AssetImage(comment.imageUrl!),
                    radius: 22,
                  ),
                  SizedBox(width: 20),
                  //name and date
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        comment.name!,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        comment.date!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white54,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),

                  // SizedBox(width: 20),
                ],
              ),

              //rating and star
              Row(
                children: [
                  Text(
                    comment.rating!,
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
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              comment.comment!,
              maxLines: 3,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
