import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/core/app_colors.dart';

class SearchBarInput extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;

  const SearchBarInput({
    super.key,
    this.controller,
    this.onChanged,
    this.onClear
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
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
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
