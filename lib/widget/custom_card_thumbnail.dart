import 'package:flutter/material.dart';
import 'package:movie_app_ui/utils/colors.dart';

class CustomCardThumbnail extends StatelessWidget {
  String imagePath;
  CustomCardThumbnail({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 30),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kButtonColor.withOpacity(0.25),
            blurRadius: 5,
            spreadRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}
