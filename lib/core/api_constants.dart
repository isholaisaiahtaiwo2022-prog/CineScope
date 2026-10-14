class ApiConstants {
  // Base TMDB URL
  static const String baseURL = 'https://api.themoviedb.org/3';

  // Free TMDB Read Access Token or API Key placeholder
  static const String apiKey = 'My Api Key';

  // TMDB Poster & Backdrop Image CDN URLs
  static const String imageBaseUrlW500 = 'https://image.tmdb.org/t3/p/w500';
  static const String imageBaseUrlOriginal = 'https://image.tmdb.org/t3/p/original';

  // Endpoint routes
  static const String popularEndpoint = '/movie/popular';
  static const String trendingEndpoint = '/trending/movie/day';
  static const String searchEndpoint = '/search/movie';
}
