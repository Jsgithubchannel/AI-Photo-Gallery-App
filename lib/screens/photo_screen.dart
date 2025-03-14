import 'package:flutter/material.dart';
import 'photo_detail_screen.dart';
import '../models/photo.dart';
import '../data/dummy_photos.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 사진을 월별로 필터링 (예: id 1~6 → November, 7~10 → October)
    final List<Photo> novemberPhotos =
        dummyPhotos.where((photo) => photo.id <= 6).toList();
    final List<Photo> octoberPhotos =
        dummyPhotos.where((photo) => photo.id > 6).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Photos")),
      body: ListView(
        children: [
          const Text(
            "November",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildPhotoGrid(novemberPhotos),
          const SizedBox(height: 20),
          const Text(
            "October",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildPhotoGrid(octoberPhotos),
        ],
      ),
    );
  }

  Widget _buildPhotoGrid(List<Photo> photos) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: photos.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhotoDetailScreen(photo: photos[index]),
              ),
            );
          },
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(photos[index].url),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                photos[index].title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
