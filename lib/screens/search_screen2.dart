// import 'package:flutter/material.dart';
// import 'package:movie_app/models/mock_movies.dart';

// class SearchScreen2 extends StatefulWidget {
//   const SearchScreen2({super.key});

//   @override
//   State<SearchScreen2> createState() => _SearchScreen2State();
// }

// class _SearchScreen2State extends State<SearchScreen2> {
//   final TextEditingController _searchController = TextEditingController();
//   String _query = '';

//   @override
//   Widget build(BuildContext context) {
//     final _searchResults = mockPopularMovies.where((movie) {
//       return movie.title.toString().contains(_query.trim().toLowerCase());
//     }).toList();
//     return Scaffold();
//   }
// }
