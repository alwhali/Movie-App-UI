import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:movie_app_ui/data/movie.dart';
import 'package:movie_app_ui/utils/colors.dart';
import 'package:movie_app_ui/widget/custom_card_normal.dart';
import 'package:movie_app_ui/widget/custom_card_thumbnail.dart';
import 'package:movie_app_ui/widget/genres_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<MovieModel> forYouItemList = forYouImages;
  List<MovieModel> forYouItemsList2 = List.of(forYouImages);
  List<MovieModel> popularItemsList = List.of(popularImages);
  List<MovieModel> genresItemsList = List.of(genresList);
  List<MovieModel> legendaryItemsList = List.of(legendaryImages);

  PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
  );
  int currentPage = 0;

  List tabBArIcons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.compass,
    FontAwesomeIcons.video,
    FontAwesomeIcons.person,
    // Icons.home,
    // Icons.favorite,
    // Icons.person,
    // Icons.search,
  ];

  //indicator
  List<Widget> buildPageIndicatorWidget() {
    List<Widget> list = [];
    for (int i = 0; i < forYouItemsList2.length; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      height: 8,
      width: 8,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white30,
        shape: BoxShape.circle,
      ),
      duration: Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // listIndicator = buildPageIndicatorWidget();

    Size size = MediaQuery.of(context).size;

    ThemeData themeData = ThemeData(
      primaryColor: kBackgroundColor,
      textTheme: TextTheme(
        headlineLarge: TextStyle(color: Colors.white, fontSize: 28),
        labelLarge: TextStyle(color: Color(0xFF7E7676), fontSize: 18),
        labelMedium: TextStyle(color: Color(0xFF7E7676), fontSize: 16),
      ),

      hintColor: Colors.white30,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,

      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hi, Ahmed",
                          style: themeData.textTheme.headlineLarge,
                        ),
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/actor_1.jpeg",
                              ),
                              radius: 20,
                            ),
                            Positioned(
                              right: 0,
                              top: 2,
                              child: Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    // search bar 0
                    // Padding(
                    // padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
                    // child:
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: kSearchbarColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: themeData.hintColor),
                          SizedBox(width: 20),
                          Text(
                            "Search for movies",
                            style: themeData.textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ),

                    // ),
                    SizedBox(height: 30),
                    //search bar 1
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Container(
                    //         height: 60,

                    //         padding: EdgeInsets.symmetric(
                    //           horizontal: 20,
                    //           vertical: 5,
                    //         ),
                    //         decoration: BoxDecoration(
                    //           color: kSearchbarColor,
                    //           borderRadius: BorderRadius.circular(10),
                    //         ),
                    //         child: Row(
                    //           children: [
                    //             Icon(
                    //               Icons.search,
                    //               color: themeData.hintColor,
                    //               size: 30,
                    //             ),
                    //             SizedBox(width: 10),
                    //             Expanded(
                    //               child: TextField(
                    //                 decoration: InputDecoration(
                    //                   border: InputBorder.none,
                    //                   hintText: "Search for movies",
                    //                   hintStyle: TextStyle(
                    //                     color: themeData.hintColor,
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 30),

                    // search bar 2
                    // SearchBar(
                    //   padding: WidgetStatePropertyAll(
                    //     EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    //   ),
                    //   leading: Icon(Icons.search, color: themeData.hintColor),
                    //   hintText: "Search for movies",
                    //   hintStyle: WidgetStateTextStyle.resolveWith(
                    //     (state) => themeData.textTheme.labelLarge!,
                    //   ),
                    //   backgroundColor: WidgetStateColor.resolveWith(
                    //     (states) => kSearchbarColor,
                    //   ),
                    //   shape: WidgetStateOutlinedBorder.resolveWith(
                    //     (states) => RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(20),
                    //       side: BorderSide(
                    //         color: states.contains(WidgetState.focused)
                    //             ? Colors.white
                    //             : Colors.transparent,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 30),
                    Text("For you", style: themeData.textTheme.labelLarge),

                    forYouCardsLayout(forYouItemsList2),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: kSearchbarColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: buildPageIndicatorWidget(),
                        ),
                      ),
                    ),

                    // pagenation image
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular",
                            style: themeData.textTheme.labelLarge,
                          ),
                          Text(
                            "See all",
                            style: themeData.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),

                    movieListBuilder(popularItemsList),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Genres", style: themeData.textTheme.labelLarge),
                          Text(
                            "See all",
                            style: themeData.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    genresMovieListBuilder(genresItemsList),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Legendary",
                            style: themeData.textTheme.labelLarge,
                          ),
                          Text(
                            "See all",
                            style: themeData.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    movieListBuilder(legendaryItemsList),
                  ],
                ),
              ),
            ),
          ),

          /// for bottom bar
          Positioned(
            left: 30,
            right: 30,
            bottom: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: kSearchbarColor.withValues(alpha: 0.5),

                  width: size.width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...tabBArIcons.map(
                        (icon) => FaIcon(
                          icon,
                          color: icon == tabBArIcons[0]
                              ? Colors.white
                              : Colors.white54,
                          size: 25,
                        ),
                      ),

                      // Icon(Icons.import_contacts, color: Colors.white, size: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget forYouCardsLayout(List<MovieModel> movieList) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.50,

      child: PageView.builder(
        controller: pageController,
        physics: ClampingScrollPhysics(),
        itemCount: movieList.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomCardThumbnail(
            imagePath: movieList[index].imageAsset.toString(),
          );
        },
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });
        },
      ),
    );
  }

  Widget movieListBuilder(List<MovieModel> movieList) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      child: ListView.builder(
        itemCount: movieList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomCardNormal(movieModel: movieList[index]);
        },
      ),
    );
  }

  Widget genresMovieListBuilder(List<MovieModel> genresMovieList) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.24,
      child: ListView.builder(
        itemCount: genresItemsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GenresCard(movieModel: genresMovieList[index]);
        },
      ),
    );
  }
}
