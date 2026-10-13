import 'package:flutter/material.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/models/mock_movies.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/widget/movie_poster_card.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          // 1. Backdrop Banner with Overlay Back Button
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,

                  child: Image.network(
                    movie.backdropUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.surface,

                        child: const Icon(
                          Icons.broken_image,
                          color: AppColors.textSecondary,
                          size: 48,
                        ),
                      );
                    },
                  ),
                ),

                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withValues(alpha: 0.5),

                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                // 2. Title & Favorite Action Row
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          movie.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      CircleAvatar(
                        backgroundColor: AppColors.surface,

                        child: IconButton(
                          onPressed: () {
                            // Favorite toggle will be connected via Provider later
                          },
                          icon: Icon(
                            movie.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,

                            color: movie.isFavorite
                                ? Colors.red
                                : AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // 3. Metadata Row (Rating, Year, Runtime),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 8,
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: AppColors.accent,
                  size: 18,
                ),

                const SizedBox(width: 4),

                Text(
                  '${movie.rating}/10',
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(width: 16),

                Text(
                  movie.releaseYear,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(width: 16),

                Text(
                  movie.runtime,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // 4. Genre Badges (Wrap Widget),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ...movie.genres.map((genre) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),

                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Text(
                          genre,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                      );
                    }),
                  ],
                ),

                const SizedBox(height: 20),

                // 5. Watch Trailer Primary Button
                SizedBox(
                  width: double.infinity,
                  height: 48,

                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      foregroundColor: AppColors.background,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.play_arrow_rounded),
                    label: const Text(
                      'Watch Trailer',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      // Trailer playback trigger placeholder
                    },
                  ),
                ),

                const SizedBox(height: 24),

                // 6. Overview Text
                const Text(
                  'Overview',

                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  movie.overview,

                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 24),

                // 7. Similar Movies Carousel
                const Text(
                  'Similar Movies',

                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mockPopularMovies.length,
                    itemBuilder: (context, index) {
                      final similarMovie = mockPopularMovies[index];

                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),

                        child: MoviePosterCard(
                          movie: similarMovie,
                          width: 120,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsScreen(movie: similarMovie),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
