import 'package:flutter/material.dart';
import '../models/photo.dart';

class PhotoZoomScreen extends StatelessWidget {
  final Photo photo;

  const PhotoZoomScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: photo.id,
            child: Image.asset(
              photo.url,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
