import 'package:flutter/material.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/models/mock_movies.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/widget/movie_poster_card.dart';
import 'package:movie_app/widget/search_bar_input.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _query = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = mockPopularMovies.where((movie) {
      return movie.title.toLowerCase().contains(_query.trim().toLowerCase());
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Searchbar Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchBarInput(
                controller: _searchController,
                onChanged: (userInput) {
                  setState(() {
                    _query = userInput;
                  });
                },

                onClear: _query.isNotEmpty ? _clearSearch : null,
              ),
            ),

            //  Dynamic State Views (Empty Query, No Results, Grid)
            Expanded(child: _buildBody(searchResults)),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(List<Movie> searchResults) {
    // User has not typed anything yet

    if (_query.trim().isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_rounded,
              size: 64,
              color: AppColors.textSecondary,
            ),

            SizedBox(height: 12),

            const Text(
              'No results',

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              'Enter your search search above.',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
          ],
        ),
      );
    }

    // State 2: Query entered, but no movies match
    if (searchResults.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Icon(
              Icons.movie_filter_outlined,
              size: 64,
              color: AppColors.textSecondary,
            ),

            const SizedBox(height: 12),

            const Text(
              'No Results',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 4),
            Text(
              'There are no results for "$_query".',

              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
          ],
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        const horizontalPadding = 16.0;
        const crossAxisSpacing = 12.0;
        const maxCardWidth = 190.0;
        final gridWidth = constraints.maxWidth - horizontalPadding * 2;
        final crossAxisCount =
            ((gridWidth + crossAxisSpacing) / (maxCardWidth + crossAxisSpacing))
                .floor()
                .clamp(2, 5)
                .toInt();
        final cardWidth =
            (gridWidth - crossAxisSpacing * (crossAxisCount - 1)) /
            crossAxisCount;
        final textScaler = MediaQuery.textScalerOf(context);
        final cardHeight =
            cardWidth * 1.5 + textScaler.scale(18) + textScaler.scale(16) + 20;

        return GridView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 8,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisExtent: cardHeight,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: 16,
          ),
          itemCount: searchResults.length,
          itemBuilder: (context, index) {
            final movie = searchResults[index];

            return MoviePosterCard(
              movie: movie,
              width: double.infinity,
              onTap: () {},
            );
          },
        );
      },
    );

    // return GridView.extent(
    //   padding: const EdgeInsets.symmetric(horizontal: 16),
    //   maxCrossAxisExtent: 190,
    //   crossAxisSpacing: 12,
    //   mainAxisExtent: 16,
    //   childAspectRatio: 0.6,
    //   children: searchResults.map((movie) {
    //     return MoviePosterCard(movie: movie);
    //   }).toList(),
    // );
  }
}
