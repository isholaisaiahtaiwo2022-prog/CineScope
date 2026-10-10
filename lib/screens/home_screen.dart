import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/models/mock_movies.dart';
import 'package:movie_app/widget/movie_poster_card.dart';
import 'package:movie_app/widget/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsetsGeometry.only(left: 10),

                child: Text(
                  'CineScope',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    letterSpacing: 0.5,
                  ),
                ),
              ),

              const SectionHeader(title: 'Popular Movie'),

              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: mockPopularMovies.length,
                  itemBuilder: (context, index) {
                    final movie = mockPopularMovies[index];

                    return Padding(
                      
                      padding: const EdgeInsets.only(right: 12),

                      child: MoviePosterCard(movie: movie, width: 130),
                    );
                  },
                ),
              ),

              SizedBox(height: 10),

              const SectionHeader(title: 'Trending Movie'),

              SizedBox(
                height: 250,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  // scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: mockTrendingMovies.length,
                  itemBuilder: (context, index) {
                    final movie = mockTrendingMovies[index];

                    return Padding(
                      padding: const EdgeInsets.only(right: 12),

                      child: MoviePosterCard(movie: movie, width: 130),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
