# Movie App UI

A **Flutter** based UI showcase for a movie browsing application. The app displays
different categories of movies (For You, Popular, Legendary) and allows users to
view details, cast information and comments.

## Features

* **Home screen** – scrollable lists of movies grouped by category.
* **Details screen** – shows the selected movie’s poster, rating, year, cast
  cards and user comments.
* **Data model** – all movie information lives in `lib/data/movie.dart` and is
  used throughout the UI. The README now includes a quick overview of the data
  structures and a few sample movies.

## Data Overview (from `lib/data/movie.dart`)

The core data model consists of three classes:

```dart
class MovieModel {
  String? imageAsset;
  String? movieName;
  String? movieRating;
  String? year;
  List<CastModel>? cast;
  List<CommentModel>? comments;
}

class CastModel {
  String? name;
  String? role;
  String? image;
}

class CommentModel {
  String? name;
  String? imageUrl;
  String? date;
  String? rating;
  String? comment;
}
```

### Sample Movies

* **Dune** – 2021, rating **8.3** – includes a full cast list and three user
  comments.
* **Shang‑Chi** – 2022, rating **6.4**.
* **Narcos** – 2020, rating **9.7**.
* **Stranger Things** – 2021, rating **9.2**.

These samples are defined in the `popularImages`, `legendaryImages` and
`genresList` collections inside `movie.dart`.

## Getting Started

1. **Install Flutter** – follow the official guide at
   https://flutter.dev/docs/get-started/install.
2. **Clone the repository** and fetch packages:

   ```bash
   git clone https://github.com/alwhali/Movie-App-UI.git
   cd Movie-App-UI
   flutter pub get
   ```
3. **Run the app** on an emulator or device:

   ```bash
   flutter run
   ```

## Resources

* [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
* [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
* Official Flutter documentation – https://docs.flutter.dev/
