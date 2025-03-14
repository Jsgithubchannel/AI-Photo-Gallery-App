import 'package:flutter/material.dart';
import '../models/photo.dart';
import '../data/dummy_photos.dart';

class CategoryScreen extends StatelessWidget {
  final String category; // 📌 선택한 카테고리

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // 📌 선택한 카테고리에 해당하는 사진만 필터링
    final List<Photo> categoryPhotos =
        dummyPhotos.where((photo) => photo.category == category).toList();

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: GridView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: categoryPhotos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              categoryPhotos[index].url,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          );
        },
      ),
    );
  }
}
