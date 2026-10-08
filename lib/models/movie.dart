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
}
