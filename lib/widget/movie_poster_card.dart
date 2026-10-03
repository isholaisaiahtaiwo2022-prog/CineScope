import 'package:flutter/material.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/models/movie.dart';

class MoviePosterCard extends StatelessWidget {
  final Movie movie;
  final double? width;
  final VoidCallback? onTap;

  const MoviePosterCard({
    super.key,
    required this.movie,
    this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width ?? 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Movie Poster Image with Rounded Corners
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 2 / 3,
                child: Image.network(
                  movie.posterUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.surface,
                      child: const Icon(
                        Icons.broken_image,
                        color: AppColors.textSecondary,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 8,),

            Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(
              height: 4,
            ),


            Row(
              children: [
               const Icon(
                Icons.star_rounded,
                color: AppColors.accent,
                size: 16
               ),

               const SizedBox(width: 4,),


               Text(
                '${movie.rating}',
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500
                ),
               ),

               const SizedBox(width: 8,),


               Text(
                movie.releaseYear,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12
                ),
               )
              ],
            )
          ],
        ),
      ),
    );
  }
}
