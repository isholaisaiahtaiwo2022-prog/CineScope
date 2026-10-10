import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/core/app_colors.dart';

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
                    errorBuilder: (context, error, StackTrace) {
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
                      backgroundColor: Colors.black.withOpacity(0.5),


                      child: IconButton(
                        onPressed: () => Navigator.pop(context), 
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  )
                )
              ],
            ),


            Padding(
              padding: const EdgeInsets.all(16.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // 2. Title & Favorite Action Row

                children: [
                  Expanded(
                    child: Text(
                      movie.title,

                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    )
                  ),

                  const SizedBox(
                    width: 12,
                  ),

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
                      )
                    ),
                  )
                ],
              ),
            ),
              const SizedBox(height: 8,),


            // 3. Metadata Row (Rating, Year, Runtime),

            Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: AppColors.accent,
                  size: 18,
                ),


                const SizedBox(
                  width: 4,
                ),

                Text(
                  '${movie.rating}/10',
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                  ),
                ),

                const SizedBox(
                  width: 16,
                ),

                Text(
                  movie.releaseYear,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14
                  ),
                ),


                const SizedBox(
                  width: 16,
                ),

                Text(
                  movie.runtime,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                )
              ],
            ),

            const SizedBox(
              height: 16,
            ),

            
          ],
        ),
      ),
    );
  }
}
