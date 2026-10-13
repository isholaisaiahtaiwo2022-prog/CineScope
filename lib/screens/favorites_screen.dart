import 'package:flutter/material.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/models/mock_movies.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/details_screen.dart';
import 'package:movie_app/widget/movie_poster_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Movie> favoriteMovies = mockPopularMovies
        .where((movie) => movie.isFavorite)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Favorites',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        elevation: 0,
        backgroundColor: AppColors.background,
      ),
      body: SafeArea(child: 
      favoriteMovies.isEmpty
      ? _buildEmptyState()
      : _buildFavoriteGrid(context, favoriteMovies),
      ),
    );
  }
}


// State 1: Rendered when user has 0 saved favorites
  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border_rounded,
            size: 64,
            color: AppColors.textSecondary,
          ),
          SizedBox(height: 16),
          Text(
            'No Favorites Yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Explore movies and tap the heart icon to add them here.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

Widget _buildFavoriteGrid(BuildContext context, List <Movie> movies){
  return GridView.builder(
    padding: const EdgeInsets.all(16),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.62 ,
      crossAxisSpacing: 12,
      mainAxisExtent: 16
    ),

    itemCount: movies.length,
    itemBuilder: (context, Index){
      final Movie = movies[Index];
      return MoviePosterCard(movie: Movie,
      width: double.infinity,
      

      onTap: (){
        Navigator.push(context,
        MaterialPageRoute(builder: (context)=> DetailsScreen(movie: Movie),)
        );
      },
      );
    },
  );
}