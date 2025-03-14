import 'package:flutter/material.dart';
import 'category_screen.dart'; // 📌 카테고리 화면 추가

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({super.key});

  final List<Map<String, String>> albums = const [
    {'title': 'People', 'image': 'assets/images/people.jpg'},
    {'title': 'Animals', 'image': 'assets/images/animals.jpg'},
    {'title': 'Food', 'image': 'assets/images/food.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Albums")),
      body: GridView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: albums.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          CategoryScreen(category: albums[index]['title']!),
                ),
              );
            },
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    albums[index]['image']!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.black54,
                  child: Text(
                    albums[index]['title']!,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
