import 'package:movie_app/core/api_constants.dart';

class Movie {
  final String id;
  final String title;
  final String posterUrl;
  final String backdropUrl;
  final double rating;
  final String releaseYear;
  final List<String> genres;
  final String runtime;
  final String overview;
  final bool isFavorite;

  const Movie({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.backdropUrl,
    required this.rating,
    required this.releaseYear,
    required this.genres,
    required this.runtime,
    required this.overview,
    this.isFavorite = false,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    // poster URL Construction with fallback Placeholder
    final String posterPath = json['poster_path'] ?? '';
    final String fullPosterUrl = posterPath.isNotEmpty
        ? '${ApiConstants.imageBaseUrlW500}$posterPath'
        : 'https://via.placeholder.com/500x750?text=No+Poster';

    // Backdrop URL construction with fall back placeholder
    final String backdropPath = json['backdrop_path'] ?? '';
    final String fullBackdropUrl = backdropPath.isNotEmpty
        ? '${ApiConstants.imageBaseUrlOriginal}$backdropPath'
        : fullPosterUrl;

    final String releaseDate = json['release_date'] ?? '';
    final String year = releaseDate.length >= 4
        ? releaseDate.substring(0, 4)
        : 'N/A';

    return Movie(
      id: (json['id'] ?? 0).toString(),
      title: json['title'] ?? 'Untitled Movie',
      posterUrl: fullPosterUrl,
      backdropUrl: fullBackdropUrl,
      rating: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      releaseYear: year,
      genres: const [],
      runtime: 'N/A',
      overview: json['overview'] ?? 'No overview available.',
      isFavorite: false,
    );
  }

  Movie copyWith({
    String? id,
    String? title,
    String? posterUrl,
    String? backdropUrl,
    double? rating,
    String? releaseYear,
    List<String>? genres,
    String? runtime,
    String? overview,
    bool? isFavorite,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      posterUrl: posterUrl ?? this.posterUrl,
      backdropUrl: backdropUrl ?? this.backdropUrl,
      rating: rating ?? this.rating,
      releaseYear: releaseYear ?? this.releaseYear,
      genres: genres ?? this.genres,
      runtime: runtime ?? this.runtime,
      overview: overview ?? this.overview,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
