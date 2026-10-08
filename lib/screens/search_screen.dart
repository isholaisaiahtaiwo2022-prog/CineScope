import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/core/app_colors.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;

  const SearchScreen({
    super.key,
    required this.controller,
    this.onChanged,
    required this.onClear
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        onChanged: onChanged,

        decoration: InputDecoration(
          hintText: 'Search Movie',
          hintStyle: TextStyle(color: AppColors.textSecondary),

          prefixIcon: Icon(Icons.search, color: AppColors.textSecondary),

          filled: true,
          fillColor: AppColors.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
