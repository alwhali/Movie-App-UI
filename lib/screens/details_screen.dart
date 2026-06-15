import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app_ui/data/movie.dart';
import 'package:movie_app_ui/utils/colors.dart';
import 'package:movie_app_ui/widget/custom_card_cast.dart';
import 'package:movie_app_ui/widget/custom_card_comment.dart';
import 'package:readmore/readmore.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({super.key, required this.movieModel});
  MovieModel movieModel;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ThemeData themeData = ThemeData(
    primaryColor: kBackgroundColor,
    textTheme: TextTheme(
      headlineLarge: TextStyle(color: Colors.white, fontSize: 28),
      labelLarge: TextStyle(color: Color(0xFF7E7676), fontSize: 18),
      labelMedium: TextStyle(color: Color(0xFF7E7676), fontSize: 16),
    ),

    hintColor: Colors.white30,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          //details screen
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    //the background image
                    Container(
                      height: size.height * 0.60,
                      width: size.width,
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            kBackgroundColor.withValues(alpha: 0.8),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          image: AssetImage(widget.movieModel.imageAsset!),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    // the button to close the screen
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //name of movie and year and rating
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  widget.movieModel.movieName!,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "${widget.movieModel.year!}, Denis Villeneuve ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                // SizedBox(height: 5),
                              ],
                            ),
                          ),

                          Row(
                            children: [
                              Text(
                                widget.movieModel.movieRating!,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(Icons.star, color: Colors.yellow, size: 18),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      //genres of movie
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          buildTag(text: "Epic"),
                          buildTag(text: "Fantasy"),
                          buildTag(text: "Action"),
                          SizedBox(width: 70),
                        ],
                      ),

                      //text description of movie
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                          vertical: 20,
                        ),
                        child: ReadMoreText(
                          '${widget.movieModel.movieName!} is a movie about a group of friends who decide to start a new life together in a small town in the American Southwest. The movie is based on the novel of the same name by author Stephen King. The movie was released on January 15, 2014, and stars an ensemble cast of actors including Matthew McConaughey, Anna Kendrick, and Ben Kingsley. The film was directed by Peter Berg and produced by Michael Bay and Peter Berg. It was distributed by Warner Bros. Pictures. The film received mixed reviews from critics and grossed 100 million worldwide. It was a box office success, grossing 110 million in North America and 40 million in other territories, for a worldwide total of 150 million.   ',
                          trimLines: 3,
                          // trimLength: 300,
                          trimMode: TrimMode.Line,
                          // colorClickableText: Colors.blue,
                          moreStyle: TextStyle(color: kButtonColor),
                          lessStyle: TextStyle(color: kButtonColor),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            // letterSpacing: 1.0,
                            height: 1.7,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Cast",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      widget.movieModel.cast == null
                          ? Align(
                              alignment: AlignmentGeometry.center,
                              child: Text(
                                "There is no cast ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            )
                          : castListBuilder(widget.movieModel.cast!),

                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Trailer",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      Stack(
                        alignment: AlignmentGeometry.center,
                        children: [
                          Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage("assets/trailer.jpeg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          //this is without alignment
                          // Positioned(
                          //   top: 60,
                          //   // bottom: 0,
                          //   left: (size.width - 80) / 2,
                          //   child: IconButton(
                          //     iconSize: 20,
                          //     color: kSearchbarColor,
                          //     style: ButtonStyle(
                          //       backgroundColor: WidgetStatePropertyAll(
                          //         Colors.white,
                          //       ),
                          //     ),
                          //     icon: FaIcon(
                          //       FontAwesomeIcons.play,
                          //       // color: Colors.white,
                          //     ),
                          //     onPressed: () {},
                          //   ),
                          // ),

                          // this is with alignment
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.play,
                              color: kButtonColor.withValues(alpha: 0.8),
                              size: 20,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Comments",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "See all",
                            style: themeData.textTheme.labelMedium,
                          ),
                        ],
                      ),
                      widget.movieModel.comments == null
                          ? Align(
                              alignment: AlignmentGeometry.center,
                              child: Text(
                                "There is no Comments ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            )
                          : commentListBuilder(widget.movieModel.comments!),

                      SizedBox(height: 150),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //close button
          Positioned(
            right: 20,
            // left: 20,
            top: 60,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: FaIcon(
                  FontAwesomeIcons.xmark,
                  color: kSearchbarColor,
                  size: 20,
                ),
              ),
            ),
            // child: IconButton(
            //   // iconSize: 15,
            //   style: ButtonStyle(
            //     iconSize: WidgetStatePropertyAll(15),
            //     backgroundColor: WidgetStatePropertyAll(Colors.white),
            //   ),
            //   color: Colors.white,
            //   icon: FaIcon(
            //     FontAwesomeIcons.xmark,
            //     color: Colors.black,
            //     // size: 15,
            //   ),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
          ),

          //call to action button (play button)
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                alignment: Alignment.center,
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kButtonColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Watch Movie",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget commentListBuilder(List<CommentModel> comments) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      // height: MediaQuery.of(context).size.height * 0.25,
      height: 160,
      child: ListView.builder(
        itemCount: comments.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomCardComment(comment: comments[index]);
        },
      ),
    );
  }

  Widget castListBuilder(List<CastModel> castList) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.25,
      height: 160,
      child: ListView.builder(
        itemCount: castList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomCardCast(cast: castList[index]);
        },
      ),
    );
  }
}

class buildTag extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const buildTag({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

        decoration: BoxDecoration(
          color: kSearchbarColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white30,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
